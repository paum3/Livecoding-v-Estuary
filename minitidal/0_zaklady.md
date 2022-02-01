## Začíname s TidalCycles v Estuary

Poďme sa pozrieť na nejaký jednoduchý príklad.  Skopírujte si tento kód do Estuary, nezabudnite si vybrať z drop-down menu MiniTidal a spusťťe ho ```Shift + Enter```.

```haskell
sound "bd"
```
Čo by ste mali počuť je zvuk basového bubna (_bass drum_, alebo kopák), v opakujúcom sa pulze:
```bd    bd    bd    bd    bd    bd    bd    bd    bd```
Teraz to zmaže a spusťte toto:
```silence```
Kopák dohral. Čo sa to teda dialo? Príkazom ```sound "bd"``` ste prikázali Tidalu, že si má nachystať nejaký zvuk, konkrétne ```"bd"```. A on ho teda, ako sa píše, pekne použije a hrá dokolečka, v _loope_. ```silence``` to všetko ukončil. Názvy samplov, ktoré sa píšu do uvodzoviek, môžu byť rôzne, ich zoznam je [tu](Zoznam samplov). Vyskúšaj, čo sa ti pozdáva. Príkaz ```sound``` má aj svoju kratšiu podobu ako ```s``` a teda mohlo by to vyzerať ak takto a bude to robiť to isté.
```haskell
--to isté, len kratšie na zapísanie
s "bd"
```
Tie uvodzovky ```"```, sú veľmi dôležité a všetko čo je v nich je _pattern_. Pokračujeme teda tam.
