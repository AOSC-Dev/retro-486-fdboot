#!/usr/bin/env bash
set -ex

rsync --del -avr cd work
cp -v bin/busybox work/cd
rsync -avr --del linux/tar-install/lib/modules work/cd/lib
(
	cd work/cd
	bsdtar -xpvvf skel.tar.gz
	rm -v skel.tar.gz
)

[ ! -d img ] && mkdir img

mkisofs -R -r -V AOSC_INSTCD -o img/aosc.iso work/cd
