#!/bin/sh
. scripts/common.sh

alias c='git clone --depth 1'

c -b linux-5.10.y https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
c https://git.busybox.net/busybox
cp -ar busybox busybox-mini

mkdir -p contrib
cd contrib

c https://github.com/tytso/e2fsprogs.git
c https://github.com/richfelker/musl-cross-make.git
