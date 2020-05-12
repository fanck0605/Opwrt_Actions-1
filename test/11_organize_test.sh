#!/bin/sh
export TERM=linux
rm -rf ./artifact/
mkdir -p ./artifact/
mv $RK3328_DIR/out/*img* ./artifact/
cd ./artifact/
gzip *.img
zip R2S-origin-$(date +%Y-%m-%d).zip *.img.gz
rm *.img.gz
echo "::set-env name=FIRMWARE::$PWD"
echo "::set-output name=status::success"
echo "::set-env name=DATE::$(date "+%Y-%m-%d %H:%M:%S")"
release_tag="NanoPi-R2S-${{ env.DATE }}-origin"
echo "##[set-output name=release_tag;]$release_tag"
cd ../$RK3328_DIR/friendlywrt
cp .config ../../artifact/config-origin-full
./scripts/diffconfig.sh > ../../artifact/config-origin.seed
exit 0
