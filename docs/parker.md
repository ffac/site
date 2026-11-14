# Parker-Firmware (Branch v2026.1.x-parker)

Jeder Parker-Knoten baut einen WireGuard-Tunnel zu einem Konzentrator, das
Routing passiert dort und nicht im Mesh. Gebaut wird Gluon aus
`ffac/gluon@v2026.1.x-parker` (Upstream `v2026.1.x` plus Parker-Patches) mit dem
Feed `ffac/community-packages@parker`; die Pins stehen in `release.mk` und
`modules`.

464XLAT: der Config-Server weist das NAT64-Prefix zu, `ffbs-mesh-vpn-parker`
verkündet es per RA/DHCP, `ffmuc-ebpf-clat` betreibt den CLAT auf dem Knoten,
Jool auf den Konzentratoren übersetzt.

Images liegen unter `parker/<branch>/sysupgrade`, die Branch-Namen bleiben
`stable`, `beta` und `experimental`. Legacy-Images bleiben unter
`from-2025.1.x/<branch>`. Umgeschaltet wird, indem das Parker-Manifest
veröffentlicht wird; bis dahin ist die Umstellung durch Nicht-Veröffentlichen
abbrechbar.

`sysupgrade` ohne `-n` behält Schlüssel, Registration und SSH-Zugang; `-n` bootet
in den Setup-Mode und registriert den Knoten neu.

`patches/wan-dnsmasq-resolvfile.patch` gibt dem Haupt-dnsmasq die Datei, die
`gluon-wan-dnsmasq` aus den Uplink-Leases pflegt. Ohne den Patch bleibt
`resolv.conf.auto` leer (`client6.peerdns=0`) und DNS antwortet REFUSED. Der
Patch entfällt, sobald upstream verdrahtet.
