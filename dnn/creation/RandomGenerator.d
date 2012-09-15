/**
 * Implementation for generating float numbers
 *
 * Authors: Daniel Domazer
 */
module dnn.creation.RandomGenerator;

import std.random;

/**
 * Implementation for generating float numbers
 */
class RandomGenerator {
	private float m_lowerLimit;
	private float m_upperLimit;
	
	/**
	 *
	 */
	public this(float lowerLimit, float upperLimit) {
		m_lowerLimit = lowerLimit;
		m_upperLimit = upperLimit;
	}
	
	/**
	 *
	 */
	public float get() {
		return uniform(m_lowerLimit, m_upperLimit);
	}
}
