# in_SC
## Pseudcode
```
// this is global
  event[] sequence = [0....n] //n random events

//this is just one instrument
  int counter = 0, int  start = 0, int end = 1

  const double a, b, c //these need to be set wisely to adjust speed
  const double d, e, f //these need to be set wisely to adjust length

  while start < n:

    play(sequence[start...end))

    if random(0,1) < a*tanh(counter*b)+c:
      end++
      counter = 0
    else
      counter++
      
    int length = end-start
    if random(0,1) < d*tanh(length*e)+f:
      start++
```
  
