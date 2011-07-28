<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

; Initialize the ZAK space.
; Create 1 a-rate variable and 1 k-rate variable.
zakinit 1, 1

  opcode BufPlay1, ak, ikkkkkk
ift, kplay, kspeed, kvol, kstart, kend, kwrap xin
;kstart = begin of playing the buffer in seconds
;kend = end of playing in seconds. 0 means the end of the table
;kwrap = 0: no wrapping. stops at kend (positive speed) or kstart (negative speed). this makes just sense if the direction does not change and you just want to play the table once 
;kwrap = 1: wraps between kstart and kend
;kwrap = 2: wraps between 0 and kend
;kwrap = 3: wraps between kstart and end of table
;CALCULATE BASIC VALUES
kfin		init		0
iftlen		=		ftlen(ift)/sr ;ftlength in seconds
kend		=		(kend == 0 ? iftlen : kend) ;kend=0 means end of table
kstart01	=		kstart/iftlen ;start in 0-1 range
kend01		=		kend/iftlen ;end in 0-1 range
kfqbas		=		(1/iftlen) * kspeed ;basic phasor frequency
;DIFFERENT BEHAVIOUR DEPENDING ON WRAP:
if kplay == 1 && kfin == 0 then
 ;1. STOP AT START- OR ENDPOINT IF NO WRAPPING REQUIRED (kwrap=0)
 if kwrap == 0 then
kfqrel		=		kfqbas / (kend01-kstart01) ;phasor freq so that 0-1 values match distance start-end
andxrel	phasor 	kfqrel ;index 0-1 for distance start-end
andx		=		andxrel * (kend01-kstart01) + (kstart01) ;final index for reading the table (0-1)
kfirst		init		1 ;don't check condition below at the first k-cycle (always true)
kndx		downsamp	andx
kprevndx	init		0
 ;end of table check:
  ;for positive speed, check if this index is lower than the previous one
  if kfirst == 0 && kspeed > 0 && kndx < kprevndx then 
kfin		=		1
 ;for negative speed, check if this index is higher than the previous one
  else
kprevndx	=		(kprevndx == kstart01 ? kend01 : kprevndx) 
   if kfirst == 0 && kspeed < 0 && kndx > kprevndx then
kfin		=		1
   endif
kfirst		=		0 ;end of first cycle in wrap = 0
  endif
 ;sound out if end of table has not yet reached
asig		table3		andx, ift, 1	
kprevndx	=		kndx ;next previous is this index
 ;2. WRAP BETWEEN START AND END (kwrap=1)
 elseif kwrap == 1 then
kfqrel		=		kfqbas / (kend01-kstart01) ;same as for kwarp=0
andxrel	phasor 	kfqrel 
andx		=		andxrel * (kend01-kstart01) + (kstart01) 
asig		table3		andx, ift, 1	;sound out
 ;3. START AT kstart BUT WRAP BETWEEN 0 AND END (kwrap=2)
 elseif kwrap == 2 then
kw2first	init		1 
  if kw2first == 1 then ;at first k-cycle:
		reinit		wrap3phs ;reinitialize for getting the correct start phase
kw2first	=		0 
  endif
kfqrel		=		kfqbas / kend01 ;phasor freq so that 0-1 values match distance start-end
wrap3phs:
andxrel	phasor 	kfqrel, i(kstart01) ;index 0-1 for distance start-end
		rireturn	;end of reinitialization
andx		=		andxrel * kend01 ;final index for reading the table 
asig		table3		andx, ift, 1	;sound out
 ;4. WRAP BETWEEN kstart AND END OF TABLE(kwrap=3)
 elseif kwrap == 3 then
kfqrel		=		kfqbas / (1-kstart01) ;phasor freq so that 0-1 values match distance start-end
andxrel	phasor 	kfqrel ;index 0-1 for distance start-end
andx		=		andxrel * (1-kstart01) + kstart01 ;final index for reading the table 
asig		table3		andx, ift, 1	
 endif
else ;if either not started or finished at wrap=0
asig		=		0 ;don't produce any sound
endif
  		xout		asig*kvol, kfin
  endop

  opcode BufFiCtNd1, ii, Soo
;creates a non deferred function table from a soundfile and returns its length
Sfilenam, iftnum, inorm xin ;filename, number of ftable (0=automatic(=default)), normalization (1=yes, 0=no(=default))
igen      =         (inorm == 0 ? -1 : 1)
ifttmp    ftgen     0, 0, 0, igen, Sfilenam, 0, 0, 1
ilen      =         ftlen(ifttmp)
ift       ftgen     iftnum, 0, -ilen, -2, 0
indx      =         0
loop:
ival      tab_i     indx, ifttmp
          tabw_i    ival, indx, ift
          loop_lt   indx, 1, ilen, loop
          ftfree    ifttmp, 0
          xout      ift, ilen
  endop


instr 1
gift, ilen BufFiCtNd1 "turningloop.aif" ;creates a non-deferred function table containing the sample
endin

instr 2
aout,k0   BufPlay1	 gift, 1, p4, 1, p5, p6, p7 ;speed (vol) start end wrap
          out       aout
endin




instr 3
;Notes
;	use a gate to cycle through play back of samples at different rates 
;		each sampple has a start and end time
;			these variables are packaged and kept on a seperate document
;		the gate does not have a fixed rate
;			it uses the end time to reset to the next point
;		
;	Define different points of a sample to play back from
;		use a selection process to read each start point
;			at the end point the switch is sprung to start a new sample
;		Maybe use the difference of the start and end time
;			This could get tricky or overlap somehow 
;	randh might provide some answers as well...



;krand randh 1, krandrate


	
krand randh 1, 1, 0.5, 0, 0.5
kint = int (krand)
printk .5, kint

if (kint = 0) kgoto sample1
kgoto sample2

sample1:
    kstart = 0
    kend = 1
    goto playit

sample2:
    kstart = 34
    kend = 36
    goto playit
    
zkw kend, 1

kzak zkr 1
printk .1, kzak
    
    playit:    
	aout, k0 BufPlay1 gift, 1, 1, 1, kstart, kend, 1
	out aout
zkcl 0, 1
endin


</CsInstruments>
<CsScore>
;f 101 0 16 10 1 ; a sinewave


;i1 must play first!
i 1 0 41

i 3 0 10
e
;         speed start end wrap
i 2 0 5   1     0     0   0   ;play all but stop (wrap=0) after reaching the end
i . 6 5   2     1     2   0   ;play from sec 1 to 2 in the file in double speed
i . 12 5  -.5   0.5   2   0   ;play from sec 2 to 0.5 backwards, half speed
i . 18 5  1     0.5   2   1   ;wrap between start and end
i . 24 5  -1    0.5   2   1   ;the same backwards
i . 30 5  1     1     2   2   ;start at sec 1, then wrap between 0 and end
i . 36 5  1     1     2   3   ;wrap between start and end of table
e
</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
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
  <uuid>{98efcca7-472f-4644-82d4-99f2d2479c8c}</uuid>
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
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 72 179 400 200
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
