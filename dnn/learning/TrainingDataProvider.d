/**
 * Abstract implementation of ITrainingDataProvider
 *
 * Authors: Daniel Domazer
 */
module dnn.learning.TrainingDataProvider;

import dnn.learning.model.ITrainingDataProvider;

/**
 * Abstract implementation of ITrainingDataProvider
 */
abstract class TrainingDataProvider : ITrainingDataProvider {
	protected float[][] m_inputs;
	protected float[][] m_expectedOutputs;
	protected uint m_currentRound = 1;
	
	/**
	 *
	 */
	public this(float[][] inputs, float[][] expectedOutputs) {
		m_inputs = inputs;
		m_expectedOutputs = expectedOutputs;
	}
	
	/**
	 *
	 */
	public ulong count() {
		return m_inputs.length;
	}
	
	/**
	 *
	 */
	public uint currentRound() {
		return m_currentRound;
	}
}
