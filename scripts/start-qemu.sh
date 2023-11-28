#!/usr/bin/env sh

qemu-img create /tmp/test.img 128G
qemu-system-x86_64 --cdrom "$(realpath archlinux-2023.11.01-x86_64.iso)" --hda /tmp/test.img -m 4096
