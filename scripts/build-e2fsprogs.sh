#!/bin/sh
. scripts/common.sh

DESTDIR="$PWD/bin/utils-root"
cd contrib/e2fsprogs

CFLAGS="-Os -march=i486" LDFLAGS="-Os -static" ./configure --host=i486-linux-musl --without-pthread --prefix=/
make -j $(nproc)
make DESTDIR="$DESTDIR" install

cd "$DESTDIR"

rm -rf usr/lib/{systemd,udev} share include lib
