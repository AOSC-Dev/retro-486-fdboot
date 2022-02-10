# Stages:
# 	* get sources
# 	* copy config
# 	* build kernel
# 	* build musl toolchain
# 	* build busybox
# 	* build busybox-mini
# 	* build e2fsprogs
# 	* clean-up
# 	* mkinitramfs
# 	* tarball decompress
# 	* mkiso
# 	* mkfd
#

.phony:	all

all:	.x-done

.x-done:
	touch .x-done
