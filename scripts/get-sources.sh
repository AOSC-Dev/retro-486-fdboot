#!/bin/sh
. scripts/common.sh

alias c='git clone --depth 1'

[ -d linux ] || c -b linux-5.10.y https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[ -d busybox ] || c https://git.busybox.net/busybox
[ -d busybox-mini ] || cp -ar busybox busybox-mini

mkdir -p contrib
cd contrib

[ -d e2fsprogs ] || c https://github.com/tytso/e2fsprogs.git
[ -d musl-cross-make ] || c https://github.com/richfelker/musl-cross-make.git
