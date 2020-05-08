#!/bin/bash
clear
cd friendlywrt-rk3328/friendlywrt/
#BBR_Patch
cp ../../patches/607-tcp_bbr-adapt-cwnd-based-on-ack-aggregation-estimation.patch target/linux/generic/pending-4.14/

# FullCone 
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
exit 0
