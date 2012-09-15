/**
 * Builder to create feed forward networks.
 *
 * Authors: Daniel Domazer
 */
module dnn.creation.FeedForwardBuilder;

import dnn.activation.model.IActivationFunction;
import dnn.creation.RandomGenerator;
import dnn.network.model.ILayer;
import dnn.network.model.INeuron;
import dnn.network.FeedForwardNetwork;
import dnn.network.Layer;
import dnn.network.Neuron;
import dnn.network.Weight;

/**
 * Builder to create feed forward networks.
 */
class FeedForwardBuilder {
	private RandomGenerator m_rnd;
	
	private ILayer m_inputLayer;
	private ILayer[] m_hiddenLayers;
	private ILayer m_outputLayer;
	
	/**
	 *
	 */
	public this(RandomGenerator rnd = new RandomGenerator(-2.0, 2.0)) {
		m_rnd = rnd;
	}
	
	/**
	 *
	 */
	public void setInputLayer(uint neuronCount, IActivationFunction activationFunction) {
		m_inputLayer = createLayer(neuronCount, activationFunction, 0.0);
	}
	
	/**
	 *
	 */
	public void appendHiddenLayer(uint neuronCount, IActivationFunction activationFunction) {
		m_hiddenLayers ~= createLayer(neuronCount, activationFunction);
	}
	
	/**
	 *
	 */
	public void setOutputLayer(uint neuronCount, IActivationFunction activationFunction) {
		m_outputLayer = createLayer(neuronCount, activationFunction);
	}
	
	/**
	 *
	 */
	public FeedForwardNetwork construct() {
		connectLayers(m_inputLayer, m_hiddenLayers, m_outputLayer, m_rnd);
		return new FeedForwardNetwork(m_inputLayer, m_hiddenLayers, m_outputLayer);
	}
	
	/**
	 *
	 */
	private Layer createLayer(uint neuronCount, IActivationFunction activationFunction, float bias = 1.0) {
		INeuron[] neurons;
		neurons.length = neuronCount;
		for (uint i=0; i < neurons.length; i++)
			neurons[i] = new Neuron(activationFunction, bias);
		return new Layer(neurons);
	}
	
	/**
	 *
	 */
	private static void connectLayers(ILayer iLayer, ILayer[] hLayers, ILayer oLayer, RandomGenerator rnd) {
		if (hLayers.length > 0) {
			connectLayers(iLayer, hLayers[0], rnd);
			if (hLayers.length >= 2)
				for (uint i=0; i < hLayers.length-1; i++)
					connectLayers(hLayers[i], hLayers[i+1], rnd);
			connectLayers(hLayers[hLayers.length-1], oLayer, rnd);
		} else
			connectLayers(iLayer, oLayer, rnd);
	}
	
	/**
	 *
	 */
	private static void connectLayers(ILayer layer1, ILayer layer2, RandomGenerator rnd) {
		foreach (INeuron n1; layer1.neurons)
			foreach (INeuron n2; layer2.neurons)
				new Weight(n1, n2, rnd.get(), true);
	}
}
