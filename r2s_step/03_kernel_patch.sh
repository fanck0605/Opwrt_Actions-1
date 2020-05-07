#!/bin/bash
cd friendlywrt-rk3328
git clone https://github.com/openwrt/openwrt && cd openwrt/
cp -a ./target/linux/generic/files/* ../kernel/
rm target/linux/octeontx/patches-5.4/0004-PCI-add-quirk-for-Gateworks-PLX-PEX860x-switch-with-.patch
./scripts/patch-kernel.sh ../kernel target/linux/generic/backport-5.4
./scripts/patch-kernel.sh ../kernel target/linux/generic/pending-5.4
./scripts/patch-kernel.sh ../kernel target/linux/generic/hack-5.4
./scripts/patch-kernel.sh ../kernel target/linux/octeontx/patches-5.4