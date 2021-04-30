# Bootable Floppy Disk For 486 Systems

This is a set of config files for building a Linux Kernel and initramfs which fits
into a 1440KiB floppy disk, which is capable of `switch_root` into a CD-ROM, that contains
fuller-featured system. Then user could install AOSC/Retro on machines that didn't support
booting from CD-ROM.

## Baseline System Spec.
* Intel 486SX 16MHz
* atleast 12MiB of RAM
* IDE HDD & CD-ROM
* optionally, PCMCIA

## TODO:
* build script
* a simple installer for installing AOSC/Retro tarball
