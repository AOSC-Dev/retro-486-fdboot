#!/usr/bin/env bash

declare -i COUNT=0

for i in mkfs.vfat xz rsync mkisofs lilo
do
	if ! which "$i" > /dev/null; then
		echo "Command ${i} not found!"
		(( COUNT++ ))
	fi
done

if [ "$COUNT" -gt 0 ]; then
	exit 1
else
	exit 0
fi
