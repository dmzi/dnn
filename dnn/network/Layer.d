/**
 * Implementation of ILayer
 *
 * Authors: Daniel Domazer
 */
module dnn.network.Layer;

import dnn.network.model.ILayer;
import dnn.network.model.INeuron;

/**
 * Implementation of ILayer
 */
class Layer : ILayer {
	private INeuron[] m_neurons;
	
	/**
	 * Constructor
	 */
	public this(INeuron[] neurons) {
		m_neurons = neurons;
	}
	
	/**
	 *
	 */
	public float[] pulse(float[] input) {
		foreach (uint i, INeuron n; m_neurons)
			n.pulse(input[i]);
		return output();
	}
	
	/**
	 *
	 */
	public float[] pulse() {
		foreach (INeuron n; m_neurons)
			n.pulse();
		return output();
	}
	
	/**
	 *
	 */
	public @property INeuron[] neurons() {
		return m_neurons;
	}
	
	/**
	 *
	 */
	public @property float[] output() {
		float[] tmp;
		tmp.length = m_neurons.length;
		foreach (uint i, INeuron n; m_neurons)
			tmp[i] = n.output;
		return tmp;
	}
}
