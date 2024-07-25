# Freifunk Aachen Firmware Changelog

## v2023.2.3-1
  - update gluon to v2023.2.2
  - add driver error based workaround for mt7915

## v2023.2.2-3
  - add general-workaround if mesh connection is lost
  - add tecff-broken-wlan-workaround
  - reduce mtu by 70 on mesh-vpn interface
  - set gw_sel_class to 20 to improve switching
  - fix device names which include cellular package
  - remove autoupdater-wifi-fallback from mt7620 due to size
  - update gluon and community-packages

## v2023.2.2-2
  - debug firmware with sae gluon-usteer and owe
  - not released with signatures

## v2023.2.2-1
  - update gluon to v2023.2.2
  - add time-based workaround for mt7915
  - makefile fix issue when upstream adds new patches

## v2023.2.1-1
  - update gluon to v2023.2.1
  - remove old unused x86 targets and sunxi-cortexa7

## v2023.2.0-9
  - add open-vm-tools to x86-64
  - update to latest gluon v2023.2.x
  - fixes WDR3600 and WDR4300 hang on reboot issue
  - fixes 40MHz operation with highest 5GHz channel

## v2023.2.0-8
  - package configuration with image-customization.lua
  - switch to maurerle/covr-x1860-gluon openwrt base
  - remove obsolete patches
  - switch from openssl to mbedtls (gluon-tls)
  - add ff-web-ap-timer
  - update to latest community-packages
  - update gluon release to v2023.2
  - add ffda-network-setup-mode for zyxel-nwa55axe
  - fix opkg key folder creation

## v2023.2.0-7
  - fix building wax218
  - add FR3000, FR1750e, Xiaomi AX3600, EAP225v3
  - add ZTE MF289F, TP-Link Archer AX23, Ubiquiti UniFi nanoHD, Mikrotik WAP AC (D2), Netgear WAX218, Google WiFi (Gale)

## v2023.2.0-6
  - update openwrt to nearly v23.05.0-rc4
  - update community-packages
  - zyxel wsm20 is upstream

## v2023.2.0-5
  - ax53u is upstream, 
  - add filogic target
  - add zyxel wsm20

## v2023.2.0-4
  - remove broken devices
  - enable sn01 supernode
  - disable french translation
  - add covr-x1860
  - add asus-rt-ax53u

## v2023.2.0-3
 - add recovery and factory for covr-x1860

## v2023.2.0-2
 - update openwrt to v23.05 branch

## v2023.2.0-1
 - switch to openwrt master
 - build from gluon master
 - this will be released as v2023.2.0 gluon someday hopefully
 - remove mbedtls and stay with openssl for now
 - switch to ffac-bat4-mesh mesh id
