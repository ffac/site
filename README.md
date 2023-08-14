This repository contains the site configuration for the Freifunk Aachen Gluon
firmware.

This is the `v2023.1.x` branch which is compatible to current Gluon v2023.1 release using OpenWRT 22.03.

It allows updates from v2021.x onwards - so v2020 or before need to migrate to v2021 or v2022 first.

This config uses the upstream `gluon-mesh-vpn-wireguard` [^gluon-meshvpn] implementation.
Registration of the wireguard keys is done using a custom `wg-registration` package which sends the key through POST to our broker.

Firmware can be built using `make manifest` or `make sign` if a key for signing the manifest is existing in the home directory at `${HOME}/.gluon-secret-key`.
A single target can be built using:

`make build GLUON_TARGETS=lantiq-xrx200`

## CHANGELOG
The [CHANGELOG](./CHANGELOG.md) can be found [here](./CHANGELOG.md)

## Update site.mk packages

To update the site.mk packages, the `genpkglist.py` can be executed from the build server like:

```console
~/site-ffac$ ./contrib/genpkglist.py
```

The output must then be appended to the end of the `site.mk`

Currently outdated further information can be found in the Freifunk Wiki[^wiki]


[^wiki]: https://wiki.freifunk.net/Freifunk_Aachen/Firmware#Dokumentation
[^gluon-meshvpn]: https://gluon.readthedocs.io/en/latest/features/vpn.html#wireguard

