## Začíname s TidalCycles v Estuary

Poďme sa pozrieť na nejaký jednoduchý príklad.  Skopírujte si tento kód do Estuary, nezabudnite si vybrať z drop-down menu MiniTidal a spusťťe ho ```Shift + Enter```.

```haskell
sound "bd"
```
Čo by ste mali počuť, je zvuk basového bubna (_bass drum_, alebo kopák) v opakujúcom sa pulze:
```bd    bd    bd    bd    bd    bd    bd    bd    bd```
Teraz to zmažte a spustite toto:
```silence```
Kopák dohral. Čo sa to teda udialo? Príkazom ```sound "bd"``` ste prikázali Tidalu, že si má nachystať nejaký zvuk, konkrétne ```"bd"```. A on ho teda, ako sa píše, pekne použije a hrá dokolečka, v _loope_. ```silence``` to všetko ukončil. Názvy samplov, ktoré sa píšu do úvodzoviek, môžu byť rôzne, ich zoznam je [tu](https://github.com/paum3/Livecoding-v-Estuary/blob/main/2_minitidal.md#Zoznam%20samplov). Vyskúšaj, čo sa ti pozdáva. Príkaz ```sound``` má aj svoju kratšiu podobu ako ```s``` a teda bude robiť to isté.
```haskell
--to isté, len kratšie na zapísanie
s "bd"
```
Tie úvodzovky ```"``` sú veľmi dôležité a všetko čo je v nich je _pattern_. Pokračujeme teda tam.
