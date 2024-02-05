
Server.killAll;

s.options.inDevice = "Windows DirectSound : Microphone (C-Media(R) Audio)";
s.options.outDevice = "Windows DirectSound : Speakers (C-Media(R) Audio)";
s.options.sampleRate = 48000;

s.boot;

SynthDef(\hello, {
    var freq = 440;
    var amp = 0.5; 

    var sound = SinOsc.ar(freq) * amp;

    Out.ar(0, sound);
}).add;

// Load a sound file into a buffer

// Define a SynthDef for the sampler
SynthDef(\simpleSampler, { 
    |out = 0, bufnum, rate = 1, startPos = 0, endPos = BufFrames.ir(bufnum), amp = 0.5, pan = 0|
    var source, env;
    source = BufRd.ar(1, bufnum, Phasor.ar(0, BufRateScale.kr(bufnum) * rate, startPos, endPos), loop: 1);
    env = EnvGen.kr(Env.asr(0.01, 1, 0.1), doneAction: 2);
    Out.ar(out, Pan2.ar(source * env, pan, amp));
}).add;

SynthDef(\sampler, {
    arg buffer = 0, out = 0, rate = 1.0, start = 0, end = 1, amp = 1.0;
    var sig = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer), 1, 0, 1, loop:0.0, doneAction:2);
    Out.ar(out, sig * amp);
}).add;

SynthDef(\samplerNoLoop, {
    arg buffer = 0, out = 0, rate = 1.0, start = 0, end = 1, amp = 1.0;
    var sig = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer), rate, start, end);
    // Remove unnecessary Phasor
    Out.ar(out, sig * amp);
}).add;

// Play the sampler
x = Synth(\simpleSampler, ["bufnum": ~buffer.bufnum]);

x = Synth(\sampler, [\buffer, b]);


Synth(\hello);

//show meters
s.meter;

s.quit;



