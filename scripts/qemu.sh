#!/usr/bin/env bash

#rm -f img/test.disk.img
#fallocate -l 1G img/test.disk.img

qemu-system-i386 -cpu 486 -m "${1-16}" -vga cirrus -machine isapc \
	-cdrom img/aosc.iso \
	-drive if=ide,format=raw,file=img/test.disk.img,cache=none
	#-kernel bin/linux -initrd bin/initrd -append 'console=ttyS0 console=tty0' \
