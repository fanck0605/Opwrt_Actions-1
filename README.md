# Actions-OpenWrt
OpenWrt源码来自Lean，每天自动编译最新源码。
自动编译参考[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)

## 下载地址：
https://github.com/ardanzhu/Opwrt_Actions/releases

## 说明
默认管理ip：192.168.1.1 Username:root password:password

X86只编译适配ESXi vm的64bit版本，并无去广告及解锁音乐等应用，仅支持IPv4，不支持IPv6及USB、wifi等设备。
支持的luci app只包括ssrp、ttyd、zerotier、ddns(支持cloudflare)

NanoPi R2S版本参考Klever1988的版本精简定制编译，支持在线更新（感谢gary lau的更新脚本）

R2S slim版支持USB及ipv6，luci app仅包括ssrp、cifs-mount等与x64精简版一致，在线更新:
```
wget -qO- https://raw.githubusercontent.com/ardanzhu/Opwrt_Actions/master/r2s_slim_autoupdate.sh | sh
```
R2S opt版增加openvpn、transmission，在线更新:
```
wget -qO- https://raw.githubusercontent.com/ardanzhu/Opwrt_Actions/master/r2s_opt_autoupdate.sh | sh
```

## 感谢
- [OpenWrt](https://github.com/openwrt/openwrt)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [Klever1988](https://github.com/klever1988/nanopi-openwrt)
- [Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

## License

[MIT]
