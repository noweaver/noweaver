---
date: 2020-02-13
title: CentOS 7에 PostgreSQL 설치하기
categories: [기록]
tags: [설치, CentOS, PostgreSQL]
draft: false
---

# 설치 전, 할 일

##  OS 확인 

```zsh
$ cat /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"
```

## OS 업데이트

```zsh
$ sudo yum update -y
```


# PostgreSQL 설치

```zsh
$ sudo yum install -y postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
```

## 서비스 초기화 및 시작

```zsh
$ sudo service postgresql initdb

```zsh
$ sudo systemctl start postgresql
$ sudo systemctl enable postgresql
```

## PostgreSQL 접속

```zsh
$ sudo -u postgres psql
could not change directory to "/home/ryan"
psql (9.2.23)
Type "help" for help.

postgres=#
```

## postgresql 기본 계정인 postgres의 비번을 설정

```zsh
postgres=# ALTER USER postgres WITH PASSWORD 'asdF!234';
ALTER ROLE
```

## 사용자 데이터베이스 생성

```zsh
postgres=# CREATE USER ryan SUPERUSER;
CREATE ROLE

postgres=# ALTER USER ryan WITH PASSWORD 'asdF!234';
ALTER ROLE


postgres=# create database ryan_db with owner ryan encoding 'UTF8' template template0;

postgres=# \l

                             List of databases
   Name    |  Owner   | Encoding  | Collate | Ctype |   Access privileges
-----------+----------+-----------+---------+-------+-----------------------
 postgres  | postgres | SQL_ASCII | C       | C     |
 ryan_db   | ryan     | UTF8      | C       | C     |
 template0 | postgres | SQL_ASCII | C       | C     | =c/postgres          +
           |          |           |         |       | postgres=CTc/postgres
 template1 | postgres | SQL_ASCII | C       | C     | =c/postgres          +
           |          |           |         |       | postgres=CTc/postgres
(4 rows)

postgres-# \
```

## 외부에서 접속 가능하도록 수정

```zsh
$ sudo vi /var/lib/pgsql/data/pg_hba.conf

# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
#host    all             all             127.0.0.1/32            ident
host    all             all             0.0.0.0/0            md5

$ sudo vi /var/lib/pgsql/data/postgresql.conf
# - Connection Settings -
listen_addresses = '*'
```

## 서비스 재시작
```zsh
$ sudo systemctl restart postgresql
```