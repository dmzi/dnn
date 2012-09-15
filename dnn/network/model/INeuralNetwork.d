/**
 * NeuralNetwork interface
 *
 * Authors: Daniel Domazer
 */
module dnn.network.model.INeuralNetwork;

/**
 * NeuralNetwork interface
 */
interface INeuralNetwork {
	/**
	 * Computes the output of the neural network.
	 *
	 * Params:
	 *  inputs = Array of input values.
	 * Returns: Array of output values.
	 */
	public float[] compute(float[] inputs);
}
