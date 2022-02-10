#!/usr/bin/env bash
. scripts/common.sh

mkdir -p bin
cp -v busybox/busybox bin/busybox
cp -v busybox-mini/busybox bin/busybox-mini
