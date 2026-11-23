# Parker-Firmware (Branch v2026.1.x-parker)

Jeder Parker-Knoten baut einen WireGuard-Tunnel zu einem Konzentrator, das
Routing passiert dort und nicht im Mesh. Gebaut wird Gluon aus
`ffac/gluon@v2026.1.x-parker` (Upstream `v2026.1.x` plus wenige
Parker-Commits) mit dem Feed `ffac/community-packages@parker-gluon-compat-clat`
(Upstream `main` plus Parker-Fixes und `ffmuc-ebpf-clat`); die Pins stehen in `release.mk` und `modules`. Die Parker-Logik steckt im Paket
`ffbs-mesh-vpn-parker`, es schaltet über `/lib/gluon/features/` die
Gluon-Teile ein, die nur Parker braucht (z. B. den radv-filterd-Redirect).

464XLAT: der Config-Server weist das NAT64-Prefix zu, `ffbs-mesh-vpn-parker`
verkündet es per RA/DHCP, `ffmuc-ebpf-clat` betreibt den CLAT auf dem Knoten,
Jool auf den Konzentratoren übersetzt.

Next-Node: jeder Knoten verkündet `fdac::/64` on-link und beantwortet
`fdac::ac`, auch ohne Uplink. Den Namen `nextnode` löst der dnsmasq jedes
Knotens selbst auf.

Images liegen unter `parker/<branch>/sysupgrade`, die Branch-Namen bleiben
`stable`, `beta` und `experimental`. Legacy-Images bleiben unter
`from-2025.1.x/<branch>`. Umgeschaltet wird, indem das Parker-Manifest
veröffentlicht wird; bis dahin ist die Umstellung durch Nicht-Veröffentlichen
abbrechbar.

`sysupgrade` ohne `-n` behält Schlüssel, Registration und SSH-Zugang; `-n` bootet
in den Setup-Mode und registriert den Knoten neu.

DNS: Jeder Knoten ist DNS-Server seiner Clients (DHCPv4 und RDNSS zeigen auf
ihn), sein dnsmasq fragt die IPv6-Server aus `dns.servers` durch den Tunnel.
Ohne `dns.servers` hätte er keinen festen Upstream, und Gluon ließe `peerdns`
auf `client` an: ein Mesh-only-Knoten nähme dann `10.80.96.1` aus der Lease
des Nachbarn als eigenen Resolver, die bei ihm selbst auf `wg_c1` liegt.
