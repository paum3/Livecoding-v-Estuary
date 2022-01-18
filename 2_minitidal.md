# MiniTidal

MiniTidal je výborný livecodingový nástroj pre hudbu. Je to síce trochu chudobnejšia verzia pôvodných [TidalCycles](https://tidalcycles.org/), ktoré sú samostaným programom, ale možnosti MiniTidalu sú aj tak nesmierne. Nehovoriac o tom, že v prostredí Estuary je možnosť pracovať kolaboratívne po sieti.
TidalCycles sú napísané v relatívne novom, málo rošírenom, funcionálnom jazyku Haskell. Ak vás zaujíma viac o Haskelli, na webe si určite nájdete zaujímavé zdroje. Tu budeme rozoberať len to, čo budete potrebovať ku hraniu v MiniTidale. Veľmi dobrým zdrojom je originálna [príručka k TidalCycles](https://tidalcycles.org/docs/reference), no treba si dať pozor, lebo nie všetko je implementované do MiniTidalu.

>Poznámka: V TidalCycles je niekoľko druhov zátvoriek, z ktorých každá má vždy svoj pár: ```() {} [] <>```, rovnako ako aj uvodzovky ```""```.

>Všetky príkazy sa spúšťajú kliknutím na button |>|, alebo stlačením klávesovej skratky ```Shift+Enter```. Ak je to nutné, pozrite si kapitolu o [Estuary](1_estuary.md).

## Ticho
Najdoležitejšia vec pre každého hudobníka je vedieť spraviť (a byť) ticho. Keďže hudba je vlastne nejaká usporiadané množina zvukov a ticha, ovládnuť svoj nástroj tak aby bol ticho je nevyhnutné. Pre počítač je ľahké aby hral bez prestávky, neunavne, no pre ľudí to nemusí byť najpríjemnejšie. Keď chceme ticho v MiniTidale, zmažeme kód, napíšeme ```silence``` a spistíme.





## Sample
Sample sú vzorky zvuku, ktoré používa Tidal. na ich prehrávanie je príkaz ```sound``` alebo ```s```, sú to synonymá.
```haskell
-- zahrá bassdrum
sound "bd"
```
```haskell
--to isté, len kratšie na zapísanie
s "bd"
```
To čo je napísané v uvodzovkách, je názov sampla. Zoznam všetkých dostupných samplov je [tu](Zoznam samplov).

## Patterny
Kľúčom v TidalCycles sú paterny a ich modifikácie. Pattern je to, čo je v uvodzovkách, pričom veľa parametrov vie byť zapísaných ako pattern.

Strieda tieto dva sample v jednom cylka a stále dookola.
```haskell
s "bd sd"
```

##### Opakovanie
Za rovnaký čas zahrá teraz tri ```bd```.
```haskell
s "[bd bd bd] sd"
```


To isté, len zapísané jednoduchšie. Pozn. TidalCycles poižíva tzv. mininotáciu, kde jednotlivé znaky majú svoj význam. Preto na prvý pohľad sofistikovanejší TidalCycles kód vyzerá nezrozumiteľne, ale ked sa tomu človek rozumie, vie že to má jednú veľkú výhodu! Netreba veľá pisať!

```haskell
s "bd*3 sd"
```

Opakom znamnieka ```*``` je ```/```. Čo spraví nasledujúci príklad?
```haskell
s "bd*3 sd/2
```


##### Substitúcia

Z informácií, ktoré sú medzi ```<``` a ```>``` vyberie v každom cykle len jednu, ide po poradí a opakuje od začiatku. Takže nasledujúci kód zahrá: bd*3 sd | bd*20 sd | a tak dookola.
```haskell
s "<bd*3 bd*20> sd"
```

##### Kombinácia / Polyrytmy 
Kombinácia v tomto prípade znamená, že sa budú hrať naraz v všetky vrstvy/línie/hlasy - akokoľvek to nazveme. Všetky vrstvy sú ohraničené v hranatých zátvorkách a jednotlivé vrstvy sa oddelia čiarkou.
```haskell
s "[ cp, bd*5 , sd*2 ]"
```
Výsledok vyzerá nejako takto:
```
cp -- -- -- --
bd bd bd bd bd
sd -- -sd -- -
```

## Poradie samplov
To že používame rôzne slovné skratky na pomenovanie samplov ```bd```, ```cp``` a pod. sme už videli. Čo to ale má znamenať? Skutočnosť je takáto. Tieto názvy samplov sú v vlastne  názvy  [adresárov](https://github.com/dktr0/cybernetic-samples/tree/main/sounds), v ktorých sú uložené jednotlivé zvuky s tým, že počet zvukov v jednotlivých adresároch je ľubovoľný. V zozname samplov je v zátvorke počet samplov, ktoré daný adresár obsahuje. K jednotlivým zvukom prisupujeme pomocou ```:``` a poradového čísla s tým, že (v počítačoch to tak býva) je **prvé číslo 0**.

```haskell
s "alphabet:0 alphabet:1 alphabet:2 alphabet:3"
```

Rovnaký výsledok vieme zapísať aj jednoduchšie pomocou funcie ```n```, ako *number*

```haskell
n "0 1 2 3" # s "alphabet"
```
```"0 1 2 3"``` je tiež pattern, takže sa s tým môžeme hrať
```haskell
n "<0 20> 1*2 2/2 3" # s "alphabet" 
```haskell

>V posledných dvoch príkladoch sa objavil nový znak ```#``` a o chvíľku k nemu pribudne aj ```$```. Čo presne tieto znaky znamenajú je už záležitosť Haskellu, preto to nebudem nejako rozoberať, ale je to o spájaní jednotlivých funicíí. časom sa dozvieme viac.

## Hlasitosť / Gain

```gain``` + číslo v rozsahu <0,1>

```haskell
n "<0 20> 1*2 2/2 3" # s "casio bd sid " # gain 0.5
```

>Desatinné čísla sa píšu s bodkou takto 3.14.

## Zmena rýchlosti

```haskell
fast "1 4" $  n "<0 20> 1*2 2/2 3" # s "casio bd sid " 
```

## Spájanie / stack
V Estuary môžete použiť ľubovoľný počet slotov a v každom môže niečo bežať. Niekedy je ale výhodnejšie mať kód pod kontrolou - napríklad kôli hlastosti. Takže napríklad, máme tieto dva patterny v zvlášť slotoch

```haskell
fast "1 4" $  n "<0 20> 1*2 2/2 3" # s "casio bd sid " 
```
```haskell
n "0 1 2 <5 ~>" # s "strum" 
```

Ak ich chceme spojiť do jedného použijeme ```stack```

```haskell
stack [
fast "1 4" $  n "<0 20> 1*2 2/2 3" # s "casio bd sid " ,
n "0 1 2 <5 ~>" # s "strum" 
] gain 0.8
```



## Efekty

hcutoff
cutoff
pan
gain
bandf
bandq
vowel
delay
delaytime
delayfeedback
begin
end

# Zoznam samplov

48 (15), 149 (15), 150 (14), 151 (15), 152 (14), 153 (15), 154 (15), 808 (6), 808bd (25), 808cy (25), 808hc (5), 808ht (5), 808lc (5), 808lt (5), 808mc (5), 808mt (5), 808oh (5), 808sd (25), 8vasus (2), 909 (1), ab (12), acordeon (1), ade (10), ades2 (9), ades3 (7), ades4 (6), akBlip (3), akBlipLong (5), akCutup (6), akCymb (3), akGlitchpick (7), akMech (4), akShooter (3), akTrashR (4), alex (2), alphabet (26), altavoz (2), amencutup (32), annabelle (1), aparece (3), armora (7), arp (2), arpy (11), atecocolli (2), auto (11), baa (7), baa2 (7), backwards (3), bajo (2), barung (15), bass (4), bass0 (3), bass1 (30), bass2 (5), bass3 (11), bassb (5), bassdm (24), bassfoo (3), battles (2), bbox (11), bd (24), bdoor (4), bend (4), bev (2), bin (2), birds (10), birds3 (19), blackChair (9), bleep (13), blip (2), blue (2), bottle (13), bperc (2), breaks125 (2), breaks152 (1), breaks157 (1), breaks165 (1), breath (1), bubble (8), bus (8), cabinet (5), caminar (4), can (14), caracoles (2), casio (3), cb (1), cbow (18), cc (6), ch2018 (12), ch2018R (13), chBaby (3), chKk (4), chKm01 (11), chKm02 (7), chKm03 (2), chKm04 (2), chKm05 (2), chKm06 (1), chKmpad (1), chMado (6), chSoup01 (1), chSoup02 (4), chTaxi (5), chant (1), chin (4), chorus (1), circus (3), clak (2), click (4), clubkick (5), co (4), coffee (39), coins (1), contratiempos (3), control (2), cosmicg (15), cp (2), cpluck (15), cr (6), crow (4), cuerdas (2), custom (3), d (4), dark (1), db (13), demung (8), diphone (38), diphone2 (12), dist (16), dork2 (4), dorkbot (2), dr (42), dr2 (6), dr55 (4), dr_few (8), drone (5), drum (6), drumtraks (13), e (8), east (9), echobeat (1), efecto (1), ehecatl (6), electro1 (13), elevator (6), em2 (6), erk (1), escribir (40), escuchar (30), etAbdim7 (29), etAbmaj (30), etAbmin (30), etAbsus4 (30), etAdim7 (29), etAmaj (30), etAmin (30), etAsus4 (30), etBbdim7 (29), etBbmaj (30), etBbmin (30), etBbsus4 (30), etBdim7 (29), etBmaj (30), etBmin (30), etBooka (6), etBsus4 (30), etC4filter (18), etCdim7 (29), etChichen (13), etClink (62), etCmaj (30), etCmin (30), etCsus4 (30), etDbdim7 (29), etDbmaj (30), etDbmin (30), etDbsus4 (30), etDdim7 (29), etDishes (37), etDmaj (30), etDmin (30), etDrain (1), etDsus4 (30), etEbdim7 (29), etEbmaj (30), etEbmin (30), etEbsus4 (30), etEdim7 (29), etEmaj (30), etEmin (30), etEsus4 (30), etFdim7 (29), etFieldfx (9), etFmaj (30), etFmin (30), etFsus4 (30), etGbdim7 (29), etGbmaj (30), etGbmin (30), etGbsus4 (30), etGdim7 (29), etGmaj (30), etGmin (30), etGsus4 (30), etJuice (303), etNose (1), etPad (15), etPadA7 (1), etPadAb7 (1), etPadAbdim7 (1), etPadAbmaj (1), etPadAbmin (1), etPadAdim7 (1), etPadAmaj (1), etPadAmin (1), etPadB7 (1), etPadBb7 (1), etPadBbdim7 (1), etPadBbmaj (1), etPadBbmin (1), etPadBdim7 (1), etPadBmaj (1), etPadBmin (1), etPadC7 (1), etPadCdim7 (1), etPadCmaj (2), etPadCmin (2), etPadD7 (1), etPadDb7 (1), etPadDbdim7 (1), etPadDbmaj (1), etPadDbmin (1), etPadDdim7 (1), etPadDmaj (2), etPadDmin (1), etPadE7 (1), etPadEb7 (1), etPadEbdim7 (1), etPadEbmaj (1), etPadEbmin (1), etPadEdim7 (1), etPadEmaj (1), etPadEmin (1), etPadF7 (1), etPadFdim7 (1), etPadFmaj (1), etPadFmin (1), etPadG7 (1), etPadGb7 (1), etPadGbdim7 (1), etPadGbmaj (1), etPadGbmin (1), etPadGdim7 (1), etPadGmaj (1), etPadGmin (3), etPerc (22), etRattle (48), etScrape (34), etTest (2), etTools (4), etWater (8), expbd (7), extranar (4), f (1), fada (8), falls (1), feel (7), feelfx (8), fest (1), fire (1), first (1), fizzypop (5), flbass (17), flick (17), fm (17), foldbd (6), foo (27), football (1), fridge (2), ftstep (2), future (17), gab (10), gabba (4), gabbaloud (4), gabbalouder (4), glas (1), glasstap (3), glitch (8), glitch2 (8), gong (9), gretsch (24), gtr (3), gtrm (6), guira (3), h (7), hand (17), hardcore (12), hardkick (6), harm (8), haw (6), hb (1), hc (6), hear (32), hh (13), hh27 (13), hit (6), hmm (1), ho (6), hoover (6), house (8), ht (16), huehue (3), i7 (5), icshaker (5), if (5), ifdrums (3), incoming (8), industrial (32), insect (3), invaders (18), jaguar (1), jamblock (1), jarble (1), jazz (8), juice (1), jungbass (20), jungle (13), juno (12), jvbass (13), kendhang (19), kenong (8), kettle (7), kicklinn (1), koy (2), kurt (7), latibro (8), led (1), leer (19), less (4), lighter (33), linnhats (6), listen (28), litefix (6), lt (16), lxpaper (9), made (7), made2 (1), madre (76), mash (2), mash2 (4), mdr (1), measurecup (6), metal (10), miniyeah (4), mirar (3), mixing (1), monsterb (6), moog (7), mother1 (82), mother2 (69), mother3 (33), mouth (15), mp3 (4), msg (9), mstand (4), mt (16), mute (28), newnotes (15), noise (1), noise2 (8), notes (15), nperc (4), numbers (9), nutcrack (1), observar (32), oc (4), odx (15), off (1), oir (31), olvidar (6), ombell (1), org (17), outdoor (6), ovenclaps (11), ovenknob (5), pad (3), padlong (1), palabra (3), pebbles (1), peking (8), pensar (4), pentch (2), perc (6), peri (15), phant (1), piano (4), ping (3), pingvh (4), pluck (17), ponch (1), pong (6), ponsus (1), popkick (10), print (11), proc (2), procshort (8), producir (7), psr (30), psurf (1), ptch (2), quinto (3), rad (5), radfx (2), rave (8), rave2 (4), ravemono (2), read (27), realclaps (4), recordar (7), reir (3), reverbkick (1), rm (2), rodfx (1), roll (3), rs (1), s4focus (7), s4shutter (8), saron (8), sawg (1), sax (22), sd (2), seawolf (3), see (19), sequential (8), sf (18), sharpener (5), sheffield (1), short (5), sid (12), sine (6), sitar (8), slap (2), slenthem (8), sn (52), sonar (3), space (18), speakspell (12), speech (7), speechless (10), speedupdown (9), sphere (1), sprvibe (85), squeak (6), sspro (13), stab (23), stomp (10), stool (2), strum (7), strumUnpitched (9), subroc3d (11), sugar (2), sundance (6), tabla (26), tabla2 (46), tablex (3), tacscan (22), tarola (1), tech (13), techno (7), teclado (6), teponaxtlimeh (7), tink (5), tok (4), toys (13), trump (11), tumba (2), ukulele (14), ul (10), ulgab (5), uxay (3), v (6), ver (20), vgut (16), vibch (4), vibnt (3), volver (6), voodoo (5), vox (3), wah (2), warble (3), watch (38), water (3), whiteChair (2), wind (10), wobble (1), world (3), write (28), xmas (1), yeah (31) 

