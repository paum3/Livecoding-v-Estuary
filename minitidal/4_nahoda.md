# Náhoda

Princíp náhody, náhodnosti nie je v hudbe ničím novým. Termíny ako stochastický, alebo aleatorický nájdete v hudobných kontextoch najmä v 20.storočí, ale možno ako zaujímavosť, Mozart spravil Menuet hracej kocky, kde si si mahli pomocou náhodých hodov klasickej šesťhrannej kocky poskladať skladbu (bol to menuet - typ dobového tanca) z predkomponovaných úsekov (taktov).

## Náhodný prvok z patternu

Znak ```|``` by sa dal preložiť ako _alebo_. V každom cykle sa použije len jede prvok z dvoch možností.

```haskell
s "hh | cp | sd | bd"
```


## Náhodné použitie prvku v patterne

```haskell
s "hh? cp? sd? bd?"
```

## Generátor náhodných čísel

```haskell
s "hh" # gain rand
```
