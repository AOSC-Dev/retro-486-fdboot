#!/usr/bin/env bash
. scripts/common.sh

mkdir -p tarball
cd tarball
rm -fv *.tar

BASEURL='rsync://releases.aosc.io/releases/os-i486/minimal/'
FILE="$(rsync --exclude=rawimg --no-motd "$BASEURL"  | grep -o 'aosc-os_minimal_[0-9]*_i486.tar.xz' | tail -n 1)"

rsync -vP "$BASEURL"/"$FILE" .

for i in *.xz ; do
	xz -dvv "$i"
done
