<CsoundSynthesizer>
<CsOptions>
;JoachimShuffler, completed by Austin Stone mr.austinstone@gmail.com
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

;special thanks for help from joachim heintz jh@joachimheintz.de

;all possible startpoints
gimarkerstart ftgen 0, 0, -6, -2, 0, 2.9, 5.7, 34, 37.9, 41.8

;the corresponding endpoints (really duration in the example)
gimarkerend ftgen 0, 0, -6, -2, 1, 1, 1, 2, 2, 2

instr 2
 ;trigger instrument

inmarker tableng gimarkerstart ;number of markers

ioutmarker tableng gimarkerend ;number of end point markers

loop:

indx random 0, inmarker-1 ;index for starting point
istart tab_i indx, gimarkerstart ;start time
iend tab_i indx, gimarkerend ;end time
idur = iend ;duration, not really using endpoints

timout 0, idur, do

reinit loop

do:
event_i "i", 2, 0, idur, istart ;call instr 2

endin

instr 2 ;playing the sections

iskip = p4
a1 soundin "../samples/turningloop.aif", iskip

outs a1, a1

endin


</CsInstruments>
<CsScore>;i "JoachimShuffler" 0 100

</CsScore>
</CsoundSynthesizer>

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>897</x>
 <y>61</y>
 <width>539</width>
 <height>515</height>
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
  <uuid>{e39f09e7-a141-4b21-8942-5cebf771c3db}</uuid>
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
