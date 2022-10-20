#!/bin/sh
# yum 리포지토리 설정
sudo cp ./nginx.repo /etc/yum.repos.d/nginx/nginx.repo

# nginx 설치
sudo yum install -y nginx

# nginx 서비스 시작
sudo systemctl enable nginx
sudo systemctl start nginx

# 방화벽, 포트 열기
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload

# 설치 버전 출력
echo `nginx -V`