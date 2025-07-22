ifndef GLUON_TARGETS

define GLUON_TARGETS :=
mediatek-filogic
ramips-mt7621
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
mpc85xx-p1010
mpc85xx-p1020
ramips-mt76x8
rockchip-armv8
x86-64
endef

ifneq ($(BROKEN),0)
define GLUON_TARGETS +=
bcm27xx-bcm2710
bcm27xx-bcm2711
ipq40xx-chromium
qualcommax-ipq807x
mvebu-cortexa9
endef
endif

GLUON_TARGETS := $(GLUON_TARGETS:\n= )

endif
