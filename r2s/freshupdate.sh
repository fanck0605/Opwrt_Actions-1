#!/bin/sh
cd /tmp/upload/
unzip /tmp/upload/R2S*.zip
if [ -f /tmp/upload/Friendly*.img.gz ]; then
    echo -e '\e[92m开始刷机，请稍候……\e[0m'	
    pv /tmp/upload/*.img.gz | gunzip -dc > /dev/mmcblk0
    echo 1 > /proc/sys/kernel/sysrq
    echo -e '\e[92m刷机完毕，正在重启...稍等片刻后重新登录\e[0m'	
    echo b > /proc/sysrq-trigger
else
    mv */*.img.gz ./
    echo -e '\e[92m开始刷机，请稍候……\e[0m'	
    pv /tmp/upload/*.img.gz | gunzip -dc > /dev/mmcblk0
    echo 1 > /proc/sys/kernel/sysrq
    echo -e '\e[92m刷机完毕，正在重启...稍等片刻后重新登录\e[0m'	
    echo b > /proc/sysrq-trigger     	
fi
