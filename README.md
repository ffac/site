This repository contains the site configuration for the Freifunk Aachen Gluon
firmware.

This is the `v2023.2.x` branch which is compatible with currents Openwrt Master and will be merged into v2023.2.x once released.

Nothing is guaranteed here, it might get force-pushed from time to time to be rebased.
It provides an option to test devices which are available in Gluon's master branch but are not released yet.

This config uses the upstream `gluon-mesh-vpn-wireguard` [^gluon-meshvpn] implementation.
Registration of the wireguard keys is done using a custom `wg-registration` package which sends the key through POST to our broker.

Firmware can be built using `make manifest` or `make sign` if a key for signing the manifest is existing in the home directory at `${HOME}/.gluon-secret-key`.
A single target can be built using:

`make build GLUON_TARGETS=lantiq-xrx200`

## CHANGELOG
The [CHANGELOG](./CHANGELOG.md) can be found [here](./CHANGELOG.md)

Currently outdated further information can be found in the Freifunk Wiki[^wiki]


[^wiki]: https://wiki.freifunk.net/Freifunk_Aachen/Firmware#Dokumentation
[^gluon-meshvpn]: https://gluon.readthedocs.io/en/latest/features/vpn.html#wireguard

