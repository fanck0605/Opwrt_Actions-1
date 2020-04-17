### Openwrt x86精简版：
1. 参考[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)的自动编译，使用 [Lean](https://github.com/coolsnowwolf/lede) 最新源码
2. x86 64bit 精简版，默认管理地址:192.168.1.1 用户名:root 密码:password
2. 精简版比较适合vm下使用，仅支持常见软路由功能。
3. 与另一自动编译项目的精简版固件一致 :https://github.com/ardanzhu/lede-openwrt-ci
4. 下载见[OpenWrt x86](https://github.com/ardanzhu/Opwrt_Actions/releases/tag/x64-slim)

### NanoPi R2S说明
1. 跟进[Klever1988](https://github.com/klever1988/nanopi-openwrt)及[soffchen
](https://github.com/soffchen/NanoPi-R2S)的方式编译R2S固件，按个人使用重新筛选应用分成两版本，Web管理主题改成清爽的opentomcat
2. 默认管理地址:192.168.2.1  用户名:root  密码:password
3. 下载见[R2S定制](https://github.com/ardanzhu/Opwrt_Actions/releases/tag/R2S)
4. 精简版支持SSRP、Passwall、diskman、samba4、frpc/frps、ttyd，去掉全部广告拦截及openvpn，详细见[r2s.config]( ./r2s.config)
5. 定制版在精简版基础上增加广告拦截、docker、openvpn、transmission、wireguard等，详细见:[r2s_opt.config]( ./r2s_opt.config)
#### R2S刷机方法
1. 感谢gary lau的在线更新脚本，可选择保存配置升级，或下载固件后通过web管理页的“文件传输”上传到更新，支持多种R2S编译版本互刷，通过web管理页面的TTYD或SSH到R2S后执行下载脚本并执行：<br> 
```
wget -q https://github.com/ardanzhu/Opwrt_Actions/raw/master/r2s/update.sh && sh ./update.sh
```

8. 安装[songchenwen](https://github.com/songchenwen/nanopi-r2s)大佬的R2S刷机ipk后，在web页面直接升级，与通常的OpenWrt刷机方法无异 <br> 
点击[R2S刷机IPK](https://github.com/ardanzhu/Opwrt_Actions/raw/master/r2s/luci-app-r2sflasher_1.0-4_all.ipk) 

### 感谢
- [Lean](https://github.com/coolsnowwolf/lede)
- [Klever1988](https://github.com/klever1988/nanopi-openwrt)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

#### License
[MIT]


#### 系统界面部分截图：
![freshupdate](pic/update.jpg)
![r2sflasher](pic/R2Sflasher.jpg)
![diskman](pic/diskman.jpg)
![dockerman](pic/docker.jpg)
![transmission](pic/transmission.jpg)
![opentomcat](pic/opentomcat.png)
