## 自动编译说明
1. 参考[Klever1988](https://github.com/klever1988/nanopi-openwrt)自动编译R2S固件
2. 参考[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)


## Openwrt x86精简版：
1. x86 64bit 精简版，默认管理地址:192.168.1.1 用户名:root 密码:password
2. 精简版比较适合vm下使用，仅支持常见软路由功能。
3. 与另一自动编译项目的精简版固件一致 :https://github.com/ardanzhu/lede-openwrt-ci


## NanoPi R2S说明

1. 精简版支持SSRP、diskman、samba4、frpc/frps、ttyd，去掉全部广告拦截及openvpn，详细见[r2s.config]( ./r2s.config)
<br> 在线更新:
```
wget -qO- https://raw.githubusercontent.com/ardanzhu/Opwrt_Actions/master/r2s/autoupdate-slim.sh | sh
```
2. 定制版在精简版基础上增加广告拦截、docker、openvpn、transmission、openvpn等，详细见:[r2s_opt.config]( ./r2s_opt.config)
<br> 在线更新:
```
wget -qO- https://raw.githubusercontent.com/ardanzhu/Opwrt_Actions/master/r2s/autoupdate-opt.sh | sh
```
3. 感谢gary lau的在线更新脚本


## 感谢
- [OpenWrt](https://github.com/openwrt/openwrt)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [Klever1988](https://github.com/klever1988/nanopi-openwrt)
- [Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)


## License
[MIT]


## 系统界面截图：
![diskman](pic/diskman.jpg)
![dockerman](pic/docker.jpg)
![transmission](pic/transmission.jpg)
![opentomcat](pic/opentomcat.png)
