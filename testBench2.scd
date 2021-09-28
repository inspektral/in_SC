//SynthDef List

SynthDef.new(\sy1, {
	Out.ar(0, VarSaw.ar(100!2));
}).add;

SynthDef.new(\sy2, {
	Out.ar(0, VarSaw.ar(180!2));
}).add;

SynthDef.new(\sy3, {
	Out.ar(0, VarSaw.ar(210!2));
}).add;

SynthDef.new(\sy4, {
	Out.ar(0, VarSaw.ar(320!2));
}).add;

SynthDef.new(\sy5, {
	Out.ar(0, VarSaw.ar(800!2));
}).add;


//SynthDefs Array, we dont care about the names, score contain the realworld versions
a = [\sy1, \sy2, \sy3, \sy4, \sy2, \sy5,\sy1, \sy2, \sy3, \sy3,\sy3, \sy1, \sy1]

//audio test
h = Synth(a[0])
h.free
s.boot

// slicing stuff
b = a.slice((0..1))


a.size
b.size

// routine, pretty easy to understand, theres two nested loops

//watch readme to  get how loops work
time.postln

(
var currentSlice = [], start = 0, end = 1, count = 0,
    a1=1, b1=0.05, c1=2.neg, threshEnd,
    d1=1, e1=0.1, f1=2.neg, threshStart;


r = Routine {
	while({end < a.size}, {
		count.postln;
		currentSlice.size.postln;
		//slicing
		currentSlice = a.slice((start..end));
		currentSlice.postln;

		//playing one iteration
		currentSlice.size.do { arg i;
			x = Synth(currentSlice[i]);
			0.15.wait; //waiting and freeing need to be automated waitforfree and env
		    x.free;
		    };

		//updating indexes
		threshEnd = a1*(tanh(count*b1+c1)+1);
		threshStart = d1*(tanh(currentSlice.size*e1+f1)+1);
		[threshEnd, threshStart].postln;
		if ( 2.0.rand < threshEnd,
			{ end = end + 1; count = 0;},
			{count = count+1;});
		if ( 2.0.rand < threshStart,
			{ start = start + 1; });
		if (start == end , {start = start - 1});
	});
}.play;
)