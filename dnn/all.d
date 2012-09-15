/**
 * Neural network implementation in D
 *
 * Authors: Daniel Domazer
 *
 * Example:
 * ---
 * import std.stdio;
 * void main() {
 *     writeln("creating feed forward network ...");
 *     IActivationFunction activationFunction = new SigmoidActivation();
 *     FeedForwardBuilder builder = new FeedForwardBuilder();
 *     builder.setInputLayer(2, activationFunction);
 *     builder.appendHiddenLayer(2, activationFunction);
 *     builder.setOutputLayer(1, activationFunction);
 *     FeedForwardNetwork network = builder.construct();
 *
 *     float[][] inputs = [[0, 0], [0, 1], [1, 0], [1, 1]];
 *     float[][] expectedOutputs = [[0], [1], [1], [0]];
 *     float error = 0.001;
 *     uint maxRounds = 50_000;
 *     float rate = 0.6;
 *     float momentum = 0.3;
 *
 *     uint interval = 1000;
 *     uint column;
 *
 *     writeln("training network ...");
 *     BackPropagation bp = new BackPropagation(new MSE(), error, rate, momentum, maxRounds);
 *     bp.setProgressCallback(interval, delegate(uint currentRound, float currentError) {
 *             if ((++column % 4) == 0) {
 *                 column = 0;
 *                 writefln("%5d: %f", currentRound, currentError);
 *             } else
 *             writef("%5d: %f | ", currentRound, currentError);
 *         });
 *     bp.train(network, new RoundRobinProvider(inputs, expectedOutputs));
 *     if (column != 0)
 *         writeln("");
 *
 *     writeln("network output after training:");
 *     writefln("compute(0, 0): %f", network.compute([0.0, 0.0])[0]);
 *     writefln("compute(0, 1): %f", network.compute([0.0, 1.0])[0]);
 *     writefln("compute(1, 0): %f", network.compute([1.0, 0.0])[0]);
 *     writefln("compute(1, 1): %f", network.compute([1.0, 1.0])[0]);
 * }
 * ---
 */
module dnn.all;

public {
	import dnn.activation.model.IActivationFunction;
	import dnn.activation.BipolarSigmoidActivation;
	import dnn.activation.BipolarStepActivation;
	import dnn.activation.ScalableActivation;
	import dnn.activation.SigmoidActivation;
	import dnn.activation.StepActivation;
	
	import dnn.cost.model.ICostFunction;
	import dnn.cost.ATE;
	import dnn.cost.MSE;
	import dnn.cost.RMSE;
	import dnn.cost.SSE;
	
	import dnn.creation.FeedForwardBuilder;
	import dnn.creation.RandomGenerator;
	
	import dnn.learning.model.ILearningFunction;
	import dnn.learning.model.ITrainingDataProvider;
	import dnn.learning.BackPropagation;
	import dnn.learning.GrowingWindowProvider;
	import dnn.learning.MovingWindowProvider;
	import dnn.learning.RoundRobinProvider;
	import dnn.learning.TrainingDataProvider;
	
	import dnn.network.model.ILayer;
	import dnn.network.model.INeuralNetwork;
	import dnn.network.model.INeuron;
	import dnn.network.model.IWeight;
	import dnn.network.FeedForwardNetwork;
	import dnn.network.Layer;
	import dnn.network.MemoryNeuron;
	import dnn.network.Neuron;
	import dnn.network.Weight;
}
