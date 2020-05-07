#!/bin/bash
git clone https://github.com/friendlyarm/repo
sudo cp repo/repo /usr/bin/
rm -rf friendlywrt-rk3328
mkdir friendlywrt-rk3328 && cd friendlywrt-rk3328
repo init -u https://github.com/friendlyarm/friendlywrt_manifests -b master-v19.07.1 -m rk3328.xml --repo-url=https://github.com/friendlyarm/repo --no-clone-bundle
repo sync -c --no-tags --no-clone-bundle -j8