#!/bin/bash
#修改版本号
sed -i 's/OpenWrt/Quintus Build @ $(date "+%Y.%m.%d")/g' package/lean/default-settings/files/zzz-default-settings
echo -e '\nQuintus Build\n'  >> package/base-files/files/etc/banner
#更新替换软件包    
rm -rf package/lean/luci-theme-opentomcat
rm -rf package/lean/luci-app-frpc
rm -rf package/lean/luci-app-frps
rm -rf package/lean/luci-app-dockerman
#rm -rf package/lean/luci-app-zerotier
#git clone https://github.com/rufengsuixing/luci-app-zerotier.git package/lean/luci-app-zerotier
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/lean/luci-theme-opentomcat
git clone https://github.com/lwz322/luci-app-frps.git package/lean/luci-app-frps
git clone https://github.com/kuoruan/luci-app-frpc.git package/lean/luci-app-frpc
git clone https://github.com/lisaac/luci-app-dockerman.git package/lean/luci-app-dockerman

#更改默認主題
sed -i '/uci commit luci/i\uci set luci.main.mediaurlbase="/luci-static/opentomcat"' package/lean/default-settings/files/zzz-default-settings
#關閉wan外部傳入及轉發
#
sed -i '/firewall/d' ../device/friendlyelec/rk3328/default-settings/install.sh
#sed -i '/uci commit luci/a\uci commit firewall' package/lean/default-settings/files/zzz-default-settings
#sed -i '/uci commit luci/a\uci set firewall.@zone[1].forward=REJECT' package/lean/default-settings/files/zzz-default-settings
#sed -i '/uci commit luci/a\uci set firewall.@zone[1].input=REJECT' package/lean/default-settings/files/zzz-default-settings
#default enable fullcone nat at firewall setting
sed -i '/uci commit luci/a\uci set firewall.@defaults[0].fullcone=1' package/lean/default-settings/files/zzz-default-settings


#只允許ssh在lan內部連接
sed -i '/uci commit luci/a\uci commit dropbear' package/lean/default-settings/files/zzz-default-settings
sed -i '/uci commit luci/a\uci set dropbear.@dropbear[0].Interface='lan'' package/lean/default-settings/files/zzz-default-settings

#关闭ipv6
sed -i '/uci commit luci/a\uci commit network' package/lean/default-settings/files/zzz-default-settings
sed -i '/uci commit luci/a\uci delete network.lan.ip6assign' package/lean/default-settings/files/zzz-default-settings
sed -i '/uci commit luci/a\uci delete network.wan6' package/lean/default-settings/files/zzz-default-settings
sed -i '/uci commit luci/a\uci commit dhcp' package/lean/default-settings/files/zzz-default-settings
sed -i '/uci commit luci/a\uci delete dhcp.lan.ra' package/lean/default-settings/files/zzz-default-settings
sed -i '/uci commit luci/a\uci delete dhcp.lan.dhcpv6' package/lean/default-settings/files/zzz-default-settings
sed -i '/uci commit luci/a\uci delete dhcp.lan.ndp' package/lean/default-settings/files/zzz-default-settings

#其它
#sed -i '/exit/i\chown -R root:root /usr/share/netdata/web' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\find /etc/rc.d/ -name *docker* -delete' package/lean/default-settings/files/zzz-default-settings
sed -i '/8.8.8.8/d' package/base-files/files/root/setup.sh
#sed -i 's/option fullcone\t1/option fullcone\t0/' package/network/config/firewall/files/firewall.config
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
