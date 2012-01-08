;; Score for section 1 of the collapse!
; jlooper random indexed sampler 
i "Jlooper" 0 5
s
;inst st end skip


;initial recitation of turning, at specified loop points
i "TurningSampler" 0 1 0
i. + 1 2.9
i. + 1 5.74
i. + 1 8.57
i. + 2 11.15

;randomization of entire sample
i "TurningSampler" + 1 ~
i. + 0.5 .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . . .
i. . 1 45

;repetition of random playback
r8 BOO
i "TurningSampler" 0 0.5 0
i. + . ~
i. . . .
i. . . 45

;repetition of shorter random playback
r24 BOO
i "TurningSampler" 0 0.15 0
i. + . ~
i. . . .
i. . . 45

e
