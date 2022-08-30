# Kontrolné patterny

Čo to je? Možno tomu ešte zmením názov, ale v skratke sú to jednoduché funckie, ktoré menia, ako sa prehrávajú _sample_. Píšu sa v zadnej časti príkazu a od predchádzajúcich inštrukcií sú oddelené ```#```.


## Hlasitosť

Pomocou ```gain``` sa dá meniť hlasitosť prehrávania. Za týmto príkazom nasleduje číslo v rozsahu 0 - 1, ktoré reprezentuje hlasitosť na lineárnej škále. Hlasitosť môže byť zapísana aj formou patternu. Pozor si daj na desatinné čísla, ktoré sa píšu vždy s bodkou ```0.25```.


```haskell
s "strum:3 strum:5" # gain "<1 0.5>"
```

## Panoráma

Pre nastavenie stereo poľa je príkaz ```pan```, za ktorým nasleduje číslo v rozsahu 0 - 1. O znamená ľavý kanál, 1 naopak pravý. 0.5 stred. Samozrejme, aj tieto parametre môžu byť zapísané formou patternu.


```haskell
n "[0 1 2 3 5]*15" # s "arpy" # pan " 0.25 0.75"
```

## Rýchlosť

Predstav si, že máš sample, s nahrávkou nejakého slova. čo sa stane ak ju prehráš v inej rýchlosti pomalšie alebo rýchlejšie?
Pre zmenu rýchlosti prehrávania sampla je príkaz ```speed``` . Číslo za ním (opäť to môže byť pattern) znamená, ako rýchlo sa má sampel prehrať, pričom 1 znamená pôvodnú rýchlosť, 2 dvojnásobnú, 0.5 polovičnú a -1 pôvodnú, ale odzadu.


```haskell
s "alphabet*4" # speed "0.8 1.1 5 -1.1"
```


## Vowel

```vowel``` je filter, ktorý tvaruje zvuk na základe zvolenej samohlásky

```haskell
sound "sd*20" # vowel "a e i o u"
```
