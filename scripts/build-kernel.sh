#!/bin/sh
set -ex

rm -rf bin/lib

OLDPWD="$PWD"

cd linux
nice -n 20 make -j $(nproc)
make INSTALL_MOD_PATH="$OLDPWD/bin" INSTALL_MOD_STRIP=1 modules_install
cp -v ./arch/x86/boot/bzImage "$OLDPWD"/bin/linux
ls -l "$OLDPWD"/bin/linux
