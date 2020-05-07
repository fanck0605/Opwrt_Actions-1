#!/bin/bash
clear
cd friendlywrt-rk3328/kernel/
git apply ../../patches/000-kernel-add-full_cone_nat.patch
wget https://github.com/armbian/build/raw/master/patch/kernel/rockchip64-dev/RK3328-enable-1512mhz-opp.patch
git apply RK3328-enable-1512mhz-opp.patch
exit 0
