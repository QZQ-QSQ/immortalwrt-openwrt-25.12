#!/bin/bash
#=================================================
# DIY Script Part 1
#=================================================

cd openwrt

echo "=============================================="
echo "DIY Part 1 - Adding third-party feeds"
echo "=============================================="

# Add kenzok8/small feed
echo "" >> feeds.conf.default
echo "src-git small https://github.com/kenzok8/small.git;main" >> feeds.conf.default

# Modify version
sed -i 's/DISTRIB_REVISION=.*/DISTRIB_REVISION="ImmortalWrt-$(date +%Y%m%d)"/g' package/base-files/files/etc/openwrt_release 2>/dev/null || true

# Modify hostname  
sed -i 's/OpenWrt/ImmortalWrt/g' package/base-files/files/etc/config/system 2>/dev/null || true

# Modify timezone
sed -i 's/UTC/CST-8/g' package/base-files/files/etc/config/system 2>/dev/null || true

echo "=============================================="
echo "DIY Part 1 Completed"
echo "=============================================="
