a.show()
a.setBins(1)

osc(5).modulate(noise(1),()=>a.fft[0]/2).modulateRotate(src(o0)).out(o0)