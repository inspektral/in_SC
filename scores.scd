(
~score1 = List[];
~score2 = List[];
~score3 = List[];
~score4 = List[];
)

(
	~b1 = Buffer.read(s, "C:/Users/titos/in_SC/samples/mp3_synth_1.wav");
	~b2 = Buffer.read(s, "C:/Users/titos/in_SC/samples/mp3_synth_2.wav");
	~b3 = Buffer.read(s, "C:/Users/titos/in_SC/samples/mp3_synth_3.wav");
)
(
	~score4.clear;
	~score4.addAll([[\sampler, [\buffer, ~b1]],
		[\rest],
		[\sampler, [\buffer, ~b2, \out, 1]],
		[\rest],
		[\sampler, [\buffer, ~b2, \out, 0]],
		[\sampler, [\buffer, ~b1, \out, 1]],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~b3]],
		[\rest]
	]);
)

(
	~score5 = List[];
	~score5.clear;
	~score5.addAll([[\sampler, [\buffer, ~b1, \out, 2]],
		[\rest],
		[\sampler, [\buffer, ~b2, \out, 2]],
		[\sampler, [\buffer, ~b1, \out, 2]],
		[\sampler, [\buffer, ~b1, \out, 3]],
		[\sampler, [\buffer, ~b1, \out, 3]],
		[\sampler, [\buffer, ~b1, \out, 2]],
		[\sampler, [\buffer, ~b1, \out, 2]],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~b3, \out , 2]],
		[\rest]
	]);
)

x = Synth(\sampler, [\buffer, ~p2, \out, 4]);

//loading piano samples

(
	~p1 = Buffer.read(s, "C:/Users/titos/in_SC/samples/piano_1.wav");
	~p2 = Buffer.read(s, "C:/Users/titos/in_SC/samples/piano_2.wav");
	~p3 = Buffer.read(s, "C:/Users/titos/in_SC/samples/piano_3.wav");
	~p4 = Buffer.read(s, "C:/Users/titos/in_SC/samples/piano_4.wav");
	~p5 = Buffer.read(s, "C:/Users/titos/in_SC/samples/piano_5.wav");
	~p6 = Buffer.read(s, "C:/Users/titos/in_SC/samples/piano_6.wav");
	~p7 = Buffer.read(s, "C:/Users/titos/in_SC/samples/piano_7.wav");
)

// loading pdf samples

(
	~pdf1 = Buffer.read(s, "C:/Users/titos/in_SC/samples/pdf_1.wav");
	~pdf2 = Buffer.read(s, "C:/Users/titos/in_SC/samples/pdf_2.wav");
	~pdf3 = Buffer.read(s, "C:/Users/titos/in_SC/samples/pdf_3.wav");
	~pdf4 = Buffer.read(s, "C:/Users/titos/in_SC/samples/pdf_4.wav");
	~pdf5 = Buffer.read(s, "C:/Users/titos/in_SC/samples/pdf_5.wav");
	~pdf6 = Buffer.read(s, "C:/Users/titos/in_SC/samples/pdf_6.wav");
)

(
	//score with piano samples
	~score6 = List[];
	~score6.clear;
	~score6.addAll([[\sampler, [\buffer, ~p7, \out, 5]],
		[\rest],
		[\sampler, [\buffer, ~p6, \out, 5]],
		[\sampler, [\buffer, ~p1, \out, 5]],
		[\rest],
		[\sampler, [\buffer, ~p3, \out, 5]],
		[\sampler, [\buffer, ~p4, \out, 5]],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~p2, \out, 5]],
		[\rest],
		[\sampler, [\buffer, ~p7, \out, 5]],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~p5, \out , 5]],
		[\rest]
	]);
)

(~catSeq.value(~score6, 2, [1, 0.1, 1.neg], [1, 0.5, 2.neg]);)

//score with pdf samples

(
	~score7 = List[];
	~score7.clear;
	~score7.addAll([
		[\rest],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~pdf2, \out, 6]],
		[\rest],
		[\sampler, [\buffer, ~pdf5, \out, 6]],
		[\rest],
		[\sampler, [\buffer, ~pdf3, \out, 6]],
		[\rest],
		[\rest],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~pdf4, \out, 6]],
		[\rest],
		[\rest],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~pdf5, \out, 6]],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~pdf6, \out, 6]],
		[\rest],
		[\rest],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~pdf1, \out, 6]],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~pdf1, \out, 6]],
		[\rest],
		[\rest],
		[\sampler, [\buffer, ~pdf2, \out , 6]],
		[\rest]
	]);
)

(~catSeq.value(~score7, 0.4, [1, 0.1, 1.neg], [1, 0.5, 4.neg]);)



// (
// // this can be changed while the sequencer is running, it's the fun part
// ~score1.clear;
// ~score1.addAll([[\saw, [\frq, 66]],
// 	[\saw, [\frq, 100]],
// 	[\saw, [\frq, 2500, \len, 0.01, \amp, 0.25]],
// 	[\saw, [\frq, 70, \len, 0.09]],
// 	[\saw, [\frq, 1000, \len, 0.02]],
// 	[\saw, [\frq, 1050, \len, 0.01, \amp, 0.25]],
// 	[\saw, [\frq, 50, \len, 0.09, \amp, 0.3]],
// 	[\saw, [\frq, 45, \len, 0.05, \amp, 0.7]],
// 	[\saw, [\frq, 50, \len, 0.09, \amp, 0.5]],
// 	[\saw, [\frq, 5000, \len, 0.02]]
// ]);
// )

// (
// // this can be changed while the sequencer is running, it's the fun part
// ~score2.clear;
// ~score2.addAll([[\pls, [\frq, 2*66, \amp, 0.25]],
// 	[\pls, [\frq, 2*100, \amp, 0.25]],
// 	[\pls, [\frq, 2*2500, \len, 0.01, \amp, 0.25]],
// 	[\pls, [\frq, 2*70, \len, 0.09, \amp, 0.25]],
// 	[\pls, [\frq, 2*1000, \len, 0.02, \amp, 0.25]],
// 	[\pls, [\frq, 2*1050, \len, 0.01, \amp, 0.25]],
// 	[\pls, [\frq, 2*50, \len, 0.09, \amp, 0.3]],
// 	[\pls, [\frq, 2*45, \len, 0.05, \amp, 0.7]],
// 	[\pls, [\frq, 2*50, \len, 0.09, \amp, 0.5]],
// 	[\pls, [\frq, 2*5000, \len, 0.02]]
// ]);

// ~score3.clear;
// ~score3.addAll([[\pls, [\frq, 2*66, \amp, 0.25]],
// 	[\rest],
// 	[\pls, [\frq, 2*66, \amp, 0.25]],
// 	[\rest],
// 	[\pls, [\frq, 3*66, \amp, 0.25]],
// 	[\pls, [\frq, 4*66, \amp, 0.25]],
// 	[\rest],
// 	[\rest],
// 	[\pls, [\frq, 66, \amp, 0.25]],
// 	[\rest]
// ]);
// )