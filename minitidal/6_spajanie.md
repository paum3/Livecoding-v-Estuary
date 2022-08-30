

## Spájanie / stack
V Estuary môžete použiť ľubovoľný počet slotov a v každom môže niečo bežať. Niekedy je ale výhodnejšie mať kód pod kontrolou - napríklad kvôli hlastosti. Takže napríklad máme tieto dva patterny v zvlášť slotoch

```haskell
fast "1 4" $  n "<0 20> 1*2 2/2 3" # s "casio bd sid "
```
```haskell
n "0 1 2 <5 ~>" # s "strum"
```

Ak ich chceme spojiť do jedného, použijeme ```stack```

```haskell
stack [
fast "1 4" $  n "<0 20> 1*2 2/2 3" # s "casio bd sid " ,
n "0 1 2 <5 ~>" # s "strum"
] gain 0.8
```
