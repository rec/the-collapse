instr 1
  ;p field to adjust the skip time
  iskiptim = p4

  ;ktrans linseg 1, 5, 2, 10, -2 /*take out original pitch shift*/
  a1     diskin2 "samples/turningloop.aif", /*ktrans*/ 1, iskiptim, 0, 0, 32
         outs a1, a1

endin
