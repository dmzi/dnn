/**
 * Step implementation of ScalableActivation
 *
 * Authors: Daniel Domazer
 * Date: 2012-06-05
 */
module dnn.activation.BipolarStepActivation;

import dnn.activation.ScalableActivation;

/**
 * Step implementation of ScalableActivation
 */
class BipolarStepActivation : ScalableActivation {
	/**
	 *
	 */
	public this(float threshold = 0.0) {
		super(threshold);
	}
	
	/**
	 *
	 */
	public float f(float value) {
		return (value >= m_alpha) ? 1.0 : -1.0;
	}
	
	/**
	 *
	 */
	public float derivative(float value) {
		return 0.0;
	}
}
