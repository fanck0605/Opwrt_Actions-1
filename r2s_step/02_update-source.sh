#!/bin/bash
clear
cd friendlywrt-rk3328/friendlywrt/
git config --local user.email "action@github.com" && git config --local user.name "GitHub Action"
git remote add lean https://github.com/coolsnowwolf/lede.git
git fetch lean && git rebase lean/master
sed -i '$a\src-git helloworld https://github.com/fw876/helloworld' ./feeds.conf.default
sed -i 's/^src-git telephony/#src-git telephony/g' ./feeds.conf.default
cd ../kernel
git remote add linux https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
git fetch linux && git rebase linux/linux-5.4.y
exit 0
