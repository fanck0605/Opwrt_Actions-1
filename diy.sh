#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
rm -rf package/lean/luci-theme-opentomcat
rm -rf package/lean/luci-app-frps
rm -rf package/lean/luci-app-frpc
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/lean/luci-theme-opentomcat
git clone https://github.com/kuoruan/luci-app-frpc.git package/lean/luci-app-frpc
git clone https://github.com/lwz322/luci-app-frps.git package/lean/luci-app-frps
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i '/uci commit luci/i\uci set luci.main.mediaurlbase="/luci-static/opentomcat"' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\chown -R root:root /usr/share/netdata/web' package/lean/default-settings/files/zzz-default-settings
#sed -i '/8.8.8.8/d' package/base-files/files/root/setup.sh
echo -e "DISTRIB_REVISION='R20.3.19 Build by Quintus'" >> package/base-files/files/etc/openwrt_release
echo -e '\nQuintus Build\n'  >> package/base-files/files/etc/banner
