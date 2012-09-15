/**
 * Weight interface
 *
 * Authors: Daniel Domazer
 */
module dnn.network.model.IWeight;

import dnn.network.model.INeuron;

/**
 * Weight interface
 */
interface IWeight {
	/**
	 *
	 */
	public float pulse(float input);
	
	/**
	 *
	 */
	public @property float output();
	
	/**
	 *
	 */
	public @property float weight();
	
	/**
	 *
	 */
	public @property void weight(float weight);
	
	/**
	 *
	 */
	public @property INeuron from();
	
	/**
	 *
	 */
	public @property void from(INeuron neuron);
	
	/**
	 *
	 */
	public @property INeuron to();
	
	/**
	 *
	 */
	public @property void to(INeuron neuron);
}
