<CsoundSynthesizer>

<CsOptions>
-odac -d
</CsOptions>

<CsInstruments>

sr     = 44100
ksmps  = 32
nchnls = 2
0dbfs  = 1

#include "instruments/main-instruments.orc"

</CsInstruments>

<CsScore>

#include "score/main-score.sco"

</CsScore>

</CsoundSynthesizer>
