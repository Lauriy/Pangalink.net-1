# Pangalinker

## Eeldused

-   [Node.js](http://nodejs.org/), vähemalt versioon 8.0.0
-   [MongoDB](http://www.mongodb.org/)
-   OpenSSL käsurea utiliit. Linux põhistes süsteemides reeglina vaikimisi olemas, Windowsis tuleb see ise [paigaldada](https://blog.didierstevens.com/2015/03/30/howto-make-your-own-cert-with-openssl-on-windows/)

## Kiirpaigaldus

Pangalinkerit on võimalik kiirpaigaldada tühja Ubuntu 16.04 operatsioonisüsteemiga serverisse. "Tühja" selles mõttes, et sinna pole veel paigaldatud muud tarkvara. Juhul kui rakenduse failid on kopeeritud serverisse, tuleks rakenduse kaustas käivitada järgmine käsk:

    sudo ./setup/ubuntu-install.sh

Paigaldusskript paigaldab ja konfigureerib järgmised tarkvarad:

-   MongoDB
-   Node.js
-   Pangalinkeri rakendus (failid kopeeritakse süsteemsesse kausta)

Paigaldusskript kasutab seadistusteks serveri avalikult tuletatavat domeeninime.

Parimal juhul ei olegi vaja midagi rohkemat seadistada ning võib avada rakenduse veebilehe. Vaikimisi jookseb selliselt paigaldatud rakendus üle HTTP ning seega tasub kaaluda võimalusi rakenduse seadistamiseks nii, et see kasutaks HTTPS protkolli.

## Windowsi kasutajatele

Pangalinker genereerib sertifikaadid `openssl` käsu abil. Linux/Unix põhistes süsteemides on `openssl` reeglina vaikimisi installitud, kuid Windowsis ei ole. Seega Pangalinker kasutamiseks kontrolli, et OpenSSL oleks installitud ja Node.js jaoks saadaval, vastasel korral ei ole võimalik genereerida serte ja teenus ei hakka korralikult tööle.

## Nginx / Apache jmt

Juhul kui samas serveris serveerib veebiporte juba Apache või Nginx vmt veebiserveri rakendus, siis Pangalinker otse veebi serveerimisega tegeleda ei saa. Lahenduseks oleks sellisel juhul

1.  Kas kasutada mittestandardset porti. http://example.com/ asemel näiteks http://example.com:3000/
2.  Või seadistada peamine veebiserver proksima Pangalinkeri päringuid. Näidisseadistused Apache ja Nginx jaoks leiab setup/virtual-hosts kaustast.

## Käivitamine

Rakenduse kaustas:

    node index.js

Juhul kui veebiliides kasutab porti 80 või 443, pead käivitama rakenduse juurkasutaja õigustes.

## Konfiguratsioon

Muuda faili `config/default.js` väärtusi või või lisa NODE_ENV väärtuse nimega täiendav fail (soovitatav). Lisakonfiguratsioonifailid täiendavad, mitte ei asenda vaikimisi seadeid.

Näiteks kui tahad, et konfiguratsioon laetaks failidest _default.js_ + _production.js_, käivita rakendus järgmiselt:

    NODE_ENV=production node index.js

### Andmebaasi seadistus

Juhul kui MongoDB andmebaas kasutab autentimist või on _replica set_ või shardingu konfiguatsioonis, siis sellega seotud andmed saab määrata andmebaasi URL'is, mille vormingu info [leiab siit](https://docs.mongodb.com/manual/reference/connection-string/)

## Litsents

**[MIT](./LICENSE)**
