#!/bin/sh
. scripts/common.sh

mkdir -p bin

for i in busybox busybox-mini; do
	cp -v config/"$i".config "$i"/.config
	(
	cd "$i"
	make -j "$(nproc)" CC=i486-linux-musl-gcc oldconfig
	make -j "$(nproc)" CC=i486-linux-musl-gcc
	cp busybox "$OLDPWD"/bin/"$i"
	)
done
