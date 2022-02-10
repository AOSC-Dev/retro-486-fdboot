#!/bin/sh
. scripts/common.sh

OUTPUT="$PWD/toolchain"
export TARGET="i486-linux-musl"

if [ -d "$OUTPUT" ]; then
	"$OUTPUT"/bin/i486-linux-musl-gcc -v && \
	       	echo 'Toolchain already built, skipping......' && \
		exit 0
fi

cd contrib/musl-cross-make
make -j "$(nproc)" OUTPUT="$OUTPUT"
make OUTPUT="$OUTPUT" install
