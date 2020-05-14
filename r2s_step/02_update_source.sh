#!/bin/bash
export TERM=linux
cd friendlywrt-rk3328/friendlywrt/
git config --local user.email "action@github.com" && git config --local user.name "GitHub Action"
git remote add lean https://github.com/coolsnowwolf/lede.git
git fetch lean && git rebase lean/master
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
sed -i '$a\src-git helloworld https://github.com/fw876/helloworld' ./feeds.conf.default
sed -i 's/^src-git telephony/#src-git telephony/g' ./feeds.conf.default
exit 0
