#!/bin/bash
#增加软件包
cd $RK3328_DIR/friendlywrt
#更新feed
./scripts/feeds update -a && ./scripts/feeds install -a
#arpbind
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-arpbind package/lean/luci-app-arpbind
#AutoCore
svn co https://github.com/project-openwrt/openwrt/branches/openwrt-19.07/package/lean/autocore package/lean/autocore
sed -i "s,@TARGET_x86 ,,g" package/lean/autocore/Makefile
rm -rf ./package/lean/autocore/files/cpuinfo
wget -P package/lean/autocore/files https://raw.githubusercontent.com/QiuSimons/Others/master/cpuinfo
rm -rf ./package/lean/autocore/files/rpcd_10_system.js
wget -P package/lean/autocore/files https://raw.githubusercontent.com/QiuSimons/Others/master/rpcd_10_system.js
svn co https://github.com/project-openwrt/openwrt/branches/openwrt-19.07/package/lean/coremark package/lean/coremark
sed -i 's,-DMULTIT,-Ofast -DMULTIT,g' package/lean/coremark/Makefile
#R2S刷机
svn co https://github.com/songchenwen/nanopi-r2s/trunk/luci-app-r2sflasher package/new/luci-app-r2sflasher
sed -i 's/"luci.fs"/"luci.sys".net/g' package/new/luci-app-r2sflasher/luasrc/model/cbi/r2sflasher/flash.lua
#irqbalance
sed -i 's/0/1/g' feeds/packages/utils/irqbalance/files/irqbalance.config
#定时重启
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-autoreboot package/lean/luci-app-autoreboot
#增加ssr-plus
#SSRP
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/lean/luci-app-ssr-plus
#SSRP依赖
rm -rf ./feeds/packages/net/kcptun
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/shadowsocksr-libev package/lean/shadowsocksr-libev
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/pdnsd-alt package/lean/pdnsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray package/lean/v2ray
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan package/lean/trojan
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipt2socks package/lean/ipt2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/kcptun package/lean/kcptun
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs package/lean/simple-obfs
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/v2ray-plugin package/lean/v2ray-plugin
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/srelay package/lean/srelay
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/lean/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks package/lean/dns2socks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/lean/redsocks2
svn co https://github.com/project-openwrt/openwrt/trunk/package/lean/tcpping package/lean/tcpping
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/proxychains-ng package/lean/proxychains-ng
#ramfree
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-ramfree package/lean/luci-app-ramfree
#流量监视
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-wrtbwmon package/lean/luci-app-wrtbwmon
#上网APP过滤
git clone -b master --single-branch https://github.com/destan19/OpenAppFilter package/new/OpenAppFilter
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/lean/luci-theme-opentomcat
git clone https://github.com/lwz322/luci-app-frps.git package/lean/luci-app-frps
git clone https://github.com/kuoruan/luci-app-frpc.git package/lean/luci-app-frpc
git clone https://github.com/lisaac/luci-app-diskman.git package/lean/luci-app-diskman
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/gost package/gost
#BBR_Patch
wget -P target/linux/generic/pending-4.14/ https://raw.githubusercontent.com/QiuSimons/Others/master/607-tcp_bbr-adapt-cwnd-based-on-ack-aggregation-estimation.patch
#FullCone补丁
git clone -b master --single-branch https://github.com/QiuSimons/openwrt-fullconenat package/fullconenat
# FireWall Patch
mkdir package/network/config/firewall/patches
wget -P package/network/config/firewall/patches/ https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/fullconenat.patch
# Patch LuCI
pushd feeds/luci
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/luci.patch | git apply
popd
# Patch Kernel
pushd target/linux/generic/hack-4.14
wget https://github.com/coolsnowwolf/lede/raw/master/target/linux/generic/hack-4.14/952-net-conntrack-events-support-multiple-registrant.patch
wget https://github.com/coolsnowwolf/lede/raw/master/target/linux/generic/hack-4.14/202-reduce_module_size.patch
popd
#最大连接
sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
#修正架构
sed -i "s,boardinfo.system,'ARMv8',g" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js

