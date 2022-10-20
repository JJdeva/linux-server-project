#!/bin/sh
nmcli connection add type ethernet ifname enp0s3 con-name ansible ip4 10.0.2.100 gw4 10.0.2.2
nmcli connection modify ansible ipv4.dns 8.8.8.8
nmcli connection up ansible
#nmcli connection show ansible | grep ipv4
exit 0