# Freifunk Aachen Firmware Changelog

## v2026.1.x-parker (Branch)
  - Parker-Firmware (Routing statt Mesh, WireGuard zu Konzentratoren)
  - Gluon: ffac/gluon@v2026.1.x-parker (Parker-Patchserie auf v2026.1.x,
    ebt-nat-Feed-Redirect, uradvd-Pin mit PREF64/adv-link-mtu)
  - image-customization: ffmuc-Mesh-VPN durch ffbs-mesh-vpn-parker +
    ffbs-parker-nextnode + ffbs-wireguard-respondd ersetzt,
    ffmuc-ebpf-clat (464XLAT) und ffmuc-ipv6-ra-filter ergänzt,
    ebtables-Filter und mesh-vpn-wireguard entfernt
  - community-packages: ffac/community-packages@parker (Upstream-main +
    MUC-ebpf-clat-Serie), Pin auf 0c12ea5
  - site.conf: parker-Section (config_server, config_pubkey,
    Fingerprint 3befd26f90d9530e), mesh_vpn.parker.mtu,
    Autoupdater-Mirrors auf parker/<branch>; config-Endpunkt
    03.wg-node.freifunk-aachen.de, wireguard-Broker/peers der klassischen
    VXLAN-Topologie entfernt (add_key und ffac-wg-registration entfallen)
  - TODO: ffmuc-ebpf-clat-Build gegen Kernel 6.12 verifizieren

## v2026.0.5
  - release: update to latest 25.12
  - bump gluon to v2026.1-rc1

## v2026.0.2
  - update openwrt base to openwrt-25.12
  - switch package management from opkg to apk
  - Makefile: add signing material for new apk keys
  - update community-packages to latest
  - image-customization: switch to kmod-fs-ntfs3 (kmod-fs-ntfs removed upstream)
  - re-add ffda-node-whisperer
  - update aruba-ap325 patch
  - remove upstreamed patches (6GHz patch)

## v2026.0.1
  - release: update gluon next

## v2026.0.0
  - readd ffda-node-whisperer

## v2025.1.3
  - update gluon to v2025.1.3
  - fix channel width regression (upstream)

## v2025.1.2
  - update gluon to v2025.1.2
  - image-customization: fix tp-link device name (tp-link-cpe710-v1/v2)

## v2025.1.1-1
  - update aruba ap-325 patch
  - fix ipv6 in cellular private wlan
  - image-customization: reduce image sizes for various devices
  - fix ubiquiti-rocket-m-xm

## v2025.1.1
  - update gluon to v2025.1.1
  - set autoupdater default branch to stable
  - add aruba ap325 support
  - add support for ipv6 cellular

## v2025.1.0-1
  - complete list of targets
  - add reproducibility option to Makefile

## v2025.1.0
  - update gluon to v2025.1.0

## v2023.2.6-1
  - update to latest gluon release
  - various fixes
  - updated patches

## v2023.2.3-6
  - update gluon packages to latest main, update gluon to latest v2023.2.x
  - stable release

## v2023.2.3-5
  - add usb-hotplug and usb location package

## v2023.2.3-4
  - update gluon-ffac packages

## v2023.2.3-3
  - add mt7915 hotfix package for filogic and mt7621 devices
  - add ffmuc-custom banner
  - add ffac-private-wan-dhcp for cellular

## v2023.2.3-2
  - update modules

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
