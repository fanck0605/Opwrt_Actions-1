#!/bin/bash
#调整friendlywrt的更新源，#fork 自 QiuSimons
export TERM=linux
latest_feed="$(curl -s https://github.com/openwrt/openwrt/releases |grep -Eo "v[0-9\.]+.tar.gz" |sed -n 1p |sed 's/v//g' |sed 's/.tar.gz//g')"
sed -i 's,19.07.1,'"${latest_feed}"',g' device/friendlyelec/rk3328/common-files/etc/opkg/distfeeds.conf
#取消重复的feeds update 
sed -i 's,./scripts,#./scripts,g' scripts/mk-friendlywrt.sh
#rebase to openwrt
cd $RK3328_DIR/friendlywrt/
git config --local user.email "action@github.com" && git config --local user.name "GitHub Action"
git remote add upstream https://github.com/openwrt/openwrt.git && git fetch upstream
git rebase upstream/openwrt-19.07
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
#delete some package
rm -f ./target/linux/rockchip-rk3328/patches-4.14/0001-net-thunderx-workaround-BGX-TX-Underflow-issue.patch
rm -f ./include/version.mk
rm -f ./include/kernel-version.mk
rm -f ./package/base-files/image-config.in
rm -f ./feeds.conf.default
rm -f ./package/base-files/files/etc/banner
rm -f ./package/base-files/files/bin/config_generate
wget https://raw.githubusercontent.com/openwrt/openwrt/openwrt-19.07/feeds.conf.default
#准备openwrt官方源码
mkdir opofficial
latest_release="$(curl -s https://github.com/openwrt/openwrt/releases |grep -Eo "v[0-9\.]+.tar.gz" |sed -n 1p)"
curl -LO "https://github.com/openwrt/openwrt/archive/${latest_release}"
tar zxvf ${latest_release}  --strip-components 1 -C ./opofficial
#恢复部分文件到release分支
cp -f ./opofficial/include/version.mk ./friendlywrt/include/version.mk
cp -f ./opofficial/include/kernel-version.mk ./friendlywrt/include/kernel-version.mk
cp -f ./opofficial/package/base-files/image-config.in ./friendlywrt/package/base-files/image-config.in
cp -f ./opofficial/package/base-files/files/etc/banner ./friendlywrt/package/base-files/files/etc/banner
cp -f ./opofficial/package/base-files/files/bin/config_generate ./friendlywrt/package/base-files/files/bin/config_generate
exit 0
