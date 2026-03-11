#!/bin/bash
#=================================================
# DIY Script Part 1 - Before feeds update
#=================================================

cd openwrt

echo "=============================================="
echo "DIY Part 1 - Adding third-party feeds"
echo "=============================================="

# Add kenzok8/small feed
cat >> feeds.conf.default << 'FEEDSEND'

# kenzok8/small
src-git small https://github.com/kenzok8/small.git;main
FEEDSEND

# Modify version
sed -i 's/DISTRIB_REVISION=.*/DISTRIB_REVISION="ImmortalWrt-$(date +%Y%m%d)"/g' package/base-files/files/etc/openwrt_release 2>/dev/null || true

# Modify hostname
sed -i 's/OpenWrt/ImmortalWrt/g' package/base-files/files/etc/config/system 2>/dev/null || true

# Modify timezone
sed -i 's/UTC/CST-8/g' package/base-files/files/etc/config/system 2>/dev/null || true

# Create NTP config
mkdir -p files/etc/config
cat > files/etc/config/timeserver << 'NTPEND'
config timeserver 'ntp'
    list server 'ntp.aliyun.com'
    list server 'ntp.tencent.com'
    list server 'ntp.ntsc.ac.cn'
    option enabled '1'
    option enable_server '0'
NTPEND

echo "=============================================="
echo "DIY Part 1 Completed"
echo "=============================================="
