This repository contains the site configuration for the Freifunk Aachen Gluon
firmware.

This branch is compatible to Gluon v2021.1.x which is still based on OpenWRT 19.07

Currently, registration using Wireguard already works using a custom package `ff-mesh-vpn-wireguard-openwrt19` which is compatible to gluons upstream implementation `gluon-mesh-vpn-wireguard` [^gluon-meshvpn].

This allows to use give older devices, which are not supported by Gluon 2022.1.x an upgrade to wireguard so that we can fade out FastD on our server-side

Firmware can be built using `make manifest` or `make sign` if a key for signing the manifest is existing in the home directory at `${HOME}/.gluon-secret-key`.
A single target can be built using:

`make build BROKEN=1 GLUON_TARGETS=lantiq-xrx200`

[CHANGELOG](./CHANGELOG.md)


[^wiki]: https://wiki.freifunk.net/Freifunk_Aachen/Firmware#Dokumentation
[^CC0]: https://creativecommons.org/publicdomain/zero/1.0/deed.en
[^gluon-meshvpn]: https://gluon.readthedocs.io/en/latest/features/vpn.html#wireguard