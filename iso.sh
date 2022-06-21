#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/dinoloader.kernel isodir/boot/dinoloader.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "dinoloader" {
	multiboot /boot/dinoloader.kernel
}
EOF
grub-mkrescue -o dinoloader.iso isodir
