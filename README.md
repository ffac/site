This repository contains the site information for the Freifunk Aachen Gluon
firmware.

This branch is compatible to: Gluon v2021.1.2
As it needs gluons upstream package gluon-mesh-vpn-wireguard, it is incompatible to latest 2022.1.x 

This Version of our firmware is currently only used for our test server.

Currently, registration using Wireguard already works using a custom repository - yet there is still an issue establishing the VXLAN connection.

Firmware can be built using:

```
make manifest
```

a single target can be built using:

`make build BROKEN=1 GLUON_TARGETS=lantiq-xrx200`

or directly with 

`make all`

if a key for signing the manifest exists at `${HOME}/.gluon-secret-key`


[wiki]: https://wiki.freifunk.net/Freifunk_Aachen/Firmware#Dokumentation
[CC0]: https://creativecommons.org/publicdomain/zero/1.0/deed.en

