# Stages:
# 	* get sources
# 	* build kernel
# 	* build musl toolchain
# 	* build busybox & busybox-mini
# 	* build e2fsprogs
# 	* mkinitramfs
# 	* tarball decompress
# 	* mkiso
# 	* mkfd
#

.PHONY:	all clean

all: img/aosc.iso img/fd.img

clean:
	./clean.sh
	rm -f .x-*

.x-sources:
	./scripts/check.sh
	./scripts/get-sources.sh
	touch $@

bin/linux:	.x-sources
	./scripts/build-kernel.sh

.x-toolchain:	.x-sources
	./scripts/build-toolchain.sh
	touch $@

.x-busybox:	.x-toolchain
	./scripts/build-busybox.sh
	touch $@

.x-packages: .x-toolchain
	./scripts/build-packages.sh
	touch $@

bin/initrd:	.x-busybox
	./scripts/mkinitramfs.sh

.x-tarball:
	./scripts/tarball-prepare.sh
	touch $@

img/aosc.iso: .x-busybox .x-packages .x-tarball bin/linux
	./scripts/mkiso.sh

img/fd.img: bin/linux bin/initrd
	sudo ./scripts/mkfd.sh
