# Freifunk Aachen Firmware Changelog

## v2023.1.x

## v2023.1.1
 - switch to openwrt master
 - remove mbedtls and stay with openssl for now

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