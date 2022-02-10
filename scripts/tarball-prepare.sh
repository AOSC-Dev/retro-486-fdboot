#!/usr/bin/env bash
. scripts/common.sh

mkdir -p tarball
cd tarball
rm -fv *.tar

BASEURL='https://releases.aosc.io/os-i486/minimal/'
FILE="$(curl "$BASEURL"  | grep -o 'aosc-os_minimal_[0-9]*_i486.tar.xz' | tail -n 1)"

curl -OJ "$BASEURL"/"$FILE"

for i in *.xz ; do
	xz -dvv "$i"
done
