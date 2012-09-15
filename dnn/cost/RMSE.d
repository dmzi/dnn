/**
 * Root mean squared error implementation of ICostFunction
 *
 * Authors: Daniel Domazer
 */
module dnn.cost.RMSE;

import std.math;

import dnn.cost.model.ICostFunction;

/**
 * Root mean squared error implementation of ICostFunction
 */
class RMSE : ICostFunction {
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
		
		return sqrt(error);
	}
}
