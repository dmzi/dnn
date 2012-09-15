/**
 * Learning function interface
 *
 * Authors: Daniel Domazer
 */
module dnn.learning.model.ILearningFunction;

import dnn.learning.model.ITrainingDataProvider;
import dnn.network.FeedForwardNetwork;

alias void delegate(uint currentRound, float currentError) ProgressCallback;

/**
 * Learning function interface
 */
interface ILearningFunction {
	/**
	 *
	 */
	public void setProgressCallback(uint interval, ProgressCallback callback);
	
	/**
	 *
	 */
	public float train(FeedForwardNetwork network, ITrainingDataProvider provider);
}
