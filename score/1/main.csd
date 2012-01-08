;</CsInstruments>
;<CsScore>

i 2 0 100

;</CsScore>
;</CsoundSynthesizer>
;; Score for section 1 of the collapse!

;inst st end skip

;initial recitation of turning, at specified loop points
i1 0 1 0
i. + 1 2.9
i. + 1 5.74
i. + 1 8.57
i. + 2 11.15

;randomization of entire sample
i. + 1 ~
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
i1 0 0.5 0
i. + . ~
i. . . .
i. . . 45

;repetition of shorter random playback
r24 BOO
i1 0 0.15 0
i. + . ~
i. . . .
i. . . 45

e
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>897</x>
 <y>527</y>
 <width>539</width>
 <height>308</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{b5aa22a1-aedf-4f37-aac9-b2273f99240e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
