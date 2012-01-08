PortMIDI real time MIDI plugin for Csound
PortAudio real-time audio module for Csound
virtual_keyboard real time MIDI plugin for Csound
0dBFS level = 32768.0
Csound version 5.14 (float samples) Oct 10 2011
libsndfile-1.0.21
WARNING: cannot open csoundrc file ~/.csoundrc
WARNING: could not open library '/Library/Frameworks/CsoundLib.framework/Versions/5.2/Resources/Opcodes/libjacko.dylib' (-1)
WARNING: could not open library '/Library/Frameworks/CsoundLib.framework/Versions/5.2/Resources/Opcodes/libjackTransport.dylib' (-1)
WARNING: could not open library '/Library/Frameworks/CsoundLib.framework/Versions/5.2/Resources/Opcodes/librtjack.dylib' (-1)
Usage:	csound [-flags] orchfile scorefile
Legal flags are:
--help	print long usage options
-U unam	run utility program unam
-C	use Cscore processing of scorefile
-j N	use N processes
-I	I-time only orch run
-n	no sound onto disk
-i fnam	sound input filename
-o fnam	sound output filename
-b N	sample frames (or -kprds) per software sound I/O buffer
-B N	samples per hardware sound I/O buffer
-A	create an AIFF format output soundfile
-W	create a WAV format output soundfile
-J	create an IRCAM format output soundfile
-h	no header on output soundfile
-c	8-bit signed_char sound samples
-8	8-bit unsigned_char sound samples
-u	ulaw sound samples
-s	short_int sound samples
-l	long_int sound samples
-f	float sound samples
-3	24bit sound samples
-r N	orchestra srate override
-k N	orchestra krate override
-K	Do not generate PEAK chunks
-v	verbose orch translation
-m N	tty message level. Sum of:
		1=note amps, 2=out-of-range msg, 4=warnings
		0/32/64/96=note amp format (raw,dB,colors)
		128=print benchmark information
-d	suppress all displays
-g	suppress graphics, use ascii displays
-G	suppress graphics, use Postscript displays
-x fnam	extract from score.srt using extract file 'fnam'
-t N	use uninterpreted beats of the score, initially at tempo N
-t 0	use score.srt for sorted score rather than a temporary
-L dnam	read Line-oriented realtime score events from device 'dnam'
-M dnam	read MIDI realtime events from device 'dnam'
-F fnam	read MIDIfile event stream from file 'fnam'
-R	continually rewrite header while writing soundfile (WAV/AIFF)
-H#	print heartbeat style 1, 2 or 3 at each soundfile write
-N	notify (ring the bell) when score or miditrack is done
-T	terminate the performance when miditrack is done
-D	defer GEN01 soundfile loads until performance time
-Q dnam	select MIDI output device
-z	List opcodes in this version
-Z	Dither output
flag defaults: csound -s -otest -b1024 -B4096 -m135
Csound Command ERROR:	no orchestra name
