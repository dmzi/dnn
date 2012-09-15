/**
 * Implementation of INeuralNetwork
 *
 * Authors: Daniel Domazer
 */
module dnn.network.FeedForwardNetwork;

import dnn.network.model.ILayer;
import dnn.network.model.INeuralNetwork;

/**
 * Implementation of INeuralNetwork
 */
class FeedForwardNetwork : INeuralNetwork {
	private ILayer m_inputLayer;
	private ILayer[] m_hiddenLayers;
	private ILayer m_outputLayer;
	
	/**
	 * Constructor
	 */
	public this(ILayer inputLayer, ILayer[] hiddenLayers, ILayer outputLayer) {
		m_inputLayer = inputLayer;
		m_hiddenLayers = hiddenLayers;
		m_outputLayer = outputLayer;
	}
	
	/**
	 * Computes the output of the neural network.
	 *
	 * Params:
	 *  inputs = Array of input values.
	 * Returns: Array of output values.
	 */
	public float[] compute(float[] inputs) {
		m_inputLayer.pulse(inputs);
		foreach (ILayer l; m_hiddenLayers)
			l.pulse();
		m_outputLayer.pulse();
		return m_outputLayer.output;
	}
	
	/**
	 *
	 */
	public @property ILayer inputLayer() {
		return m_inputLayer;
	}
	
	/**
	 *
	 */
	public @property ILayer[] hiddenLayers() {
		return m_hiddenLayers;
	}
	
	/**
	 *
	 */
	public @property ILayer outputLayer() {
		return m_outputLayer;
	}
}
