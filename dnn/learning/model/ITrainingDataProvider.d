/**
 * Training data provider interface
 *
 * Authors: Daniel Domazer
 */
module dnn.learning.model.ITrainingDataProvider;

/**
 * Training data provider interface
 */
interface ITrainingDataProvider {
	/**
	 *
	 */
	public float[][2] next();
	
	/**
	 *
	 */
	public ulong count();
	
	/**
	 *
	 */
	public uint currentRound();
}
