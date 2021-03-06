<CsoundSynthesizer>
<CsOptions>

;thanks for help from Joachim Heintz! jh@joachimheintz.de
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr Jplayer1 ;trigger instrument

;all possible start- and endpoints. about arg#4 using Gen -2, GEN02 - Transfers data from immediate pfields into a function table. And A negative GEN number implies that the function is not rescaled, and maintains its original values. 
imarkerstart ftgen 0, 0, -6, -2, 0, 2.9, 5.7, 34, 37.9, 41.8

;create and end marker for each sample selection
imarkerend ftgen 0, 0, -6, -2, 1, 1, 1, 2, 2, 2

inmarker tableng imarkerstart ;number of markers
print inmarker

ioutmarker tableng imarkerend ;number of end point markers
print ioutmarker
loop:
indx random 0, inmarker-1 ;index for starting point

istart tab_i indx, imarkerstart ;start time
iend tab_i indx, imarkerend ;end time
idur = iend ;duration
   timout 0, idur, do
   reinit loop
do:
   event_i "i", "Jplayer2", 0, idur, istart ;call instr 2
endin


instr Jplayer2 ;playing the sections
iskip = p4
a1 soundin "samples/turningloop.aif", iskip
outs a1, a1
endin

</CsInstruments>
<CsScore>
i "Jplayer1" 0 100
</CsScore>
</CsoundSynthesizer>
