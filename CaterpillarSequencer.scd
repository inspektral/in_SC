( //this can't be changed while is runnin, and it's okay
r = {
	arg score, a1=1, b1=0.05, c1=2.neg, d1=1, e1=0.1, f1=2.neg;
	var currentSlice = [], start = 0, end = 1, count = 0, threshEnd, threshStart;
	Routine {
		while({end < score.value.size}, {
		//slicing
			currentSlice = score.value.slice((start..end));
		currentSlice.postln;

		//playing one iteration
		currentSlice.size.do { arg i; var currentSynth, currentLine;
			currentLine = currentSlice[i];
			if(currentLine.isEmpty, {
				currentLine = [\rest, []];
			});
			currentSynth = Synth(currentLine[0], currentLine[1]);
			currentSynth.waitForFree;
		    };

		//updating indexes
		threshEnd = a1*(tanh(count*b1+c1)+1);
		threshStart = d1*(tanh(currentSlice.size*e1+f1)+1);
		if ( 2.0.rand < threshEnd,
			{ end = end + 1; count = 0;},
			{count = count+1;});
		if ( 2.0.rand < threshStart,
			{ start = start + 1; });
		if (start == end , {start = start - 1});
	});
}.play;
})

//this starts the thing
r.value(~score1)
