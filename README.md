### NanoPi R2S说明

####使用Friendlywrt内核，集成Lean功能插件
1. 集众大佬的建议改进编译方式，defconfig按自己的理解取舍，欢迎测试。
按个人使用重新筛选应用分成2版本，Web管理主题使用清爽的opentomcat。
2. 默认管理地址:192.168.2.1  用户名:root  密码:password
3. 下载见[R2S定制](https://github.com/ardanzhu/Opwrt_Actions/releases/tag/R2S)
4. 精简版比较瘦身，仅支持是一些本人必用的SSRP、frpc/frps、ttyd、zerotier，其它广告拦截等通通去掉，详细见[r2s_slim.config]( ./r2s_slim.config)
5. 定制版在精简版基础上增加docker、transmission等，详细见:[r2s_opt.config]( ./r2s_opt.config)

####新增Openwrt original实验版本
6. 实验版本，每日使用openwrt原版最新内核编译，defconfig及功能配置与精简版一致，详细见:[r2s_test.config]( ./r2s_test.config)

#### R2S刷机方法
7. 感谢gary lau的在线更新脚本，可选择保存配置升级，或下载固件后通过web管理页的“文件传输”上传到更新，支持多种R2S编译版本互刷，通过web管理页面的TTYD或SSH到R2S后执行下载脚本并执行：<br> 
```
wget -q https://github.com/ardanzhu/Opwrt_Actions/raw/master/r2s/update.sh && sh ./update.sh
```

8. 4.18之后固件已预装[songchenwen](https://github.com/songchenwen/nanopi-r2s)大佬的R2S刷机，可在web页面直接升级，与通常的OpenWrt刷机方法无异 <br> 
[R2S刷机IPK链接](https://github.com/ardanzhu/Opwrt_Actions/raw/master/r2s/luci-app-r2sflasher_1.0-4_all.ipk) 


### Openwrt x86精简版：
1. 参考[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)的自动编译，使用 [Lean](https://github.com/coolsnowwolf/lede) 最新源码
2. x86 64bit 精简版，默认管理地址:192.168.1.1 用户名:root 密码:password
2. 精简版比较适合vm下使用，仅支持常见软路由功能。
3. 与另一自动编译项目的精简版固件一致，只是自动编译方式不同 :https://github.com/ardanzhu/lede-openwrt-ci
4. 下载见[OpenWrt x86](https://github.com/ardanzhu/Opwrt_Actions/releases/tag/x64-slim)


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
