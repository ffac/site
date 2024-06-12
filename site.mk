##  gluon site.mk Freifunk Regio Aachen

# Build everything by default
export BROKEN ?= 1
GLUON_DEPRECATED := upgrade

GLUON_OUTPUTDIR := ${GLUON_SITEDIR}/output
ifdef GLUON_DEVICES
GLUON_OUTPUTDIR := $(GLUON_SITEDIR)/devices
endif
GLUON_PACKAGEDIR := $(GLUON_OUTPUTDIR)/packages/modules

# Default priority for updates.
GLUON_PRIORITY ?= 0

# Autoupdate by default
GLUON_AUTOUPDATER_ENABLED ?= 1

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= en de
