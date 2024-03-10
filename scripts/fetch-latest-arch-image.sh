#!/usr/bin/env sh
set -x
set -e

wget --continue --tries=0 --timeout 10 mirroronet.pl/pub/mirrors/archlinux/iso/latest/archlinux-x86_64.iso
wget --continue --tries=0 --timeout 10 mirroronet.pl/pub/mirrors/archlinux/iso/latest/sha256sums.txt
sha256sum --ignore-missing --check ./sha256sums.txt
rm sha256sums.txt
