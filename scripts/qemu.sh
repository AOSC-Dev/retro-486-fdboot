#!/usr/bin/env bash
qemu-system-i386 -cpu 486 -m 12 -kernel bin/linux -initrd bin/initrd -vga cirrus -machine isapc -cdrom img/aosc.iso
