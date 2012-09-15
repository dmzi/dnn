/**
 * Implementation of INeuron
 *
 * Authors: Daniel Domazer
 */
module dnn.network.Neuron;

import dnn.activation.model.IActivationFunction;
import dnn.network.model.INeuron;
import dnn.network.model.IWeight;

/**
 * Implementation of INeuron
 */
class Neuron : INeuron {
	private IWeight[] m_inputWeights;
	private IWeight[] m_outputWeights;
	private float m_bias;
	private IActivationFunction m_activationFunction;
	
	private float m_weightedInput;
	private float m_output;
	
	/**
	 * Constructor
	 */
	public this(IActivationFunction activationFunction, float bias = 1.0) {
		m_bias = bias;
		m_activationFunction = activationFunction;
	}
	
	/**
	 * Passes the input value into the neuron and outgoing weights, ignoring all incoming weights.
	 *
	 * Used by the input layer which has no incoming weights.
	 *
	 * Params:
	 *  input = Input value.
	 * Returns: Output value.
	 */
	public float pulse(float input) {
		m_weightedInput = input;
		if (m_activationFunction !is null)
			m_output = m_activationFunction.f(input);
		else
			m_output = input;
		foreach (IWeight w; m_outputWeights)
			w.pulse(m_output);
		return m_output;
	}
	
	/**
	 * Collects values from all incoming weights and passes the result to the outgoing weights.
	 *
	 * Returns: Output value.
	 */
	public float pulse() {
		float tmp = 0;
		foreach (IWeight w; m_inputWeights)
			tmp += w.output;
		tmp += m_bias;
		return pulse(tmp);
	}
	
	/**
	 *
	 */
	public @property float weightedInput() {
		return m_weightedInput;
	}
	
	/**
	 *
	 */
	public @property float output() {
		return m_output;
	}
	
	/**
	 *
	 */
	public @property IActivationFunction activationFunction() {
		return m_activationFunction;
	}
	
	/**
	 *
	 */
	public @property IWeight[] inputWeights() {
		return m_inputWeights;
	}
	
	/**
	 *
	 */
	public@property IWeight[] outputWeights() {
		return m_outputWeights;
	}
	
	/**
	 *
	 */
	public @property float bias() {
		return m_bias;
	}
	
	/**
	 *
	 */
	public @property void bias(float bias) {
		m_bias = bias;
	}
	
	/**
	 *
	 */
	public void outputTo(IWeight weight, bool passToOtherNeuron = false) {
		m_outputWeights ~= weight;
		if (passToOtherNeuron)
			weight.to.inputFrom(weight, false);
	}
	
	/**
	 *
	 */
	public void inputFrom(IWeight weight, bool passToOtherNeuron = false) {
		m_inputWeights ~= weight;
		if (passToOtherNeuron)
			weight.from.outputTo(weight, false);
	}
}
