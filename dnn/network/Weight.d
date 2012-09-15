/**
 * Implementation of IWeight
 *
 * Authors: Daniel Domazer
 */
module dnn.network.Weight;

import dnn.network.model.INeuron;
import dnn.network.model.IWeight;

/**
 * Implementation of IWeight
 */
class Weight : IWeight {
	private INeuron m_from = null;
	private INeuron m_to = null;
	private float m_weight;
	private float m_output;
	
	/**
	 *
	 */
	public this(INeuron from, INeuron to, float weight, bool passToNeurons = false) {
		m_from = from;
		m_to = to;
		m_weight = weight;
		if (passToNeurons) {
			m_from.outputTo(this);
			m_to.inputFrom(this);
		}
	}
	
	/**
	 *
	 */
	public float pulse(float input) {
		m_output = input * m_weight;
		return m_output;
	}
	
	/**
	 *
	 */
	public @property float output() {
		return m_output;
	}
	
	/**
	 *
	 */
	public @property float weight() {
		return m_weight;
	}
	
	/**
	 *
	 */
	public @property void weight(float weight) {
		m_weight = weight;
	}
	
	/**
	 *
	 */
	public @property INeuron from() {
		return m_from;
	}
	
	/**
	 *
	 */
	public @property void from(INeuron neuron) {
		m_from = from;
	}
	
	/**
	 *
	 */
	public @property INeuron to() {
		return m_to;
	}
	
	/**
	 *
	 */
	public @property void to(INeuron neuron) {
		m_to = neuron;
	}
}
