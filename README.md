# dnn

A Neural network library written in D.

There are still a lot of things to implement or change but it is usable.

## build

Build script will follow.

## usage

```d
import dnn.all;

import std.stdio;

void main() {
	writeln("creating feed forward network ...");
	// create a fully connected feed forward network
	IActivationFunction activationFunction = new SigmoidActivation();
	FeedForwardBuilder builder = new FeedForwardBuilder();
	builder.setInputLayer(2, activationFunction);
	builder.appendHiddenLayer(2, activationFunction);
	builder.setOutputLayer(1, activationFunction);
	FeedForwardNetwork network = builder.construct();
	
	// XOR data to train
	float[][] inputs = [[0, 0], [0, 1], [1, 0], [1, 1]];
	float[][] expectedOutputs = [[0], [1], [1], [0]];
	
	// settings for the backpropagation
	float error = 0.001;
	uint maxRounds = 50_000;
	float rate = 0.6;
	float momentum = 0.3;

	uint interval = 1000;
	
	writeln("training network ...");
	
	// create algorithm instance and train network
	BackPropagation bp = new BackPropagation(new MSE(), error, rate, momentum, maxRounds);
	bp.setProgressCallback(interval, delegate(uint currentRound, float currentError) {
			writefln("%5d: %f", currentRound, currentError);
		});
	bp.train(network, new RoundRobinProvider(inputs, expectedOutputs));
	
	writeln("network output after training:");
	// final results
	writefln("compute(0, 0): %f", network.compute([0.0, 0.0])[0]);
	writefln("compute(0, 1): %f", network.compute([0.0, 1.0])[0]);
	writefln("compute(1, 0): %f", network.compute([1.0, 0.0])[0]);
	writefln("compute(1, 1): %f", network.compute([1.0, 1.0])[0]);
}
```

I am a bit surprised about the number of rounds it takes to train the network... have to look into this later.
