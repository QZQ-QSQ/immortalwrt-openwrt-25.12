#!/bin/bash
#=================================================
# DIY Script Part 2
#=================================================

cd openwrt

echo "=============================================="
echo "DIY Part 2 - Installing packages"
echo "=============================================="

# Update and install from small feed
./scripts/feeds update small
./scripts/feeds install -a -p small

# Install LuCI Chinese language packs
./scripts/feeds install luci-i18n-base-zh-cn
./scripts/feeds install luci-i18n-admin-zh-cn

echo "=============================================="
echo "DIY Part 2 Completed"
echo "=============================================="
