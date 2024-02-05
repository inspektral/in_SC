( //this can't be changed while is runnin, and it's okay
~catSeq = {
	arg score, time = 0, paramsEnd = [1,0.5, 2.neg], paramsStart = [1,0.1, 2.neg];
	var currentSlice = [], start = 0, end = 1, count = 0, threshEnd, threshStart;
	Routine {
		while({end < score.asArray.size}, {
		//slicing
			currentSlice = score.asArray.slice((start..end));
		currentSlice.postln;

		//playing one iteration
		currentSlice.size.do { arg i; var currentSynth, currentLine;
			currentLine = currentSlice[i];
			if(currentLine.isEmpty, {
				currentLine = [\rest, []];
			});
			currentSynth = Synth(currentLine[0], currentLine[1]);
				if(time == 0, {currentSynth.waitForFree;}, {time.wait;})
		};

		//updating indexes
		threshEnd = paramsEnd[0]*(tanh(count*paramsEnd[1]+paramsEnd[2])+1);
		threshStart = paramsStart[0]*(tanh(currentSlice.size*paramsStart[1]+paramsStart[2])+1);
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
(
~catSeq.value(~score1, 0.3);
~catSeq.value(~score2, 0.3/4);
)
(~catSeq.value(~score4, 0.2, [1, 0.1, 3.neg], [1, 0.1, 3.neg]);)

~score1
