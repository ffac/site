# Freifunk Aachen Firmware Changelog

## v2023.1.1-2
  - fix opkg key folder creation (when initializing firmware repo)
  - add ffda-network-setup-mode for zyxel-nwa55axe
  - readd FB 7520/7530
  - fix raspi names
  - update gluon to v2023.1.x

## v2023.1.1-1
 - build from v2023.1.1
 - this did break FB 7520/7530

## v2023.1.0-4
 - update to latest v2023.1.x
 - fix for D-Link 860L
 - revert x86-64 efi to allow upgrade from v2021.x
 - update community-packages modules
 - Makefile fixes

## v2023.1.0-3
 - revert x86-64 efi to allow upgrade from v2021.x

## v2023.1.0-2
 - release from gluon v2023.1 tags
 - Makefile changes
 - rebase onto v2022.1.x

## v2023.1.0-1
 - release from current gluon master
 - based on openwrt 22.03
 - soon to become v2023.1.1 when released in gluon
 - adds support for new devices
 - use ffac-bat4-mesh mesh id

## v2022.1.14-1
 - use ffac/community-packages for all packages
 - switch to ffac-bat4-mesh as new mesh id
 - this release does therefore not mesh with previous versions
 - built from gluon v2022.1.4
 - fixes autoupdater-wifi-fallback

## v2022.1.14
 - update to latest gluon v2022.1.x
 - use batman_iv
 - this release changes the autoupdater to stable
 - add french site support
 - use new broker and second supernode
 - fixes for registration script

## v2022.1.13
 - update segments
 - update gluon to v2022.1.3
 - add qemu-ga to x86-64
 - add openssh-sftp-server to make using scp in the future as easy as it is now
 - add djfe signing key
 - switch to ffac repo mirrors
 - add eulenfunk hotfix patches
 - easier targets in makefile
 - switch default autoupdater branch to stable

 ## v2022.1.12
 - revert to v2022.1.1 as v2022.1.2 did break on some devices

## v2022.1.11
 - add anonymization on status page
 - add weekly-reboot
 - add asus rt-ax53u
 - remove USB for EX3700 as one device was softbricked
 - fix bash script in wg-registration

## v2022.1.10
 - use own tile layer in config mode
 - fix translations
 - remove fastd config
 - set gw_sel_class=1500 and mut=1406
 - fix switch config for o2 box 6431
 - remove TLS from d-link dir825b1

## v2022.1.9
 - working experimental autoupdater
 - fix community-build key for autoupdater

## v2022.1.8
 - add TLS packages (needed for opkg update)
 - add asus rt-ax53u
 - update wg-registration

## v2022.1.7
 - add TLS packages
 - add LICENSE
 - add patches from FFMUC

## v2022.1.6
 - remove TLS packages

## v2022.1.5
 - update gluon build to v2022.1.x

## v2022.1.4
 - use ffac-bat5-mesh as mesh-ssid for new firmware (5GHz)

## v2022.1.3
 - working Broker Registration for Wireguard keys
 - update wg-registration
 - add broker url to site config

## v2022.1.2
 - use ffac-bat5-mesh as mesh-ssid for new firmware (2.4GHz)

## v2022.1.1
 - add FB7330 (SL) and FB7430

 ## v2022.1.0
 - initial working v2022 wireguard configuration
