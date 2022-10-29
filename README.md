This repository contains the site information for the Freifunk Aachen Gluon
firmware.

This branch is compatible to: Gluon master
As it needs gluons upstream package gluon-mesh-vpn-wireguard, it is incompatible to current 2021.1.x 

This Version of our firmware is currently only used for our test server

All information in this repository is licensed under [CC0 1.0 Universal][CC0],
so any inspiration or reuse for your own firmware site.conf should not be
a problem.

Firmware can be built using:

```
make manifest
```

ein einzelnes target kann man auch bauen:

`make BROKEN=1 GLUON_TARGETS=lantiq-xrx200`

or directly with 

`make all`

if a key for signing the manifest exists at `${HOME}/.gluon-secret-key`


[wiki]: https://wiki.freifunk.net/Freifunk_Aachen/Firmware#Dokumentation
[CC0]: https://creativecommons.org/publicdomain/zero/1.0/deed.en

