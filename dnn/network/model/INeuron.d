/**
 * Neuron interface
 *
 * Authors: Daniel Domazer
 */
module dnn.network.model.INeuron;

import dnn.activation.model.IActivationFunction;
import dnn.network.model.IWeight;

/**
 * Neuron interface
 */
interface INeuron {
	/**
	 * Passes the input value into the neuron and outgoing weights, ignoring all incoming weights.
	 *
	 * Used by the input layer which has no incoming weights.
	 *
	 * Params:
	 *  input = Input value.
	 * Returns: Output value.
	 */
	public float pulse(float input);
	
	/**
	 * Collects values from all incoming weights and passes the result to the outgoing weights.
	 *
	 * Returns: Output value.
	 */
	public float pulse();
	
	/**
	 *
	 */
	public @property float weightedInput();
	
	/**
	 *
	 */
	public @property float output();
	
	/**
	 *
	 */
	public @property IActivationFunction activationFunction();
	
	/**
	 *
	 */
	public @property IWeight[] inputWeights();
	
	/**
	 *
	 */
	public @property IWeight[] outputWeights();
	
	/**
	 *
	 */
	public @property float bias();
	
	/**
	 *
	 */
	public @property void bias(float bias);
	
	/*
	 *
	 */
	public void outputTo(IWeight weight, bool passToOtherNeuron = false);
	
	/*
	 *
	 */
	public void inputFrom(IWeight weight, bool passToOtherNeuron = false);
}
