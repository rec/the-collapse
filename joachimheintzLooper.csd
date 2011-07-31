<CsoundSynthesizer>
<CsOptions>
;thanks for help from Joachim Heintz! jh@joachimheintz.de
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

;all possible start- and endpoints. about arg#4 using Gen -2, GEN02 - Transfers data from immediate pfields into a function table. And A negative GEN number implies that the function is not rescaled, and maintains its original values. 
gimarkerstart ftgen 0, 0, -6, -2, 0, 2.9, 5.7, 34, 37.9, 41.8

;create and end marker for each sample selection
gimarkerend ftgen 0, 0, -6, -2, 1, 1, 1, 2, 2, 2

instr 1 ;trigger instrument
inmarker tableng gimarkerstart ;number of markers
print inmarker

ioutmarker tableng gimarkerend ;number of end point markers
print ioutmarker
loop:
indx random 0, inmarker-1 ;index for starting point

istart tab_i indx, gimarkerstart ;start time
iend tab_i indx, gimarkerend ;end time
idur = iend ;duration
   timout 0, idur, do
   reinit loop
do:
   event_i "i", 2, 0, idur, istart ;call instr 2
endin

instr 2 ;playing the sections
	;p field to adjust the skip time
	iskip = p4
	
	;ktrans linseg 1, 5, 2, 10, -2 /*take out original pitch shift*/
	a1 diskin2 "samples/turningloop.aif", /*ktrans*/ 1, iskip, 0, 0, 32
	outs a1, a1
endin

</CsInstruments>
<CsScore>
i 1 0 100
</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>897</x>
 <y>267</y>
 <width>535</width>
 <height>279</height>
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
  <uuid>{5cd21e19-3e10-42a4-bab1-1901383e2372}</uuid>
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
