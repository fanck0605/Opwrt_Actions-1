#!/bin/sh
unzip /tmp/upload/R2S*.zip
pv /tmp/upload/*.img.gz | gunzip -dc > /dev/mmcblk0
echo 1 > /proc/sys/kernel/sysrq
echo b > /proc/sysrq-trigger
