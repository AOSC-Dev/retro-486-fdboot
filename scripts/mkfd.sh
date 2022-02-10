#!/usr/bin/env bash
. scripts/common.sh

[ -d "$OLDPWD" ] || mkdir -p "$OLDPWD/img"
IMG="$OLDPWD/img/fd.img"

rm -f "$IMG"

if [ $EUID != 0 ]; then
	echo 'This script needs root permission.'
	exit 1
fi

fallocate -l 1440K "$IMG"
chown -v "$SUDO_USER" "$IMG"
LOOP="$(losetup --show -f "$IMG")"

mkfs.vfat -vn AOSC_FDBOOT "$LOOP"

DIR="$(mktemp -d)"
mkdir "$DIR"/fd
mount "$LOOP" "$DIR"/fd
cp -v bin/{linux,initrd} "$DIR"/fd
cp -v config/lilo.conf "$DIR"
sed -i "s|%LOOP%|${LOOP}|g" "$DIR"/lilo.conf
sed -i "s|%MP%|${DIR}/fd|g" "$DIR"/lilo.conf
lilo -v 5 -C "$DIR"/lilo.conf

ls -lh "$DIR"/fd
df -h "$DIR"/fd

umount "$DIR"/fd
rm -rf "$DIR"
losetup -d "$LOOP"
