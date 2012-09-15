/**
 * Abstract scalable implementation of IActivationFunction
 *
 * Authors: Daniel Domazer
 */
module dnn.activation.ScalableActivation;

import std.math;

import dnn.activation.model.IActivationFunction;

/**
 * Abstract scalable implementation of IActivationFunction
 */
abstract class ScalableActivation : IActivationFunction {
	protected float m_alpha;
	
	/**
	 *
	 */
	public this(float alpha) {
		m_alpha = alpha;
	}
}
