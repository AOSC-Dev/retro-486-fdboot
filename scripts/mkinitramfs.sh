#!/usr/bin/env bash
. scripts/common.sh

mkdir -p work
rsync --del -avr initramfs work/
cp bin/busybox-mini work/initramfs/busybox
(
	cd work/initramfs
	find . | cpio -ovH newc
) | xz -1vv --check=crc32 > bin/initrd
