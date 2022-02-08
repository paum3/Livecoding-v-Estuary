// Druhy den, Konzervatorium
// sinus, vlny, frekvencie


// aby sme mohli robit so zvukom, treba bootnut audio server
s.boot;
s.scope;
s.meter;


// Sinus

{ SinOsc.ar(200) }.plot

// * (hviezdicka) znamena nasobenie. Co sa stane s vlnou ked ju nasobim nejakym cislom?
{ SinOsc.ar(200) * 0.5 }.plot(maxval:1, minval: -1)

// amplituda
Ndef(\a, { SinOsc.ar(200) * 0.3 ! 2 }).play; // ! (vykricnik) s cislom 2 znamena ze dostaneme 2 kanaly
Ndef(\a).stop;


{  SinOsc.ar(200) * SinOsc.ar(1000) * 0.3 }.plot(maxval:1, minval: -1)

// vibrato
Ndef(\a, { SinOsc.ar(200) * SinOsc.ar(1)* 0.3 ! 2 }).play; // ! (vykricnik) s cislom 2 znamena ze dostaneme 2 kanaly
Ndef(\a).stop;


// tremolo
Ndef(\a, { SinOsc.ar(200 + SinOsc.ar(5)) * 0.5 ! 2 }).play;
Ndef(\a, { SinOsc.ar(200 + SinOsc.ar(8).range(-10,10)) * 0.5 ! 2 }).play;
Ndef(\a, { SinOsc.ar(200 + SinOsc.ar(8).range(-40,40)) * 0.5 ! 2 }).play;
Ndef(\a, { SinOsc.ar(200 + SinOsc.ar(8).range(-140,140)) * 0.5 ! 2 }).play;
Ndef(\a).stop;

// beating
Ndef(\a, { SinOsc.ar(200) + SinOsc.ar(200.6) * 0.3 ! 2 }).play;
Ndef(\a, { SinOsc.ar(200,mul: 0.3) + SinOsc.ar(300, mul: 0.2)  ! 2 }).play;

Ndef(\a).stop;





////////////////////////////////////////////////////////////////////////////
//////////// T H E R E M I N ///////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

(

	Ndef(\theremin,{
		var vibrato = SinOsc.kr(6).range(-8,8);
		SinOsc.ar(
			freq: MouseX.kr(50,1500) + vibrato,
			mul: MouseY.kr(0,1)
		) ! 2
	}).play

)

Ndef(\theremin).stop




////////////////////////////////////////////////////////////////////////////
//////////////////I N E  V L N Y ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////



(
	{
		[
			LFNoise0.kr(20),
			SinOsc.kr(20),
			SinOsc.kr(20) + SinOsc.kr(2),
			LFSaw.kr(20),
			LFPulse.kr(20),
			LFTri.kr(20)
		]
	}.plot(1)
)
