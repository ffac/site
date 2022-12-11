This repository contains the site information for the Freifunk Aachen Gluon
firmware.

This branch is compatible to: Gluon v2022.1.x
As it needs gluons upstream package gluon-mesh-vpn-wireguard, it is incompatible to prior releases

This Version of our firmware is currently only used for our test server running at 01.wg-test.freifunk-aachen.de

All information in this repository is licensed under the MIT License,
so any inspiration or reuse for your own firmware site.conf should not be
a problem.

Firmware can be built using:

```
make manifest
```

a single target can be built using:

`make BROKEN=1 GLUON_TARGETS=lantiq-xrx200`

or directly with 

`make all`

if a key for signing the manifest exists at `${HOME}/.gluon-secret-key`


[wiki]: https://wiki.freifunk.net/Freifunk_Aachen/Firmware#Dokumentation

## Update site.mk packages

To update the site.mk packages, the `genpkglist.py` can be executed from the build server like:

```console
~/site-ffac$ ./contrib/genpkglist.py 
```

The output must then be appended to the end of the `site.mk`