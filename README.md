# in_SC
## Pseudcode
```
// this is global
  event[] sequence = [0....n] //n random events

//this is just one instrument
  int counter = 0
  start = 0
  end = 1

  const double a, b, c //these need to be set wisely to adjust speed
  const double d, e, f //these need to be set wisely to adjust length

  while start < n:

    int length = end-start
    play(sequence[start...end))

    if random(0,1) > a*tanh(counter*b)+c:
      end++
    else
      counter++

    if random(0,1) > d*tanh(length*e)+f:
      start++
```
  
