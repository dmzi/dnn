/**
 * BackPropagation implementation of ILearningFunction
 *
 * Authors: Daniel Domazer
 */
module dnn.learning.BackPropagation;

import dnn.cost.model.ICostFunction;
import dnn.learning.model.ILearningFunction;
import dnn.learning.model.ITrainingDataProvider;
import dnn.network.model.ILayer;
import dnn.network.model.INeuron;
import dnn.network.model.IWeight;
import dnn.network.FeedForwardNetwork;

/**
 * BackPropagation implementation of ILearningFunction
 */
class BackPropagation : ILearningFunction {
	private ICostFunction m_costFunction;
	private float m_targetError;
	private float m_trainingRate;
	private float m_momentum;
	private uint m_maxRounds;
	
	private ProgressCallback m_callback = null;
	private uint m_callbackInterval;
	
	private float[INeuron] m_neuronErrors;
	private float[INeuron] m_biasChanges;
	private float[IWeight] m_weightChanges;
	
	/**
	 *
	 */
	public this(ICostFunction costFunction, float targetError = 0.01, float trainingRate = 0.1, float momentum = 0.2, uint maxRounds = 5_000) {
		m_targetError = targetError;
		m_maxRounds = maxRounds;
		m_trainingRate = trainingRate;
		m_momentum = momentum;
		m_costFunction = costFunction;
	}
	
	/**
	 *
	 */
	public void setProgressCallback(uint interval, ProgressCallback callback) {
		m_callbackInterval = interval;
		m_callback = callback;
	}
	
	/**
	 *
	 */
	public float train(FeedForwardNetwork network, ITrainingDataProvider provider) {
		float error = 0;
		uint currentRound = 0;
		
		do {
			float[][2] next = provider.next();
			float[] output = network.compute(next[0]);
			
			error += backpropagate(network, next[0], next[1]);
			
			if (provider.currentRound() > currentRound) {
				currentRound = provider.currentRound();
				if ((m_callback !is null) && (provider.currentRound() % m_callbackInterval == 0))
					m_callback(provider.currentRound(), error);
				
				if (error <= m_targetError)
					break;
				if (provider.currentRound() <= m_maxRounds)
					error = 0;
			}
		} while (provider.currentRound() <= m_maxRounds);
		
		return error;
	}
	
	/**
	 *
	 */
	private float backpropagate(FeedForwardNetwork network, float[] inputs, float[] expectedOutputs) {
		foreach (uint i, INeuron n; network.outputLayer.neurons)
			m_neuronErrors[n] = (expectedOutputs[i] - n.output) * n.activationFunction.derivative(n.weightedInput);
		
		foreach_reverse (ILayer l; network.hiddenLayers)
			foreach (INeuron n; l.neurons) {
				float error = 0;
				
				foreach (IWeight w; n.outputWeights)
					error += m_neuronErrors[w.to] * w.weight;
				
				m_neuronErrors[n] = error * n.activationFunction.derivative(n.weightedInput);
			}
		
		updateWeights(network);
		
		return m_costFunction.f(network.compute(inputs), expectedOutputs);
	}
	
	/**
	 *
	 */
	private void updateWeights(FeedForwardNetwork network) {
		void updateLayerWeights(ILayer layer) {
			foreach (INeuron n; layer.neurons) {
				foreach (IWeight w; n.inputWeights) {
					float value = m_trainingRate * m_neuronErrors[n] * w.from.output;
					
					if (w in m_weightChanges)
						value += m_momentum * m_weightChanges[w];
					
					m_weightChanges[w] = value;
					w.weight = w.weight + value;
				}
				
				float value = m_trainingRate * m_neuronErrors[n];
				
				if (n in m_biasChanges)
					value += m_momentum * m_biasChanges[n];
				
				m_biasChanges[n] = value;
				n.bias = n.bias + value;
			}
		}
		
		updateLayerWeights(network.outputLayer);
		
		foreach_reverse (ILayer l; network.hiddenLayers)
			updateLayerWeights(l);
	}
}
