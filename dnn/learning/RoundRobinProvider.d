/**
 * Round Robin implementation of TrainingDataProvider
 *
 * Authors: Daniel Domazer
 */
module dnn.learning.RoundRobinProvider;

import dnn.learning.TrainingDataProvider;

/**
 * Round Robin implementation of TrainingDataProvider
 */
class RoundRobinProvider : TrainingDataProvider {
	private uint m_pos = 0;
	
	/**
	 *
	 */
	public this(float[][] inputs, float[][] expectedOutputs) {
		super(inputs, expectedOutputs);
	}
	
	/**
	 *
	 */
	public float[][2] next() {
		float[][2] tmp = [m_inputs[m_pos], m_expectedOutputs[m_pos]];
		if (++m_pos >= m_inputs.length) {
			m_pos = 0;
			m_currentRound++;
		}
		return tmp;
	}
}
