(
~score1 = List[];
~score2 = List[];
)

(
// this can be changed while the sequencer is running, it's the fun part
~score1.clear;
~score1.addAll([[\saw, [\frq, 66]],
	[\saw, [\frq, 100]],
	[\saw, [\frq, 2500, \len, 0.01, \amp, 0.25]],
	[\saw, [\frq, 70, \len, 0.09]],
	[\saw, [\frq, 1000, \len, 0.02]],
	[\saw, [\frq, 1050, \len, 0.01, \amp, 0.25]],
	[\saw, [\frq, 50, \len, 0.09, \amp, 0.3]],
	[\saw, [\frq, 45, \len, 0.05, \amp, 0.7]],
	[\saw, [\frq, 50, \len, 0.09, \amp, 0.5]],
	[\saw, [\frq, 5000, \len, 0.02]]
]);
)

(
// this can be changed while the sequencer is running, it's the fun part
~score2.clear;
~score2.addAll([[\pls, [\frq, 2*66, \amp, 0.25]],
	[\pls, [\frq, 2*100, \amp, 0.25]],
	[\pls, [\frq, 2*2500, \len, 0.01, \amp, 0.25]],
	[\pls, [\frq, 2*70, \len, 0.09, \amp, 0.25]],
	[\pls, [\frq, 2*1000, \len, 0.02, \amp, 0.25]],
	[\pls, [\frq, 2*1050, \len, 0.01, \amp, 0.25]],
	[\pls, [\frq, 2*50, \len, 0.09, \amp, 0.3]],
	[\pls, [\frq, 2*45, \len, 0.05, \amp, 0.7]],
	[\pls, [\frq, 2*50, \len, 0.09, \amp, 0.5]],
	[\pls, [\frq, 2*5000, \len, 0.02]]
]);
)