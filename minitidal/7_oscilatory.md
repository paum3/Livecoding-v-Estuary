# Oscilátory

Z konceptu analógových syntezátorov bola prevzatá idea takých príkazov, ktoré stále generujú nejaké hodnoty, ako keby oscilovali, podľa presných matematických funkcií. Hodnoty týchto funkcií su v rozsahu 0 - 1, preto sa pri nich často používa ešte trochu jednoduchej matematiky, aby sme tie hodnoty dostali také ako potrebujeme.

Napríklad ```saw``` generuje funkciu, ktorej graf vyzerá ako píla. Hodnoty stúpajú na najvyšší bod (1) a potom prudka zmena na najnižší bod (0) odkiaľ to zase stúpa hore. Celý jeden "zub" trvá TidalCycles jeden cyklus, preto ak to chcem spomaliť, dám pred to ```slow 4``` a v takom prípade bude jedno stúpanie trvať presne 4 cykly. Vyzeralo by to takto: ```slow 4 $ saw```. Ako to využiť? Napríklad by som s tým mohol meniť panorámu, čo by vyzeralo takto: ```pan (slow 4 $ saw)``` . Tie zátvorky sú tam dôležité, lebo jasne ukážu: vyrob 4 krát spomalený oscilátor a tieto hodnoty ponúkni panoráme. Celý funkčný priklad aj so zvukom je tu:

``` s "sd*20" # pan (slow 4 $ saw)```

Čo sa tam deje je, že TidalCycles sa pre každý ```sd``` pozrie, akú hodnotu mu poskytuje oscilátor ```saw``` a použije ju pre ```pan```.


Ako som už písal, všetky oscilátory generujú hodnoty v rozsahu 0 - 1. Čo ale ak by som chcel použiť pre ```gain``` náhodný oscilátor ```rand``` ale v menšom rozsahu, napríklad 0.8 - 1? Na to slúži ```range```.

```n "1 2 3 4" # s "arpy" # gain (range 0.8 1 $ rand)```

Je to zrozumiteľné?

## sine

## saw

## rand

## perlin
