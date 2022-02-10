#!/usr/bin/env bash
. scripts/common.sh

#rm -f img/test.disk.img
fallocate -l 1G img/test.disk.img

qemu-system-i386 -cpu 486 -m "${1-16}" -vga cirrus -machine isapc -serial stdio \
	-cdrom img/aosc.iso \
	-fda img/fd.img \
	-drive if=ide,format=raw,file=img/test.disk.img,cache=none
