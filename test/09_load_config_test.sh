#!/bin/bash
clear
cd friendlywrt-rk3328
#deconfig
#wget https://github.com/torvalds/linux/raw/master/scripts/kconfig/merge_config.sh && chmod +x merge_config.sh
#./merge_config.sh -m kernel/arch/arm64/configs/nanopi-r2_linux_defconfig ../seed/defconfig.override
#cat .config > kernel/arch/arm64/configs/nanopi-r2_linux_defconfig
#use fanck0605 defconfig
wget https://github.com/fanck0605/nanopi-r2s/raw/lean/nanopi-r2_linux_defconfig
cat ./nanopi-r2_linux_defconfig > ./kernel/arch/arm64/configs/nanopi-r2_linux_defconfig
#.config
rm -f friendlywrt/.config*
cat configs/config_rk3328 | grep "TARGET" >> ../seed/base_rk3328.seed
cat ../$CONFIG_FILE >> ../seed/base_rk3328.seed
cat ../seed/base_rk3328.seed > configs/config_rk3328
exit 0
