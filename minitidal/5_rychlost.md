# Rýchlosť

V TidalCycles sa pod pojmom rýchlosť myslí ako rýchlo má isť jeden cyklus - loop. Východisková rýchlosť je jedna, a na zmenu sú príkazy ```fast``` a ```slow```.


## Zmena rýchlosti cyklu

```haskell
fast 2 $  n "<0 20> 1*2 2/2 3" # s "casio bd sid"
```

```haskell
fast "1 4" $  n "<0 20> 1*2 2/2 3" # s "casio bd sid"
```

```haskell
slow "1 4" $  n "<0 20> 1*2 2/2 3" # s "casio bd sid"
```

## Zmena rýchlosti cyklu a zároveň aj samplu

Príkaz ```hurry``` je kombinácia ```fast``` a ```speed```.

```haskell
hurry "<0.8 1 2>" $ s "bd sd"
```
