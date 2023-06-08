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

svn export https://github.com/coolsnowwolf/luci/trunk/libs/luci-lib-fs ./package/add/luci-lib-fs
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-filetransfer ./package/add/luci-app-filetransfer
sed -i "s/\.\.\/\.\./\$\(TOPDIR\)\/feeds\/luci/g" ./package/add/luci-app-filetransfer/Makefile
cp -af ./package/add/luci-app-filetransfer/po/zh-cn  ./package/add/luci-app-filetransfer/po/zh_Hans

##补充汉化       
#cp -r -f ./feeds/xiangfeidexiaohuo/files/udpxy.lua #./feeds/luci/applications/luci-app-udpxy/luasrc/model/cbi

##fixed mosdns
#rm -rf ./feeds/packages/net/mosdns
#cp -r -f ./feeds/xiangfeidexiaohuo/op-mosdns ./feeds/packages/net/mosdns


# Modify default IP
sed -i 's/192.168.1.1/192.168.11.1/g' package/base-files/files/bin/config_generate

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt.orig@autocc-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' autocc'/g" package/base-files/files/etc/openwrt_release

sed -i "s/# CONFIG_PACKAGE_luci-i18n-quickstart-zh-cn is not set/CONFIG_PACKAGE_luci-i18n-quickstart-zh-cn=y/g" .config
sed -i "s/# CONFIG_PACKAGE_luci-i18n-filetransfer-zh-cn is not set/CONFIG_PACKAGE_luci-i18n-filetransfer-zh-cn=y/g" .config

# welcome test
