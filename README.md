# in_SC
## Pseudcode
```
// this is global in scores.scd
  event[] sequence = [0....n] //n random events

//this is just one instrument
  int count = 0, int  start = 0, int end = 1

  const double a, b, c //these need to be set wisely to adjust speed
  const double d, e, f //these need to be set wisely to adjust length

  while end < n:

    play(sequence[start...end])

    if random(0,1) < a*tanh(count*b)+c:
      end++
      count = 0
    else
      count++
      
    int length = end-start
    if random(0,1) < d*tanh(length*e)+f:
      start++
```
  
