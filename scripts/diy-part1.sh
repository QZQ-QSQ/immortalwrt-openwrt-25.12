#!/bin/bash
#=================================================
# DIY Script Part 1
#=================================================

echo "=============================================="
echo "DIY Part 1 - Adding third-party feeds"
echo "=============================================="

# Add kenzok8/small feed
cat >> feeds.conf.default << 'FEEDS'

# kenzok8/small
src-git small https://github.com/kenzok8/small.git;main
FEEDS

# Modify version
sed -i 's/DISTRIB_REVISION=.*/DISTRIB_REVISION="ImmortalWrt-$(date +%Y%m%d)"/g' package/base-files/files/etc/openwrt_release 2>/dev/null || true

# Modify hostname
sed -i 's/OpenWrt/ImmortalWrt/g' package/base-files/files/etc/config/system 2>/dev/null || true

# Modify timezone
sed -i 's/UTC/CST-8/g' package/base-files/files/etc/config/system 2>/dev/null || true

# Create network config
mkdir -p files/etc/config
WAN_IFACE="${WAN_IFACE:-eth0}"
LAN_IFACE="${LAN_IFACE:-eth1}"
PPPoE_ENABLE="${PPPoE_ENABLE:-false}"

cat > files/etc/config/network << NETEOF
config interface 'loopback'
    option device 'lo'
    option proto 'static'
    option ipaddr '127.0.0.1'
    option netmask '255.0.0.0'

config interface 'lan'
    option device '${LAN_IFACE}'
    option proto 'static'
    option ipaddr '192.168.1.1'
    option netmask '255.255.255.0'
    option ip6assign '60'

config interface 'wan'
    option device '${WAN_IFACE}'
    option proto 'dhcp'
NETEOF

echo "=============================================="
echo "DIY Part 1 Completed"
echo "=============================================="
