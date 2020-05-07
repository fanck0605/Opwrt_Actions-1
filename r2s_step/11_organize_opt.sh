#!/bin/bash
rm -rf ./artifact/
mkdir -p ./artifact/
mv friendlywrt-rk3328/out/*img* ./artifact/
cd ./artifact/
gzip *.img
zip R2S-opt-$(date +%Y-%m-%d).zip *.img.gz
rm *.img.gz
echo "::set-env name=FIRMWARE::$PWD"
echo "::set-output name=status::success"
release_tag="NanoPi-R2S-${{ env.DATE }}-opt"
echo "##[set-output name=release_tag;]$release_tag"
cd ../friendlywrt-rk3328/friendlywrt
cp .config ../../artifact/config-opt-full
./scripts/diffconfig.sh > ../../artifact/config-opt.seed
