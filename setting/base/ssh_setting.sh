#!/bin/sh

yum -y install sshd

systemctl enable sshd
systemctl start sshd

firewall-cmd --permanent --add-service=ssh
firewall-cmd --reload