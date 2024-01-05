# Freifunk Aachen Firmware Changelog

## v2021.1.2-15
  - add time.freifunk-aachen.de as ntp server
  - remove servers with closed ntp port

## v2021.1.2-14
  - update community-packages to fix NTP issue

## v2021.1.2-13
  - update community-packages
  - remove test update server

## v2021.1.2-12
  - add sn01
  - fix opkg openwrt repo 

## v2021.1.2-11
  - fix mesh_vpn

## v2021.1.2-10
  - use wg-broker.freifunk-aachen.de
  - use 02.wg-node.freifunk-aachen.de
  - switch to BATMAN_IV
  - remove BATMAN_V patches
  - remove upstreamed patch (vxlan)
  - fix a few bugs introduced by merging branch 22
  - update translation
  - update gluon to newest commit in branch v2021.1.2-x
  - remove tp-link-tl-mr3220 and d-link-dir-615-rev-c1
  - use ffac-bat4-mesh as meshid

## v2021.1.2-9
  - update segments
  - add djfe signing key

## v2021.1.2-8
  - add radv-filterd and ebtables-limit-arp
  - remove factory images for deprecated devices

## v2021.1.2-7
 - working Mesh-VPN for v2021
 - add missing udp6zerocsumtx udp6zerocsumrx https://github.com/ffac/gluon-mesh-vpn-wireguard/commit/6fe6dba6270781690f65db5147c416848b34f2df
 - add anonymization on status page
 - update genpkglist and site.mk
 - Enable TLS on all devices

## v2021.1.2-6
 - set autoupdater to experimental
 - remove radv-filterd and ebtables-limit-arp
 - initial autoupdater using community-build server
 - use ff-mesh-vpn-wireguard-openwrt19

## v2021.1.2-5
 - update LICENSE and README
