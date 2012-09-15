/**
 * Activation function interface
 *
 * Authors: Daniel Domazer
 */
module dnn.activation.model.IActivationFunction;

/**
 * Activation function interface
 */
interface IActivationFunction {
	/**
	 *
	 */
	public float f(float value);
	
	/**
	 *
	 */
	public float derivative(float value);
}
