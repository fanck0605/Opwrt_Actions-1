#!/bin/bash
export TERM=linux
cd $RK3328_DIR/friendlywrt
git config --local user.email "action@123.com" && git config --local user.name "GitHub 123"
git remote add upstream https://github.com/iyuangang/openwrt.git && git fetch upstream
git rebase adc1a9a3676b8d7be1b48b5aed185a94d8e42728^ --onto upstream/master -X theirs
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
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
git rebase --skip
git checkout upstream/master -- feeds.conf.default
exit 0
