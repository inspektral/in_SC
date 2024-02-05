// evaluate file for length change to take place
~length = 0.1;

/*
\rest:
This is used by default when a line is empty
~length can be changed to any number in seconds
WARNING: deleting \rest crashes the sequencer if score contains empty lines
*/
SynthDef(\rest, {
	var sig, env = Env([0,0],~length);
	sig = PinkNoise.ar(0)*EnvGen.kr(env, doneAction:2);
	Out.ar(0, sig);
}).add;

// this can be changed while the sequencer is running
SynthDef(\saw,{
	arg
	frq = 200,
	amp = 0.5,
	out = 0,
	len = 0.1,
	fde = 0.005;

	var	sig, env;
	env = Env([0,1,1,0, 0],[fde, len, fde, ~length-fde-len-fde]);
	sig = VarSaw.ar(frq!2, mul:amp)*EnvGen.kr(env, doneAction:2);
	Out.ar(out, sig) ;
}).add;

SynthDef(\pls,{
	arg
	frq = 200,
	amp = 0.2,
	out = 0,
	len = 0.1,
	fde = 0.005;

	var	sig, env;
	env = Env([0,1,1,0, 0],[fde, len, fde, ~length-fde-len-fde]);
	sig = Pulse.ar(frq!2, mul:amp/2)*EnvGen.kr(env, doneAction:2);
	Out.ar(out, sig) ;

}).add;

SynthDef(\sampler, {
    arg buffer = 0, out = 0, rate = 1.0, start = 0, end = 1, amp = 1.0;
    var sig = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer), 1, 0, 1, loop:0.0, doneAction:2);
    Out.ar(out, sig * amp);
}).add;
