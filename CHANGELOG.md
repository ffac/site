# Freifunk Aachen Firmware Changelog


## v2021.1.x

## v2021.1.10
  - remove upstreamed patch (vxlan)
  - fix a few bugs introduced by merging branch 22
  - update translation
  - update gluon to newest commit in branch v2021.1.x

## v2021.1.9
  - update segments
  - add djfe signing key

## v2021.1.8
  - add radv-filterd and ebtables-limit-arp
  - remove factory images for deprecated devices

## v2021.1.7
 - working Mesh-VPN for v2021
 - add missing udp6zerocsumtx udp6zerocsumrx https://github.com/ffac/gluon-mesh-vpn-wireguard/commit/6fe6dba6270781690f65db5147c416848b34f2df
 - add anonymization on status page
 - update genpkglist and site.mk
 - Enable TLS on all devices

## v2021.1.6
 - set autoupdater to experimental
 - remove radv-filterd and ebtables-limit-arp
 - initial autoupdater using community-build server
 - use ff-mesh-vpn-wireguard-openwrt19

## v2021.1.5
 - update LICENSE and README
