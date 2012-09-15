/**
 * Sigmoid implementation of ScalableActivation
 *
 * Authors: Daniel Domazer
 */
module dnn.activation.SigmoidActivation;

import std.math;

import dnn.activation.ScalableActivation;

/**
 * Sigmoid implementation of ScalableActivation
 */
class SigmoidActivation : ScalableActivation {
	/**
	 *
	 */
	public this(float alpha = 1.0) {
		super(alpha);
	}
	
	/**
	 *
	 */
	public float f(float value) {
		return 1.0 / (1.0 + exp(m_alpha * -value));
	}
	
	/**
	 *
	 */
	public float derivative(float value) {
		float s = f(value);
		return m_alpha * s * (1.0 - s);
	}
}
