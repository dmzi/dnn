/**
 * Cost function interface
 *
 * Authors: Daniel Domazer
 */
module dnn.cost.model.ICostFunction;

/**
 * Cost function interface
 */
interface ICostFunction {
	/**
	 *
	 */
	public float f(float[] actualOutput, float[] expectedOutput);
}
