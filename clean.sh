#!/bin/sh
set -x

for i in contrib/* busybox busybox-mini linux ; do
	(
	cd "$i"
	git clean -fxd
	)
done

rm -rf work bin
