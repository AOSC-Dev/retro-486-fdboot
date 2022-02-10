#!/bin/sh
. scripts/common.sh

for i in busybox busybox-mini; do
	cp -v config/"$i".config "$i"/.config
	(
	cd "$i"
	make -j $(nproc) CC=i486-linux-musl-gcc
	)
done
