#!/bin/bash
clear
cd friendlywrt-rk3328/friendlywrt/
git config --local user.email "action@github.com" && git config --local user.name "GitHub Action"
git remote add upstream https://github.com/Lienol/openwrt && git fetch upstream
git checkout upstream/dev-19.07 -b tmp
git mv README.md README && git commit -m 'undo rename readme for rebasing'
git checkout origin/master-v19.07.1
git rebase adc1a9a3676b8d7be1b48b5aed185a94d8e42728^ --onto tmp -X theirs
rm target/linux/rockchip-rk3328/patches-4.14/0001-net-thunderx-workaround-BGX-TX-Underflow-issue.patch
sed -i '/ipv6/,+3d' package/base-files/files/root/setup.sh
git checkout upstream/dev-19.07 -- feeds.conf.default
sed -i 's/Lienol\/openwrt-package/SuLingGG\/openwrt-package/' feeds.conf.default
sed -i 's/^src-git telephony/#src-git telephony/g' ./feeds.conf.default
exit 0
