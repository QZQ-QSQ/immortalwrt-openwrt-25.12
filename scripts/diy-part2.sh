#!/bin/bash
# ==============================================================================
# ImmortalWrt DIY Script Part 2
# 用于在 feeds 更新后执行自定义操作（安装软件包等）
# ==============================================================================

set -e
cd openwrt

echo "=============================================="
echo "ImmortalWrt DIY Script Part 2"
echo "=============================================="

# 安装 kenzok8/small 软件包
echo "Installing packages from kenzok8/small..."
./scripts/feeds update small 2>/dev/null || true
./scripts/feeds install -a -p small 2>/dev/null || true

# 安装 OpenClash
echo "Installing OpenClash..."
./scripts/feeds update openclash 2>/dev/null || true
./scripts/feeds install luci-app-openclash 2>/dev/null || true

# 安装 AdGuardHome
echo "Installing AdGuardHome..."
./scripts/feeds update adguardhome 2>/dev/null || true
./scripts/feeds install luci-app-adguardhome 2>/dev/null || true

# 安装 PassWall
echo "Installing PassWall..."
./scripts/feeds update passwall_packages 2>/dev/null || true
./scripts/feeds install -p passwall_packages 2>/dev/null || true
./scripts/feeds update passwall_luci 2>/dev/null || true
./scripts/feeds install -p passwall_luci 2>/dev/null || true

# 安装科学上网依赖
echo "Installing VPN proxy dependencies..."
./scripts/feeds install v2ray-geosite 2>/dev/null || true
./scripts/feeds install v2ray-geoip 2>/dev/null || true
./scripts/feeds install xray-core 2>/dev/null || true
./scripts/feeds install shadowsocksr-libev 2>/dev/null || true
./scripts/feeds install simple-obfs 2>/dev/null || true
./scripts/feeds install trojan 2>/dev/null || true
./scripts/feeds install trojan-plus 2>/dev/null || true
./scripts/feeds install naiveproxy 2>/dev/null || true
./scripts/feeds install redsocks2 2>/dev/null || true
./scripts/feeds install hysteria 2>/dev/null || true
./scripts/feeds install hysteria2 2>/dev/null || true
./scripts/feeds install tuic-client 2>/dev/null || true
./scripts/feeds install sing-box 2>/dev/null || true
./scripts/feeds install chinadns-ng 2>/dev/null || true
./scripts/feeds install smartdns 2>/dev/null || true
./scripts/feeds install ipt2socks 2>/dev/null || true
./scripts/feeds install tcping 2>/dev/null || true
./scripts/feeds install dns2tcp 2>/dev/null || true

# 安装科学上网 LuCI 应用
echo "Installing VPN LuCI apps..."
./scripts/feeds install luci-app-ssr-plus 2>/dev/null || true
./scripts/feeds install luci-app-xray 2>/dev/null || true
./scripts/feeds install luci-app-sing-box 2>/dev/null || true
./scripts/feeds install luci-app-passwall 2>/dev/null || true
./scripts/feeds install luci-app-passwall2 2>/dev/null || true

# 安装其他插件
echo "Installing other plugins..."
./scripts/feeds install cloudflared 2>/dev/null || true
./scripts/feeds install luci-app-cloudflared 2>/dev/null || true
./scripts/feeds install ksmbd 2>/dev/null || true
./scripts/feeds install luci-app-ksmbd 2>/dev/null || true
./scripts/feeds install qbittorrent 2>/dev/null || true
./scripts/feeds install luci-app-qbittorrent 2>/dev/null || true
./scripts/feeds install tailscale 2>/dev/null || true
./scripts/feeds install luci-app-tailscale 2>/dev/null || true
./scripts/feeds install docker 2>/dev/null || true
./scripts/feeds install dockerd 2>/dev/null || true
./scripts/feeds install containerd 2>/dev/null || true
./scripts/feeds install runc 2>/dev/null || true
./scripts/feeds install luci-app-dockerman 2>/dev/null || true
./scripts/feeds install filebrowser 2>/dev/null || true
./scripts/feeds install luci-app-filebrowser 2>/dev/null || true
./scripts/feeds install sqm-scripts 2>/dev/null || true
./scripts/feeds install sqm-scripts-extra 2>/dev/null || true
./scripts/feeds install luci-app-sqm 2>/dev/null || true
./scripts/feeds install ttyd 2>/dev/null || true
./scripts/feeds install luci-app-ttyd 2>/dev/null || true
./scripts/feeds install vlmcsd 2>/dev/null || true
./scripts/feeds install luci-app-vlmcsd 2>/dev/null || true
./scripts/feeds install luci-app-diskman 2>/dev/null || true
./scripts/feeds install luci-app-reboot 2>/dev/null || true
./scripts/feeds install lxc 2>/dev/null || true
./scripts/feeds install luci-app-lxc 2>/dev/null || true
./scripts/feeds install luci-app-filemanager 2>/dev/null || true

# 安装中文语言包
echo "Installing Chinese language packs..."
./scripts/feeds install luci-i18n-base-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-admin-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-firewall-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-network-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-system-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-services-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-status-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-nas-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-docker-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-ddns-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-upnp-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-vpn-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-samba-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-commands-zh-cn 2>/dev/null || true
./scripts/feeds install luci-i18n-filetransfer-zh-cn 2>/dev/null || true

# 安装 USB 和 SATA 支持
echo "Installing USB and SATA support..."
./scripts/feeds install kmod-usb-core 2>/dev/null || true
./scripts/feeds install kmod-usb2 2>/dev/null || true
./scripts/feeds install kmod-usb3 2>/dev/null || true
./scripts/feeds install kmod-usb-storage 2>/dev/null || true
./scripts/feeds install kmod-usb-ohci 2>/dev/null || true
./scripts/feeds install kmod-usb-ehci 2>/dev/null || true
./scripts/feeds install kmod-usb-xhci 2>/dev/null || true
./scripts/feeds install kmod-sata-ahci 2>/dev/null || true
./scripts/feeds install kmod-ahci 2>/dev/null || true
./scripts/feeds install kmod-libata 2>/dev/null || true

# 安装文件系统支持
./scripts/feeds install kmod-fs-ext4 2>/dev/null || true
./scripts/feeds install kmod-fs-vfat 2>/dev/null || true
./scripts/feeds install kmod-fs-ntfs 2>/dev/null || true
./scripts/feeds install kmod-fs-exfat 2>/dev/null || true
./scripts/feeds install kmod-fuse 2>/dev/null || true

# 安装基础依赖
echo "Installing base dependencies..."
./scripts/feeds install curl 2>/dev/null || true
./scripts/feeds install wget 2>/dev/null || true
./scripts/feeds install git 2>/dev/null || true
./scripts/feeds install htop 2>/dev/null || true
./scripts/feeds install nano 2>/dev/null || true
./scripts/feeds install tmux 2>/dev/null || true
./scripts/feeds install bash 2>/dev/null || true
./scripts/feeds install ca-bundle 2>/dev/null || true
./scripts/feeds install ca-certificates 2>/dev/null || true

# 禁用不需要的包
echo "Disabling unwanted packages..."
sed -i 's/CONFIG_PACKAGE_automount=y/CONFIG_PACKAGE_automount=n/g' .config 2>/dev/null || true
sed -i 's/CONFIG_PACKAGE_kmod-usb-storage-uas=y/CONFIG_PACKAGE_kmod-usb-storage-uas=n/g' .config 2>/dev/null || true
echo 'CONFIG_PACKAGE_automount=n' >> .config
echo 'CONFIG_PACKAGE_kmod-usb-storage-uas=n' >> .config

# 创建 LuCI 默认配置
mkdir -p files/etc/config
cat > files/etc/config/luci <<EOF
config core 'main'
    option mediaurlbase 'luci-static/bootstrap'
    option lang 'zh_cn'

config internal 'languages'
    option default 'zh_cn'
EOF

# 创建系统默认配置
cat > files/etc/config/system <<EOF
config system
    option hostname 'ImmortalWrt'
    option timezone 'CST-8'
    option timezone_name 'Asia/Shanghai'

config timeserver 'ntp'
    list server 'ntp.aliyun.com'
    list server 'ntp.tencent.com'
    list server 'ntp.ntsc.ac.cn'
    option enabled '1'
    option enable_server '0'
EOF

# 创建网络默认配置
cat > files/etc/config/network <<EOF
config interface 'loopback'
    option device 'lo'
    option proto 'static'
    option ipaddr '127.0.0.1'
    option netmask '255.0.0.0'

config interface 'lan'
    option device 'br-lan'
    option proto 'static'
    option ipaddr '192.168.1.1'
    option netmask '255.255.255.0'
    option ip6assign '60'
    option dns '223.5.5.5 114.114.114.114'

config interface 'wan'
    option device 'eth0'
    option proto 'dhcp'

config device
    option name 'br-lan'
    option type 'bridge'
    list ports 'eth1'
EOF

# 创建防火墙默认配置
cat > files/etc/config/firewall <<EOF
config defaults
    option input 'REJECT'
    option output 'ACCEPT'
    option forward 'REJECT'
    option synflood_protect '1'

config zone
    option name 'lan'
    option input 'ACCEPT'
    option output 'ACCEPT'
    option forward 'ACCEPT'
    list network 'lan'

config zone
    option name 'wan'
    option input 'REJECT'
    option output 'ACCEPT'
    option forward 'REJECT'
    option masq '1'
    option mtu_fix '1'
    list network 'wan'

config forwarding
    option src 'lan'
    option dest 'wan'
EOF

echo "=============================================="
echo "DIY Part 2 Completed"
echo "=============================================="
