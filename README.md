# ansible

## ansible 구성

-   Control Node
    -   admin 서버
-   Managed Node
    -   nginx 서버
    -   backend 서버
    -   db 서버

<img src="bin/ansible-img/ansible1.png" style="zoom:80%;" />





-   공통사항

    -   admin, nginx, backend, db server 모두 ansible 계정 사용

    -   작업 권한 설정

        -   sudo 명령에 대한 NOPASSWD 설정

    -   네트워크 설정 및 호스트네임 설정

    -   SSH 접속 허용

        -   SSH 서비스 설치 및 허용
        -   key 기반 인증 (패스워드 X)

        

-   admin 서버

    -   linux 계열 운영체제
    -   Python 설치
    -   ansible 설치



## 사전 설정

### 공통

root 계정으로 작업 (/root)

1.   git 설치 및 repository clone -> 4개 서버 모두
     -   편의를 위해 디렉토리명을 proj로 변경

```bash
$ yum install -y git
$ git clone https://github.com/JJdeva/linux-server-project.git
$ rename linux-server-project proj linux-server-project
```



2.   sudo명령에 대한 권한 부여 -> 4개 서버 모두
     (패스워드 X)

```bash
# sudo_setting
$ sh /root/proj/setting/base/sudo_setting.sh
```



3.   ssh 설치 및 허용 (기본적으로 실행되어 패스)
     ssh가 안될 때 실행

```bash
$ sh /root/proj/setting/base/ssh_setting.sh
```

4.   hostname 변경

```bash
#admin
$ hostnamectl set-hostname admin
# nginx
$ hostnamectl set-hostname nginx
# backend
$ hostnamectl set-hostname backend
# db
$ hostnamectl set-hostname db
```



5.   네트워크 설정 (static ip)

-   `ip route`로 gateway 확인

    | server | con-name | ipv4.addresses | ipv4.gateway | ipv4.dns |
    | :-- | :-- |:-- |:-- | :--|
    | admin | ansible | 10.0.2.100 | 10.0.2.2 | 8.8.8.8 |
    | nginx | ansible | 10.0.2.200 | 10.0.2.2 | 8.8.8.8 |
    | backend | ansible | 10.0.2.201 | 10.0.2.2 | 8.8.8.8 |
    | db | ansible | 10.0.2.202 | 10.0.2.2 | 8.8.8.8 |

-   network 설정

    ```bash
    # admin
    $ sh /root/proj/setting/admin/admin_net_setting.sh
    # nginx
    $ sh /root/proj/setting/nginx/nginx_net_setting.sh
    # backend
    $ sh /root/proj/setting/backend/backend_net_setting.sh
    # db
    $ sh /root/proj/setting/db/db_net_setting.sh
    ```
    

6.   hosts 파일에 추가

```bash
# admin, nginx, backend, db 모두 같게 진행
$ cat /root/proj/setting/base/hosts > /etc/hosts
```







### admin

1.   key 생성 및 복사
     -   주의 : ansible 계정의 키를 복사해줘야 한다.

```bash
$ su - ansible

$ ssh-keygen
$ ssh-copy-id ansible@nginx
$ ssh-copy-id ansible@backend
$ ssh-copy-id ansible@db
```



2.   키로만 로그인 가능하게 변경

```bash
$ vim /etc/ssh/sshd_config

38  PermitRootLogin without-password
65  PasswordAuthentication no

$ systemctl restart sshd
```



3.   python 설치

```bash
$ sh /root/proj/setting/admin/python_install.sh
```



4.   ansible 설치

```bash
$ yum install epel-release -y
$ yum install ansible -y
```



### nginx





### backend





## ansible 설정

모든 작업은 admin서버의 ansible 계정의 home에서 이뤄진다.

```bash
$ su - ansible
$ cd ~
```

tasks 디렉토리를 하나 만들어주자

```bash
$ mkdir tasks
$ cd tasks
```



### Inventory

```ini
$ vim inventory

[was]
backend

[dbserver]
db

[webserver]
nginx
```





### Config file

```bash
$ vim ansible.cfg

[defaults]
inventory = inventory
remote_user = ansible
ask_pass = false

[privilege_escalation]
become = true
become_ask_pass = false
```



### playbook









# 구성파일 정리

Directory Tree

```

```

