# Náhoda

Princíp náhody, náhodnosti nie je v hudbe ničím novým. Termíny ako stochastický alebo aleatorický nájdete v hudobných kontextoch najmä v 20. storočí, ale možno ako zaujímavosť Mozart spravil Menuet hracej kocky, kde ste si mohli pomocou náhodných hodov klasickej šesťhrannej kocky poskladať skladbu (menuet - typ dobového tanca) z predkomponovaných úsekov (taktov).

## Náhodný prvok z patternu

Znak ```|``` by sa dal preložiť ako _alebo_. V každom cykle sa použije len jeden prvok z dvoch možností.

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
