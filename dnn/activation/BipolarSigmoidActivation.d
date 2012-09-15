/**
 * Bipolar sigmoid implementation of ScalableActivation
 *
 * Authors: Daniel Domazer
 */
module dnn.activation.BipolarSigmoidActivation;

import std.math;

import dnn.activation.ScalableActivation;

/**
 * Bipolar sigmoid implementation of ScalableActivation
 */
class BipolarSigmoidActivation : ScalableActivation {
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
		return 2.0 / (1.0 + exp(m_alpha * -value)) - 1;
	}
	
	/**
	 *
	 */
	public float derivative(float value) {
		float s = f(value);
		return m_alpha * (1.0 - s * s) / 2;
	}
}
