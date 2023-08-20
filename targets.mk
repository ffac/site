define GLUON_TARGETS :=
ath79-generic
ath79-nand
ath79-mikrotik
bcm27xx-bcm2708
bcm27xx-bcm2709
ipq40xx-generic
ipq40xx-mikrotik
ipq806x-generic
lantiq-xrx200
lantiq-xway
mediatek-mt7622
mediatek-filogic
mpc85xx-p1010
mpc85xx-p1020
ramips-mt7620
ramips-mt7621
ramips-mt76x8
rockchip-armv8
sunxi-cortexa7
x86-generic
x86-geode
x86-legacy
x86-64
endef

ifneq ($(BROKEN),0)
define GLUON_TARGETS +=
bcm27xx-bcm2710
bcm27xx-bcm2711
mvebu-cortexa9
endef
endif

GLUON_TARGETS := $(GLUON_TARGETS:\n= )
