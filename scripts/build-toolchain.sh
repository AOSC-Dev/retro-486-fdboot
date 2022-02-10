#!/bin/sh
. scripts/common.sh

OUTPUT="$PWD/toolchain"
export TARGET="i486-linux-musl"

cd contrib/musl-cross-make
make -j $(nproc) OUTPUT="$OUTPUT"
make OUTPUT="$OUTPUT" install
