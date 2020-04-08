# Actions-OpenWrt
OpenWrt源码来自Lean，自动编译参考[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)

## 固件下载地址：
https://github.com/ardanzhu/Opwrt_Actions/releases

## 说明
X86编译适配ESXi vm的64bit版本，支持ssrp及ipv4，不支持IPv6及USB、wifi等设备。

NanoPi R2S版本参考Klever1988的版本精简定制编译，支持在线更新（感谢gary lau的更新脚本）
Slim版在线更新：
```
wget -qO- https://raw.githubusercontent.com/ardanzhu/Opwrt_Actions/master/r2s_slim_autoupdate.sh | sh
```
## Acknowledgments
- [Microsoft](https://www.microsoft.com)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub](https://github.com)
- [GitHub Actions](https://github.com/features/actions)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cisco](https://www.cisco.com/)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [Cowtransfer](https://cowtransfer.com)
- [Mikubill/cowtransfer-uploader](https://github.com/Mikubill/cowtransfer-uploader)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [Klever1988](https://github.com/klever1988/nanopi-openwrt)
- [Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

## License

[MIT]
