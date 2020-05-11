#!/bin/bash
clear
git clone https://github.com/friendlyarm/repo
sudo cp repo/repo /usr/bin/
rm -rf $RK3328_DIR
mkdir $RK3328_DIR && cd $RK3328_DIR
repo init -u https://github.com/fanck0605/friendlywrt_mainfests -b openwrt-lean -m rk3328.xml --repo-url=https://github.com/friendlyarm/repo --no-clone-bundle
repo sync -c --no-clone-bundle -j
exit 0
