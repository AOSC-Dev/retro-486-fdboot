#!/usr/bin/env bash
. scripts/common.sh

for i in scripts/packages/* ; do
	"$i"
done
