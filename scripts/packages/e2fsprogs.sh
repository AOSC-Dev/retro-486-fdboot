#!/usr/bin/env bash
. scripts/common.sh

DESTDIR="$PWD/bin/utils-root"
cd contrib
[ -d e2fsprogs ] || c https://github.com/tytso/e2fsprogs.git
cd e2fsprogs

CFLAGS="-Os -march=i486" LDFLAGS="-Os -static" ./configure --host=i486-linux-musl --without-pthread --prefix=/
make -j "$(nproc)"
make DESTDIR="$DESTDIR" install

cd "$DESTDIR"

rm -rf usr/lib/{systemd,udev} share include lib
