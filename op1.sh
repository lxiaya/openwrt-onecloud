#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-op1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git passwall_packages https://github.com/lxiaya/openwrt-passwall-packages;main' >>feeds.conf.default
echo 'src-git homeproxy https://github.com/lxiaya/openwrt-homeproxy.git' >>feeds.conf.default
#echo 'src-git openclash https://github.com/vernesong/OpenClash' >>feeds.conf.default
#echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2;main' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main' >>feeds.conf.default
#echo 'src-git clash https://github.com/lxiaya/onecloud-package' >>feeds.conf.default
#echo 'src-git dns https://github.com/sbwml/luci-app-mosdns' >>feeds.conf.default
#echo 'src-git helloworld https://github.com/lxiaya/helloworld' >>feeds.conf.default
# Add a onecloud meson
merge_package(){
    git clone --depth=1 --single-branch $1
    [ -d $3 ] || mkdir -p $3
    cp -a $2/. $3/
    rm -rf $repo
}
merge_package "https://github.com/lxiaya/openwrt-onecloud" "openwrt-onecloud/target/linux/meson" "target/linux/meson"
sudo rm -rf openwrt-onecloud
