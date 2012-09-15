/**
 * Moving window implementation of TrainingDataProvider
 *
 * Authors: Daniel Domazer
 */
module dnn.learning.MovingWindowProvider;

import std.stdio;

import dnn.learning.TrainingDataProvider;

/**
 * Moving window implementation of TrainingDataProvider
 */
class MovingWindowProvider : TrainingDataProvider {
	private uint m_windowSize;
	private uint m_windowPos = 0;
	private uint m_pos = 0;
	
	/**
	 *
	 */
	public this(float[][] inputs, float[][] expected_outputs, uint windowSize) {
		super(inputs, expected_outputs);
		m_windowSize = windowSize;
	}
	
	/**
	 *
	 */
	public float[][2] next() {
		float[][2] tmp = [m_inputs[m_pos], m_expectedOutputs[m_pos]];
		if (++m_pos >= (m_windowPos + m_windowSize)) {
			if (++m_windowPos > (m_inputs.length - m_windowSize)) {
				m_windowPos = 0;
				m_currentRound++;
			}
			m_pos = m_windowPos;
		}
		return tmp;
	}
}
