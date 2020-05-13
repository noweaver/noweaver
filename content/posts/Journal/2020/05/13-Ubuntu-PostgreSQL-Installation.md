---
date: 2020-05-13
title: Ubuntu, PostgreSQL 설치하기
categories: [기록]
tags: [설치, PostgreSQL, Ubuntu]
draft: false
---

[이전](/posts/Journal/2020/02/13-Centos-Postgresql-Installation/)에 CentOS 7.x에 PostgreSQL 설치한 적이 있다. Vocaking을 만들기 위해서 Database가 필요 했는데, 해당 서버는 Ubuntu 18.04라 기록으로 남긴다. 

# 미리 할 것

## OS 업데이트

```zsh
$ sudo apt -y install update
$ sudo apt -y install upgrade
```

## OS 확인

```zsh
$ cat /etc/os-release
NAME="Ubuntu"
VERSION="18.04.4 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.4 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```

## 현재 패키지 PostgreSQL 버전 확인

```zsh
$ apt show postgresql
Package: postgresql
Version: 10+190ubuntu0.1
Priority: optional

~~~생략~~~
```

현재의 패키지 버전으로 설치하고자 한다면 아래와 같이 명령어로 실행하면 된다. 

```zsh
$ sudo apt -y install postgresql postgresql-contrib
```

하지만, 아래와 같이 [공식 사이트](https://www.postgresql.org/) 가면 현재 버전은 12.x까지 릴리즈 되었다.
![20200513 현재 PostgreSQL 버전](/2020/05/postgresql-version-20200513.png)

## PostgreSQL 저장소 추가

```zsh
$ sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
$ sudo apt install wget ca-certificates
$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```

# PotgreSQL 최신버전 설치

```zsh
$ sudo apt-get update
$ sudo apt show postgresql
Package: postgresql
Version: 12+213.pgdg18.04+1
Priority: optional

~~~생략~~~

$ sudo apt -y install postgresql postgresql-contrib
```

## 설치 확인

```zsh
$ service postgresql status
● postgresql.service - PostgreSQL RDBMS
   Loaded: loaded (/lib/systemd/system/postgresql.service; enabled; vendor preset: enabled)
   Active: active (exited) since Wed 2020-05-13 03:48:17 UTC; 1min 13s ago
 Main PID: 15533 (code=exited, status=0/SUCCESS)
    Tasks: 0 (limit: 1108)
   CGroup: /system.slice/postgresql.service
```

## 접속 확인

```zsh
$ sudo su - postgres
$ psql
psql (12.2 (Ubuntu 12.2-2.pgdg18.04+1))
Type "help" for help.

postgres=# \conninfo
You are connected to database "postgres" as user "postgres" via socket in "/var/run/postgresql" at port "5432".
postgres=# \q
```

# 사용자 생성

## 사용자를 생성

```zsh
$ sudo -u postgres createuser vkadmin
```

## 패스워드 지정

```zsh
$ sudo su - postgres
$ psql
postgres=# alter user vkadmin with encrypted password 'Asdf!234';
```

## 확인

```zsh
postgres=# select * from pg_user;
```

# 데이터베이스 생성

## 생성

```zsh
postgres=# create database "vk" OWNER vkadmin;
postgres=# \l
```

## 원격 접속 허용

`IPv4 local connections:` 영역에서 IP 주소를 `127.0.0.1/32`를 `0.0.0.0/0` 으로 수정한다.

```zsh
$ sudo vi /etc/postgresql/12/main/pg_hba.conf
# IPv4 local connections:
host    vk             vkadmin             0.0.0.0/0            md5
```

Listen 주소도 *로 되어 있는지 확인 한다.

```zsh
$ sudo vi /etc/postgresql/12/main/postgresql.conf
# - Connection Settings -
listen_addresses = '*
```

DB 재시작
```zsh
$ sudo systemctl restart postgresql
```

# pgadmin 설치

맥의 환경을 사용하기 때문에 맥용 pgadmin4 를 설치한다.

```zsh
$ brew cask install pgadmin4
```
