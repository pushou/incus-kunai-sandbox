#! /bin/sh
mkdir -p /etc/apt/keyrings/
curl -fsSL https://pkgs.zabbly.com/key.asc -o /etc/apt/keyrings/zabbly.asc
sh -c 'cat <<EOF > /etc/apt/sources.list.d/zabbly-incus-stable.sources
Enabled: yes
Types: deb
URIs: https://pkgs.zabbly.com/incus/stable
Suites: $(. /etc/os-release && echo ${VERSION_CODENAME})
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/zabbly.asc
EOF'
cat << EOF > /etc/apt/preferences.d/zabbly
Package: *
Pin: origin pkgs.zabbly.com
Pin-Priority: 1001
EOF

apt update
apt -y install incus
apt -y install qemu-system # la VM doit supporter la virtualisation pour que kunai-sandbox fonctionne
incus admin init --auto
