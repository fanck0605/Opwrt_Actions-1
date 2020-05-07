#!/bin/bash
clear
rm -rf ./artifact/
mkdir -p ./artifact/
mv friendlywrt-rk3328/out/*img* ./artifact/
cd ./artifact/
gzip *.img
zip R2S-opt-$(date +%Y-%m-%d).zip *.img.gz
rm *.img.gz
echo "::set-env name=FIRMWARE::$PWD"
echo "::set-output name=status::success"
echo "::set-env name=DATE::$(date "+%Y-%m-%d %H:%M:%S")"
release_tag="NanoPi-R2S-${{ env.DATE }}-slim"
echo "##[set-output name=release_tag;]$release_tag"
cd ../friendlywrt-rk3328/friendlywrt
cp .config ../../artifact/config-slim-full
./scripts/diffconfig.sh > ../../artifact/config-slim.seed
exit 0
