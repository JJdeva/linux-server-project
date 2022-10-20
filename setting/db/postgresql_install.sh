#!/bin/sh

# postgresql 13설치
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum -y install postgresql13 postgresql13-server

# db 초기화
sudo /usr/pgsql-13/bin/postgresql-13-setup initdb

# postgresql 서비스 시작
sudo systemctl enable postgresql-13
sudo systemctl restart postgresql-13
