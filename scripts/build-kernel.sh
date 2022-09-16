#!/bin/sh
. scripts/common.sh
rm -rf bin/lib

cp -v config/linux.config linux/.config
cd linux
nice -n 20 make -j "$(nproc)" oldconfig
nice -n 20 make -j "$(nproc)"
make INSTALL_MOD_PATH="$OLDPWD/bin" INSTALL_MOD_STRIP=1 modules_install
cp -v ./arch/x86/boot/bzImage "$OLDPWD"/bin/linux
ls -l "$OLDPWD"/bin/linux
