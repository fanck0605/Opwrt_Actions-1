#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i '/uci commit luci/i\uci set luci.main.mediaurlbase="/luci-static/opentomcat"' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\chown -R root:root /usr/share/netdata/web' package/lean/default-settings/files/zzz-default-settings
#sed -i '/8.8.8.8/d' package/base-files/files/root/setup.sh
echo -e '\nQuintus Build\n'  >> package/base-files/files/etc/banner
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/lean/luci-theme-opentomcat
git clone https://github.com/kuoruan/luci-app-frpc package/lean/luci-app-frpc
git clone https://github.com/lwz322/luci-app-frps.git package/lean/luci-app-frps
