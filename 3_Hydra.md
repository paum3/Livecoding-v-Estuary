# Hydra
Hydra je jeden z livecodingových jazykov pre vizuály, ktorý je k dispozícii v Estuary.
Hydru si môžete spustiť aj samostatne v prehliadači na adrese https://hydra.ojack.xyz/.
Vytvorila ju umelkyňa a programátorka Olivia Jack inšpirovaná analógovými nástrojmi.

Pre viac informácií o Hydre sa pozrite na dokumentáciu https://github.com/ojack/hydra#Getting-Started alebo zoznam všetkých funkcií https://ojack.xyz/hydra-functions/.

Hydra je napísaná v programovacom jazyku, ktorý sa volá JavaScript, preto všetky príkazy majú na svojom konci okrúhle zátvorky ```()```, do ktorých sa často píšu parametre. Zátvorky treba napísať aj keď nezadávame žiadne parametre.


### Rozdiel medzi originálnou verziou a verziou v Estuary:
- nie sú implementované všetky funkcie
- jednolivé riadky treba v Estuary oddeliť znakom bodkočiarka ```;```
- Hydra v Estuary nevie reagovať na zvuk

### Pre vymazanie
```javascript
solid().out()
```



### Zdroje obrazu
Ako zdroje či materiál, ktorý sa dá v hydre používať, sú k dispozícii dve kategórie:
* Hotové zdroje (kamera, video, obrázok, desktop)
* Generované zdroje (farba, geometrické tvary, oscilátor, šum, voronoi)

S jednotlivými zdrojmi sa dá manipulovať, modulovať alebo ich pomocou kompozitných funkcií kombinovať.

Poďme na to:



Kamera
```javascript
s0.initCam();
src(s0).out()
```
Video
```javascript
s0.initVideo("https://media.giphy.com/media/AS9LIFttYzkc0/giphy.mp4");
src(s0).out()
```
Obrázok
```javascript
s0.initImage("https://upload.wikimedia.org/wikipedia/commons/2/25/Hydra-Foto.jpg")
src(s0).out()
```

Desktop
```javascript
s0.initScreen();
src(s0).out()
```



Geometrické zdroje


Shapes
```javascript
shape(2).scale(0.01).out(o0)
```


Oscilátor
```javascript
osc(freq,sync,offset)
 ```

Noise (Šum)

```javascript
noise(10, 0).out(o0)
```

Voronoi

```javascript
voronoi(10, 0).out(o0)
```

### Kompozitné funkcie

blend()

diff()

mult()

add()


Manipulácia

```repeat```

kaleid

rotate

scale

pixelate

repeat

repeatX

repeatY

kaleid

scrollX

scrollY


# Farba

posterize

shift

invert

contrast

brightness

luma

thresh

color

saturate

hue

colorama
