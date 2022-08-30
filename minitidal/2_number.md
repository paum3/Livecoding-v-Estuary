
## Poradie samplov
To, že používame rôzne slovné skratky na pomenovanie samplov ```bd```, ```cp``` a pod. sme už videli. Čo to ale má znamenať? Skutočnosť je takáto: tieto názvy samplov sú vlastne názvy  [adresárov](https://github.com/dktr0/cybernetic-samples/tree/main/sounds), v ktorých sú uložené jednotlivé zvuky s tým, že počet zvukov v jednotlivých adresároch je rôzny. V zozname samplov dolu je v zátvorke počet samplov, ktoré daný adresár obsahuje. Ak teda napíšem ```s "strum"```, Tidal použije prvý sampel/súbor v adresári, ktorý sa volá "strum". Ak chcem zahrať iný sampel z toho adresára, použijem jeho poradové číslo s tým, že začínam od nuly.
```s "strum:2"``` zahrá teda ktorý sampel? No predsa tretí!

```haskell
s "alphabet:0 alphabet:1 alphabet:2 alphabet:3"
```

TidalCycles obsahuje samozrejme rôzne iné príkazy, ktoré treba postupne spoznávať. Vôbec nejde o to poznať všetky, ale na druhej strane čím viac ich človek pozná, tým má viac možností. Napríklad na poradové číslo samplu je príkaz ```number```, alebo lepšie skratkou len ```n```, za ktorým nasleduje poradové číslo sampla alebo pattern čísel. A to je práve to. Patterny máš rád.

Syntax je takáto:
```n PATTERN # s PATTERN```
Všímni si ```#```. To je dôležité, robí to to, že spoj PATTERN poradia s PATTERNOM samplov.


```haskell
n "0 1 2 3" # s "strum"
```

```haskell
n "0 1 2 3" # s "strum sid"
```

```"0 1 2 3"``` je tiež pattern, takže sa s tým môžeme hrať
```haskell
n "<0 20> 1*2 2/2 3" # s "strum | sid"
```

>V posledných dvoch príkladoch sa objavil nový znak ```#``` a o chvíľku k nemu pribudne aj ```$```. Tieto znaky sú špeciálne funkcie, ktoré spájajú patterny. Viac možno neskôr.
