#!/bin/sh

#파이썬3.9 설치
##dependency install
yum install gcc openssl-devel bzip2-devel libffi-devel -y
##python donwload
wget https://www.python.org/ftp/python/3.9.12/Python-3.9.12.tgz
tar -xvf Python-3.9.12.tgz
##compile and install
cd Python-3.9.12/
./configure --enable-optimizations
make altinstall

## add alias
pydir=`which python3.9`
pypip=`which pip3.9`
echo "alias python3=\"$pydir\"" >> /home/ansible/.bashrc
echo "alias pip3=\"$pypip\"" >> /home/ansible/.bashrc
echo "alias python3=\"$pydir\"" >> /root/.bashrc
echo "alias pip3=\"$pypip\"" >> /root/.bashrc

## .bashrc 적용
source /root/.bashrc
source /home/ansible/.bashrc

## 필요패키지 설치
pip3 install --upgrade --ignore-installed pip setuptools
pip3 install ansible
