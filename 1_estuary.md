
# Estuary


[Estuary](https://estuary.mcmaster.ca/)[^1] je platforma pre spoluprácu a učenie prostredníctvom livecodingu. Umožňuje experimentovať so zvukom, hudbou a vizuálmi vo webovom prehliadači. Estuary spája kurátorskú zbierku livecodingových jazykov v jedinom prostredí, bez požiadavky na inštaláciu softvéru (okrem webového prehliadača) a s podporou pre sieťové súbory (či už v rovnakej miestnosti alebo distribuované po celom svete). Estuary je bezplatný softvér s otvoreným zdrojovým kódom, vydaný v súlade s podmienkami verejnej licencie GNU (verzia 3). Niektoré zo živých kódovacích jazykov dostupných v rámci Estuary sú:


- [MiniTidal](2_minitidal.md): odľahčená verzia Tidalcycles pre vytváranie hudobných patternov (vyvoril/spravuje Alex McLean)
- Punctual: pre audio / video syntézu (vyvoril/spravuje David Ogborn)
- CineCer0: pre video a typografiu (vyvoril/spravuje vývojový team Estuary)
- TimeNot: for creating temporal canons (vyvoril/spravuje Alejandro Franco Briones)
- Seis8s: na exploráciu latinskoamerických štýlov (vyvoril/spravuje Luis Navarro del Angel)
- Hydra: na videosyntézu (vyvoril/spravuje Olivia Jack)

> Na to, aby bežalo Estuary dobre, je nutné používať nejaký súčasný internetový prehliadač. Ja používam [Brave](https://brave.com/). Pred použitím si skontrolujte, či máte zvuk, napríklad na youtube.


[Estuary](https://estuary.mcmaster.ca/) pri prvej návšteve vyzerá takto:

<img src="https://github.com/paum3/Livecoding/blob/main/img/estuary.png" width=80% >

V ľavej časti sú štyri panely:
(pozrite sa do nich)

- About estuary
- Tutorials
- Solo mode
- Collaborate

V pravom hornom rohu je možnosť prepnutia jazyka a témy. Pod buttonom s otáznikom je pomocník. Pozrite aj to.

## Solo mode
Tento mód je určený, ak chcete používať Estuary sami. Nachádza sa v ňom 6 slotov, ktoré slúžia na písanie vášho kódu. Pred tým ako sa do toho pustíte je potrebné si z menu vybrať v akom jazyku budete programovať.
<img src="https://github.com/paum3/Livecoding/blob/main/img/estuary_solo_mode.png" width=80% >


#### Spustenie kódu
Keď napíšete kód, ešte sa nič nestane. Treba ho spusiť a na to sú dva spôsoby:
  - kliknúť myšou na button  |>|
  - stlačiť ```Shift + Enter```. Na toto si zvyknite. Je to jednoduchšie a rýchlejšie. Nemusíte do ruky chytať myšku.




#### Terminál

V spodnej časti obrazovky je k dispozícii Terminal/Chat. Toto okno slúži na posielanie krátkych správ, keď hráte spolu s niekým alebo na zadávanie špeciálnych príkazov pre samotné Estuary. Príkazy sa používajú najmä na zmenu rozloženia a počet slotov, ktoré sú k dispozícii.

- ```!listviews``` vypíše názvy rozložení obrazovky (views), ktoré sú k dispozícii
["countDownAndCode","def","fourbyeight","fourbyseven","fulltexteditor","roulette","sandClockAndCode","stopWatchDownAndCode","tempoAndCode","threebyfive","threebyseven","threebysix","twobyfive","twobyfour","twobysix","twobythree","twobytwo","twocolumns"]


- ```!presetview``` nastaví zvolené rozloženie (view) lokálne. V prípade ensemble iba na vašom počítači
  * ```!presetview fulltexteditor``` jeden veľký slot
  * ```!presetview threebysix``` 3x6 slotov
  * ```!presetview def``` default

- ```!activeview``` vypíše momentálne zvolené rozloženie (view)

- ```!dumpview``` vypíše nastavenie momentálne zvoleného rozloženia
- ```!publishview``` nastaví zvolené rozloženie (view) pre celý ensemble.
- ```!localview audiomap``` vypíše zoznam samplov ktoré sú dostupné pre MiniTidal
- ```!localview []``` zobrazí len vizuály (lokálny display)


#### Tempo
Pri hraní hudby napríklad v MiniTidale je na začiatku nastavené tempo, ktoré je možné zmeniť práve prostredníctvom tohto terminálu príkazmi:

- ```!showtempo``` zobrazí aktuálne tempo
- ```!setcps 1``` (60 beats per minute) Calculate 60/60 = 1, <0,1> je bezpečný rozsah
- ```!setbpm 80``` (120 beats per minute) Calculate 120/60 = 1




[^1]: preložené z https://estuary.mcmaster.ca/
