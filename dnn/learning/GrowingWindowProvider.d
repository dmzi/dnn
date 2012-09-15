/**
 * Growing window implementation of TrainingDataProvider
 *
 * Authors: Daniel Domazer
 */
module dnn.learning.GrowingWindowProvider;

import dnn.learning.TrainingDataProvider;

/**
 * Growing window implementation of TrainingDataProvider
 */
class GrowingWindowProvider : TrainingDataProvider {
	/**
	 *
	 */
	public this(float[][] inputs, float[][] expected_outputs) {
		super(inputs, expected_outputs);
	}
	
	/**
	 *
	 */
	public float[][2] next() {
		// TODO
		return [[], []];
	}
}
