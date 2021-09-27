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


//SynthDefs Array, we dont care about the names
a = [\sy1, \sy2, \sy3, \sy4, \sy2, \sy5,\sy1, \sy2, \sy3, \sy3,\sy3, \sy1, \sy1]

//audio test
h = Synth(a[0])
h.free
s.boot

// slicing stuff
b = a.slice((0..3))

a.size
b.size

// routine, pretty easy to understand, theres two nested loops

//watch readme to  get how loops work

(
var b, r, e = 1, s = 0, count = 0, loops = 0; // we need to add al the useful variables
r = Routine {
	while({loops < 1}, {
		count = count + 1;
		count.postln;
		//slicing
		b = a.slice((s..e));
		b.postln;

		//playing one iteration
		b.size.do { arg i;
			x = Synth(b[i]);
			0.15.wait; //waiting and freeing need to be automated waitforfree and env
		    x.free;
		    };

		//updating indexes
		if ( 0.03.coin, { e = e + 1; });
		if ( 0.03.coin, { s = s + 1; });
		if ( s==e, {s = s - 1;});
		if ( e==a.size, {e = 0; loops = loops + 1});
		if ( s==a.size, {s = 0;});
	})
}.play;
)

0.54930614433405.tanh



