# Actions-OpenWrt
OpenWrt源码来自Lean，每天自动编译最新源码。
自动编译参考[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)

## 固件下载地址：
https://github.com/ardanzhu/Opwrt_Actions/releases

## 说明
X86只编译适配ESXi vm的64bit版本，并无去广告及解锁音乐等应用，仅支持ssrp及IPv4，不支持IPv6及USB、wifi等设备。


NanoPi R2S版本参考Klever1988的版本精简定制编译，支持在线更新（感谢gary lau的更新脚本）
slim版包含功能X86 64bit一致。

slim版在线更新：
```
wget -qO- https://raw.githubusercontent.com/ardanzhu/Opwrt_Actions/master/r2s_slim_autoupdate.sh | sh
```
## 感谢
- [OpenWrt](https://github.com/openwrt/openwrt)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [Klever1988](https://github.com/klever1988/nanopi-openwrt)
- [Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

## License

[MIT]
