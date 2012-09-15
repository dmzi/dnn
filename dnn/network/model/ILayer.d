/**
 * Layer interface
 *
 * Authors: Daniel Domazer
 */
module dnn.network.model.ILayer;

import dnn.network.model.INeuron;

/**
 * Layer interface
 */
interface ILayer {
	/**
	 *
	 */
	public float[] pulse(float[] input);
	
	/**
	 *
	 */
	public float[] pulse();
	
	/**
	 *
	 */
	public @property INeuron[] neurons();
	
	/**
	 *
	 */
	public @property float[] output();
}
