#!/bin/bash
export TERM=linux
cd $RK3328_DIR/kernel
#内核变基到linux5.4.y
cd kernel
git config --local user.email "action@github.com" && git config --local user.name "GitHub Action"
git remote add upstream https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git && git fetch upstream
git rebase upstream/linux-5.4.y
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
cd ../
#patch openwrt 5.4 kernel
git clone  --depth 1 -b 18.06-kernel5.4 https://github.com/openwrt/openwrt && cd openwrt/
cp -a ./target/linux/generic/files/* ../kernel/
#rm target/linux/octeontx/patches-5.4/0004-PCI-add-quirk-for-Gateworks-PLX-PEX860x-switch-with-.patch
./scripts/patch-kernel.sh ../kernel target/linux/generic/backport-5.4
./scripts/patch-kernel.sh ../kernel target/linux/generic/pending-5.4
./scripts/patch-kernel.sh ../kernel target/linux/generic/hack-5.4
./scripts/patch-kernel.sh ../kernel target/linux/octeontx/patches-5.4
exit 0
