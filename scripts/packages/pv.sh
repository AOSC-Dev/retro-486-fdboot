#!/usr/bin/env bash
. scripts/common.sh

DESTDIR="$PWD/bin/utils-root"
cd contrib/pv

./generate.sh
CFLAGS="-O3 -flto -march=i486" LDFLAGS="-flto -Os -static" ./configure --host=i486-linux-musl --disable-nls --disable-ipc --prefix=/
make -j "$(nproc)" LD=i486-linux-musl-ld
cp -v pv "$DESTDIR"/bin
