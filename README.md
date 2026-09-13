This repository contains the site configuration and build automation for the Freifunk Aachen Gluon firmware.

## Build Requirements

For build requirements, dependencies, and environment setup, please refer to the official [Gluon Documentation: Getting Started](https://gluon.readthedocs.io/en/latest/user/getting_started.html).

## Building Firmware

This site repository contains a top-level `Makefile` wrapper that handles checking out the matching Gluon version, applying local patches, and compiling firmware images.

### 1. Build all targets and manifests

Simply clone this repository and run:

```bash
git clone https://github.com/ffac/site.git
cd site
make manifest
```

This will automatically:
- Download the required Gluon release (configured in `release.mk`) into `gluon-build/`
- Apply custom patches in `patches/`
- Update Gluon package feeds/modules
- Compile all configured targets (defined in `targets.mk`)
- Generate manifests for `experimental`, `beta`, and `stable` autoupdater branches

The finished images and manifests will be located in the `output/` directory (e.g. `output/images/`).

### 2. Build specific target(s) or device(s)

To build only a specific target (e.g. `mediatek-filogic` or `ramips-mt7621`):

```bash
make build GLUON_TARGETS=mediatek-filogic
```

To build only specific hardware device(s):

```bash
make build GLUON_DEVICES="openwrt-one asus-rt-ax52"
```
*(Device-specific builds output images into `devices/`)*

### 3. Useful Make Options

- `make print-targets`: Lists all targets defined in `targets.mk`.
- `make build`: Compiles images without generating autoupdater manifests.
- `make manifest`: Compiles images and generates autoupdater branch manifests.
- `make sign`: Builds images, manifests, and signs them (requires `${HOME}/.gluon-secret-key` or `SECRET_KEY_FILE`).
- `make clean`: Cleans up `gluon-build/`, `output/`, and `devices/`.
- `JOBS=<N>`: Controls parallel jobs (defaults to available CPU cores via `nproc`).
- `GLUON_RELEASE=<version>`: Override the firmware release string (otherwise derived from git tag/commit).
- `BROKEN=0`: Disable building devices marked as broken (broken devices are included by default).

## Architecture Details

- WireGuard Mesh: Uses upstream `gluon-mesh-vpn-wireguard` [^gluon-meshvpn].
- WireGuard Key Registration: Done via custom `wg-registration` package which registers keys via POST to our broker.
- Changelog: See [CHANGELOG.md](./CHANGELOG.md).
- Aachen Wiki: [Freifunk Aachen Firmware Wiki](https://wiki.freifunk.net/Freifunk_Aachen/Firmware).

[^gluon-meshvpn]: https://gluon.readthedocs.io/en/latest/features/vpn.html#wireguard
