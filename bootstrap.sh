#!/bin/bash

set -e

abort_on_error() {
    echo -e "$@" 1>&2
    exit 1
}

[ "$whoami" != "root" ] || abort_on_error "You have to be root"

yum -y makecache fast
yum -y install \
    epel-release \
    nano \
    git-core \
    net-tools

yum -y makecache fast
yum -y install ansible

yum -y install nfs-utils 

systemctl enable sshd
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl enable rpcbind

echo "/home/tobias/code 192.168.83.1(rw,sync,all_squash,anonuid=1000,anongid=1000)" | tee /etc/exports

cat > /etc/sysconfig/network-scripts/ifcfg-ens33 <<"EOF"
BOOTPROTO="static"
DEFROUTE="yes"
PEERDNS="yes"
PEERROUTES="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_PEERDNS="yes"
IPV6_PEERROUTES="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"
NAME="ens33"
UUID="b0dca0e9-6b1f-4efc-8653-53d1bac4213d"
DEVICE="ens33"
ONBOOT="yes"
IPADDR="192.168.83.250"
NETMASK="255.255.255.0"
GATEWAY=192.168.83.2
NM_CONTROLLED=no
EOF

sudo init 6
