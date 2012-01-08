instr TurningSampler
  ;p field to adjust the skip time
  iskiptim = p4

  ;ktrans linseg 1, 5, 2, 10, -2 /*take out original pitch shift*/
  asig diskin2 "samples/turningloop.aif", /*ktrans*/ 1, iskiptim, 0, 0, 32

  ;use transeg to make a smooth fade for sample scrubbing, steep -10 incline and 10 steep decline
  ktseg transeg 0.01, p3*0.25, -10, 1, p3*0.5, 0, 1, p3*0.25, 10, 0.01
  a1 = ktseg*asig                                 ; Multiply transeg to shape envelope of asig
         outs a1, a1

endin
