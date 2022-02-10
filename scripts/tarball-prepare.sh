#!/bin/sh
. scripts/common.sh

for i in tarball/*.xz ; do
	xz -dvv "$i"
done
