#!/usr/bin/env bash
. scripts/common.sh

mkdir -p tarball
cd tarball

BASEURL='https://releases.aosc.io/os-i486/minimal/'
eval `curl "$BASEURL" | grep 'href.*i486.tar.xz<' | cut -d '>' -f 1 | cut -d ' ' -f 2`

curl -OJ "$BASEURL"/"$href"

for i in *.xz ; do
	xz -dvv "$i"
done
