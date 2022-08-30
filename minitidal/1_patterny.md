## Patterny
Kľúčom v TidalCycles sú patterny a ich modifikácie. Pattern je to, čo je v uvodzovkách. Ako pattern vie byť zapísané skoro všetko. Na teraz to budem demonštrovať len na jednoduchých prikladoch s ```s```. Neskôr sa budú patterny objavovať všade a veľa. V patternoch sa používajú rôzne znaky a zátvorky, všetko má svoju funkciu. Na prvý pohľad to môže vyzerať zložito, no ver tomu, že párkrát si to vyskúšaš a bude ti to jasné.

Pripomínam, že TidalCycles hrá všetko v loope, takže patterny sa opakujú dookola a všetky "záležitosti", ktoré do patternu zapíšeš sa Tidal pokúsi zahrať za rovnaký čas jedného cyklu. Počet a hustota _udalostí_ závisí len na tebe a cpu.

Extrémny príklad na začiatok všetko vysvetlí.
```haskell
s "bd sd arpy strum sid strum sid cp bd sid sid arpy bd"
```

Všetky sample zmestí do jedného cyklu. Jasné?

V patternoch sa dajú používať tieto finty:

| Kód | ako znie | popis |
| --------------- | --------------- | --------------- |
|```s "bd sd"```            | bd ---------sd----------| strieda dva sample |
|```s "[bd bd bd db] sd"``` | bd bd bd bd sd----------| *multiplikovanie* prvý sample zopakuje 4 krát za pôvodný čas jedného|
|```s "bd*4 sd"```          | bd bd bd bd sd----------| to isté, napísane skratkou |
|```s "bd/3 sd"```|   | bd zahrá len každý tretí cyklus, opak *multiplikovania* |
|```s "<bd sd>"```|   | v každom cykle si vyberie len jeden "prvok" *substitúcia* |
|```s "bd \| sd"```|   | náhodný výber prvku *náhoda* |
|```s "[bd*3,  sd*2]"```|   | zároveň ako zahrá 3xbd, zahrá v druhej vrstve 2xsd *polyrytmus* |

Čo spravia nasledujúce príklady?
```haskell
s "bd*3 sd/2
```
```haskell
s "<bd*3 bd*20> sd"
```
```haskell
s "[ cp, bd*5 , sd*2 ]"
```
