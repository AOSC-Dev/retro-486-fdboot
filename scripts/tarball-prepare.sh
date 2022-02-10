#!/bin/sh
. scripts/common.sh

for i in tarball/* ; do
	xz -dvv "$i"
done
