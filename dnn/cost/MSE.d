/**
 * Mean squared error implementation of ICostFunction
 *
 * Authors: Daniel Domazer
 */
module dnn.cost.MSE;

import dnn.cost.model.ICostFunction;

/**
 * Mean squared error implementation of ICostFunction
 */
class MSE : ICostFunction {
	/**
	 *
	 */
	public float f(float[] actualOutput, float[] expectedOutput) {
		float error = 0;
		
		for (uint i=0; i < actualOutput.length; i++) {
			float tmp = expectedOutput[i] - actualOutput[i];
			error += tmp * tmp;
		}
		
		error /= actualOutput.length;
		
		return error;
	}
}
