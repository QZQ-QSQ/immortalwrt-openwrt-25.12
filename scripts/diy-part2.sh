#!/bin/bash
#=================================================
# DIY Script Part 2
#=================================================

cd openwrt

echo "=============================================="
echo "DIY Part 2 - Installing packages from small"
echo "=============================================="

# Update and install packages from kenzok8/small
./scripts/feeds update small 2>/dev/null || true
./scripts/feeds install -a -p small 2>/dev/null || true

# Install LuCI Chinese language packs
./scripts/feeds install luci-i18n-base-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-admin-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-firewall-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-network-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-system-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-services-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-status-zh-cn 2>/dev/null || true

echo "=============================================="
echo "DIY Part 2 Completed"
echo "=============================================="
