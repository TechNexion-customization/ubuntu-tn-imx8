######################################################################
#         2020 Technexion Ltd. Ubuntu Makefile - DO NOT EDIT         #
# Written by: Wig Cheng  <wig.cheng@technexion.com>                  #
######################################################################

include common.mk

ROOTFS_PACK := rootfs.tgz

all: build

clean:
	rm -rf output/$(ROOTFS_PACK)
distclean: clean

build-rootfs: src

ifeq ($(PLATFORM),pico-imx8mm)
	$(eval TARGET := pico-imx8mm)
else ifeq ($(PLATFORM),axon-imx8mp)
	$(eval TARGET := axon-imx8mp)
else ifeq ($(PLATFORM),edm-g-imx8mp)
	$(eval TARGET := edm-g-imx8mp)
else ifeq ($(PLATFORM),edm-imx8m)
	$(eval TARGET := edm-imx8m)
else ifeq ($(PLATFORM),pico-imx8m)
	$(eval TARGET := pico-imx8m)
endif

	@echo "build rootfs..."
	./gen_rootfs.sh $(TARGET)
	@mv $(ROOTFS_PACK) output/$(ROOTFS_PACK)

build: build-rootfs

src:
	if [ ! -f output ] ; then \
		mkdir -p output; \
	fi

.PHONY: build-rootfs build
