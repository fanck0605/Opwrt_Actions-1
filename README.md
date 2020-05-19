### NanoPi R2S说明

####使用Friendlywrt源码更新到最新kernel，集成Lean功能插件，自用固件，内置挖矿 :)。<br> 
按应用筛选分成3版本，均不包含任何广告拦截应用。
1. 极简的tiny版，仅包含ssr-plus、ddns(不支持任何USB无线网卡，支持U盘)
2. 瘦身的slim版，包括有ssr-plus、frpc/frps、ttyd、zerotier（支持部分USB无线网卡，只测试过811AC）
3. 定制opt版在精简版基础上增加docker、transmission、等较常用功能等。（支持部分USB无线网卡，只测试过811AC）
4. 默认管理地址:192.168.2.1  用户名:root  密码:password
5. 下载见[R2S发布](https://github.com/ardanzhu/Opwrt_Actions/releases/tag/R2S)

#### R2S刷机方法
7. 感谢gary lau的在线更新脚本，可选择保存配置升级，或下载固件后通过web管理页的“文件传输”上传到更新，支持多种R2S编译版本互刷，通过web管理页面的TTYD或SSH到R2S后执行下载脚本并执行：<br> 
```
wget -q https://github.com/ardanzhu/Opwrt_Actions/raw/master/script/update.sh -O update.sh && sh ./update.sh
```

8. 4.18之后固件已预装[songchenwen](https://github.com/songchenwen/nanopi-r2s)大佬的R2S刷机，可在web页面直接升级，与通常的OpenWrt刷机方法无异 <br> 
[R2S刷机IPK链接](https://github.com/ardanzhu/Opwrt_Actions/raw/master/other/luci-app-r2sflasher_1.0-4_all.ipk) 


### 感谢
- [Lean](https://github.com/coolsnowwolf/lede)
- [Klever1988](https://github.com/klever1988/nanopi-openwrt)
- [fanck0605](https://github.com/fanck0605/nanopi-r2s)
- [QiuSimons](https://github.com/QiuSimons/R2S_OP_SSRP)
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
