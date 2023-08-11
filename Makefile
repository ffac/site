#########################
#### Custom Options: ####
#########################
# GLUON_RELEASE - customize full release name
# BUILD_NUMBER - customize only the build number of the release name
#########################
# GLUON_TARGETS - choose which targets to build (delimited by spaces) e.g. "ath79-generic ramips-mt7621"
# GLUON_DEVICES - choose which devices to build (delimited by spaces) e.g. "avm-fritz-box-4020 tp-link-tl-wdr4300-v1", moves images to devices/ instead of output/, no packages are copied to the devices/ folder
# BROKEN - set to 0 to disable building devices marked as broken
#########################
# GLUON_PRIORITY - set update priority (integer)
# GLUON_AUTOUPDATER_ENABLED - set to 0 to disable the autoupdater
# GLUON_LANGS - set to subset of (en de fr) to include less languages
#########################
# JOBS - set number of threads manually
# GLUON_DEBUG set to 1 to include debug symbols (requires at least 16MB of flash, advice: also set GLUON_DEVICES, run 'make clean' before executing if you care for all packages to be rebuilt with debug symbols)
# GLUON_MINIFY set to 0 to disable minification of scripts (lua etc.)
#########################
# SECRET_KEY_FILE - Path to your ECDSA signing key
# OPKG_KEY_FOLDER - Path to your OpenWrt package signing key
#########################


## Setup Build environment variables
include release.mk
include targets.mk
GLUON_BUILD_DIR := gluon-build

export GLUON_SITEDIR := ..
PATCH_DIR := patches
SECRET_KEY_FILE ?= $(HOME)/.gluon-secret-key
OPKG_KEY_FOLDER ?= $(HOME)/.key-build


## Create version scheme
EXP_FALLBACK = $(shell date '+%Y%m%d')
BUILD_NUMBER ?= $(EXP_FALLBACK)
GIT_TAG := $(shell git describe --tags 2>/dev/null)
ifeq (,$(GIT_TAG))
ifndef GLUON_RELEASE
$(error Set GLUON_RELEASE or create a git tag)
endif
endif
ifneq (,$(shell git describe --exact-match --tags 2>/dev/null))
	GLUON_RELEASE ?= $(GIT_TAG)
else
	GLUON_RELEASE ?= $(GIT_TAG)~exp$(BUILD_NUMBER)
endif
export GLUON_RELEASE


## Setup MAKE
JOBS ?= $(shell cat /proc/cpuinfo | grep -c ^processor)
MAKEFLAGS += -j$(JOBS)
MAKEFLAGS += --no-print-directory
MAKEFLAGS += --output-sync

GLUON_MAKE = $(MAKE) -C $(GLUON_BUILD_DIR)
GLUON_GIT = git -C $(GLUON_BUILD_DIR)


## Build strings for INFO
define newline


endef
ifneq (,$(filter GLUON_TARGETS%,$(MAKEOVERRIDES)))
	TARGETS_INFO := $(newline)\# for target(s) '$(GLUON_TARGETS)'
endif
ifneq (,$(filter GLUON_DEVICES%,$(MAKEOVERRIDES)))
	DEVICE_INFO := $(newline)\# for device(s) '$(GLUON_DEVICES)'
endif


## Info section
define INFO :=

#########################
# FFAC Firmware build
# building release '$(GLUON_RELEASE)'$(TARGETS_INFO)$(DEVICE_INFO)
#########################
# MAKEFLAGS:
# $(MAKEFLAGS)
#########################
# git url: $(GLUON_GIT_URL)
# git ref: $(GLUON_GIT_REF)
#########################
# Found $(shell ls -1 $(PATCH_DIR) 2>/dev/null | wc -l) patches
#########################

endef
# show info section for all make calls except the filtered ones
ifneq (,$(filter-out gluon-clean output-clean clean,$(MAKECMDGOALS)))
$(info $(INFO))
endif


## Prepare folders
$(GLUON_BUILD_DIR):
	mkdir -p $(GLUON_BUILD_DIR)
	@echo

# Note: "|" means "order only", e.g. "do not care about folder timestamps"
# In other words: call requirement when file/folder doesn't exist instead of when it is outdated.
# e.g. after running gluon-clean but not on every run.
# https://www.gnu.org/savannah-checkouts/gnu/make/manual/html_node/Prerequisite-Types.html
$(GLUON_BUILD_DIR)/.git: | $(GLUON_BUILD_DIR)
	@git init $(GLUON_BUILD_DIR) -b master
	@$(GLUON_GIT) remote add origin $(GLUON_GIT_URL)

gluon-update: | $(GLUON_BUILD_DIR)/.git
	@$(GLUON_GIT) fetch --tags origin $(GLUON_GIT_REF)
	@$(GLUON_GIT) checkout master >/dev/null 2>&1 || exit 0
	@$(GLUON_GIT) reset --hard FETCH_HEAD
	@$(GLUON_GIT) clean -fd
	@echo


## Build rules
all: manifest

sign: manifest | $(SECRET_KEY_FILE)
	@for branch in experimental beta stable; do \
		echo ''; \
		echo ''Signing $$branch.manifest''; \
		$(GLUON_BUILD_DIR)/contrib/sign.sh $(SECRET_KEY_FILE) output/images/sysupgrade/$$branch.manifest; \
	done

# Note: $(GLUON_MAKE) is a recursive variable so it doesn't count as a $(MAKE).
# "+" tells MAKE that there is another $(MAKE) in the following shell script.
# This allows communication of MAKEFLAGS like -j to submake.
# https://stackoverflow.com/a/60706372/2721478
manifest: build
	+for branch in experimental beta stable; do \
		$(GLUON_MAKE) manifest GLUON_AUTOUPDATER_BRANCH=$$branch;\
	done

build: gluon-prepare output-clean
	cp OPKG_KEY_FOLDER/* $(GLUON_BUILD_DIR)/openwrt || true
	+for target in $(GLUON_TARGETS); do \
		echo ''Building target $$target''; \
		$(GLUON_MAKE) download all GLUON_TARGET=$$target CONFIG_JSON_ADD_IMAGE_INFO=1; \
	done
	mkdir -p $(GLUON_BUILD_DIR)/output/opkg-packages
	cp -r $(GLUON_BUILD_DIR)/openwrt/bin/packages $(GLUON_BUILD_DIR)/output/opkg-packages/gluon-ffac-$(GLUON_RELEASE)/

gluon-prepare: gluon-update
	make ffac-patch
	+$(GLUON_MAKE) update

PATCH_FILES = $(shell find $(PATCH_DIR)/ -type f -name '*.patch')
ffac-patch:
	@echo 'Applying patches…'
	@if [ `$(GLUON_GIT) branch --list patched` ]; then \
		$(GLUON_GIT) branch -D patched; \
	fi
	@$(GLUON_GIT) checkout -B patching
	@if [ -d "$(PATCH_DIR)" -a "$(PATCH_DIR)/*.patch" ]; then \
		(git apply --directory=$(GLUON_BUILD_DIR) --ignore-space-change --ignore-whitespace --whitespace=nowarn --verbose $(PATCH_FILES)) || ( \
			$(GLUON_GIT) clean -fd; \
			$(GLUON_GIT) checkout -B patched; \
			$(GLUON_GIT) branch -D patching; \
			exit 1 \
		) \
	fi
	@$(GLUON_GIT) branch -M patched

gluon-clean:
	rm -rf $(GLUON_BUILD_DIR)

output-clean:
	mkdir -p output/
	rm -rf output/*

clean: gluon-clean output-clean
