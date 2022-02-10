#!/bin/sh
. scripts/common.sh

cp -v busybox/.config config/busybox.config
cp -v busybox-mini/.config config/busybox-mini.config
cp -v linux/.config config/linux.config
