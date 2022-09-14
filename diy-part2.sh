#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Docker v20.10.17
# rm -rf feeds/packages/utils/dockerd
# rm -rf feeds/packages/utils/containerd
# rm -rf feeds/packages/utils/runc
# rm -rf feeds/packages/utils/libnetwork
# rm -rf feeds/packages/utils/tini
# svn export https://github.com/coolsnowwolf/packages/trunk/utils/docker feeds/packages/utils/docker
# svn export https://github.com/coolsnowwolf/packages/trunk/utils/dockerd feeds/packages/utils/dockerd
# svn export https://github.com/coolsnowwolf/packages/trunk/utils/containerd feeds/packages/utils/containerd
# svn export https://github.com/coolsnowwolf/packages/trunk/utils/runc feeds/packages/utils/runc
# svn export https://github.com/coolsnowwolf/packages/trunk/utils/libnetwork feeds/packages/utils/libnetwork
# svn export https://github.com/coolsnowwolf/packages/trunk/utils/tini feeds/packages/utils/tini

##
svn export https://github.com/coolsnowwolf/luci/trunk/libs/luci-lib-fs ./package/add/luci-lib-fs
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-filetransfer ./package/add/luci-app-filetransfer
sed -i "s/\.\.\/\.\./\$\(TOPDIR\)\/feeds\/luci/g" ./package/add/luci-app-filetransfer/Makefile
cp -af ./package/add/luci-app-filetransfer/po/zh-cn  ./package/add/luci-app-filetransfer/po/zh_Hans

rm -rf package/feeds/xiangfeidexiaohuo/luci-app-turboacc

##补充汉化       
#cp -r -f ./feeds/xiangfeidexiaohuo/files/udpxy.lua #./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi

##fixed mosdns
rm -rf ./feeds/packages/net/mosdns
cp -r -f ./feeds/xiangfeidexiaohuo/op-mosdns ./feeds/packages/net/mosdns


# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt.orig@autocc-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' autocc'/g" package/base-files/files/etc/openwrt_release

#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.19/g' target/linux/x86/Makefile

# welcome test
