#!/usr/bin/env sh

qemu-img create /tmp/test.img 128G
qemu-system-x86_64 \
	--cdrom "$(realpath archlinux-x86_64.iso)" \
	--hda /tmp/test.img \
	-m 4096 \
	-smp sockets=1,cores=4 \
	-accel kvm \
	-bios /usr/share/ovmf/x64/OVMF.fd \
