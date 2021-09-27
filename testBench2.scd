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

//SynthDefs Array, we dont care about the names
a = [\sy1, \sy2, \sy3, \sy4]

//audio test
h = Synth(a[0])
h.free
s.boot

// slicing stuff
b = a.slice((0..3))

a.size
b.size

// routine, pretty easy to understand, theres two loops, the actual one is going to be quite similar

//watch readme to  get how loops work

(
var r; // we need to add al the useful variables
r = Routine {
	4.do{ //this one is going to be a while
		//slicing is gonna happen here
		b.size.do { arg i; //this is the play thing
			x = Synth(b[i]);
			0.04.wait; //waiting and freeing need to be automated
		    x.free;
		    }
		//here we're gonna  to update indexes
	}
}.play;
)


