#!/bin/bash
#进入friendlywrt目录
cd $RK3328_DIR/friendlywrt/
#增加防掉线脚本
mv ../../script/check_inet.sh package/base-files/files/usr/bin/ && chmod +x package/base-files/files/usr/bin/check_inet.sh
mv ../../script/check package/base-files/files/etc/init.d/ && chmod +x package/base-files/files/etc/init.d/check
#刷机脚本
mv ../../script/update.sh package/base-files/files/root/update.sh && chmod +x package/base-files/files/root/update.sh
#關閉wan外部傳入及轉發
sed -i '/firewall/d' ../device/friendlyelec/rk3328/default-settings/install.sh

#修改版本号
#sed -i 's/OpenWrt/Quintus Build @ $(date "+%Y.%m.%d")/g' package/lean/default-settings/files/zzz-default-settings
#echo -e '\nQuintus Build\n'  >> package/base-files/files/etc/banner
#生成时间
echo "::set-env name=DATE::$(date "+%Y-%m-%d %H:%M:%S")"
#只允許ssh在lan內部連接
#sed -i '/uci commit luci/a\uci commit dropbear' package/lean/default-settings/files/zzz-default-settings
#sed -i '/uci commit luci/a\uci set dropbear.@dropbear[0].Interface='lan'' package/lean/default-settings/files/zzz-default-settings
#关闭ipv6
#sed -i '/uci commit/i\uci delete network.lan.ip6assign' package/base-files/files/root/setup.sh
#sed -i '/uci commit/i\uci delete network.wan6' package/base-files/files/root/setup.sh
#sed -i '/uci commit/i\uci delete dhcp.lan.ra' package/base-files/files/root/setup.sh
#sed -i '/uci commit/i\uci delete dhcp.lan.dhcpv6' package/base-files/files/root/setup.sh
#sed -i '/uci commit/i\uci delete dhcp.lan.ndp' package/base-files/files/root/setup.sh
#默认dnsmasq-full
#sed -i 's/dnsmasq /dnsmasq-full default-settings luci /' include/target.mk
ln -s /usr/bin/upx-ucl staging_dir/host/bin/upx
