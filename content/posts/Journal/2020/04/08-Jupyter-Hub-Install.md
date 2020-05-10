---
date: 2020-04-08
title: Jupyter Hub 설치
categories: [기록]
tags: [Jupyter, "데이터 분석 환경"]
draft: false
---

우분투 18.04의 환경에서 작업을 진행하였다. `sudo` 권한을 가진 `jhadmin` 사용자 계정으로 모든 작업을 진행하였다. 또한, `#`은 root 계정의 쉘 환경이며 `$`는 일반 사용자의 쉘환경을 나타낸다. 사용자 커널 추가등을 하기 위해서 Anaconda 의 미니멀 버전의 miniconda3 설치한다.


# 미리 할일

```bash
# adduser jhadmin
# vi /etc/sudoers
# su - jhadmin

$ sudo apt upgrade -y
$ sudo apt update -y
$ sudo apt autoremove -y
```

# JupyterHub 환경을 위한 Node 설치

```bash
$ sudo apt install -y nodejs
$ sudo apt install -y npm
$ sudo npm install -g configurable-http-proxy
```

# Python(Miniconda3) 설치

여기에서는 miniconda 설치 할 것이다. 대화형 설치이기 때문에 설치 위치를 묻는다면, 여기서는 `/miniconda3`로 하였다.

```bash
$ curl -O https://repo.anaconda.com/miniconda/Miniconda3-4.7.10-Linux-x86_64.sh
$ sudo bash ./Miniconda3-4.7.10-Linux-x86_64.sh

~ 생략 ~
installation finished.
Do you wish the installer to initialize Miniconda3
by running conda init? [yes|no]
```

`yes`를 conda init 실행 한 것인데, `.bashrc` 에 환경 설정을 적용하게 되어 있다. 따라서 환경 설정 업데이트를 다음과 같이 한다. 그러면, 프롬프트가 아래와 같이 변경된다.

```bash
$ source .bashrc
(base) $
```

jupyterhub 그룹생성하고 그룹 소속의 사용자가 사용할 수 있게 그룹 권한을 변경한다. 

```bash
(base) $ sudo groupadd jupyterhub
(base) $ sudo chown -R jhadmin.jupyterhub miniconda3/
(base) $ conda update -y conda
```

가상환경 생성한다.

```bash
(base) $ conda create -y -n jhenv ipykernel -y
(base) $ echo 'alias jhenv="conda activate jhenv"' >> ~/.profile
(base) $ echo 'alias deact="conda deactivate"' >> ~/.profile
(base) $ source .profile
(base) $ jhenv
```

# JupyterHub 설치

jupyter, ipywidgets, nbconvert 설치
```bash
(base) $ conda install -y jupyter
```

jupyterhub, pamela, sudospawner
```bash
(base) $ conda install -y -c conda-forge sudospawner
```
```bash
(base) $ conda install -y -c conda-forge ipykernel
(base) $ conda install -y -c conda-forge jupyterlab
```

# 사용자 생성

주피터허브를 사용할 일반 사용자 계정 `ryan` 계정을 생성한다.
```bash
(base) $ sudo adduser ryan
```
jupyterhub 라는 그룹을 설정하여, 사용자를 같은 그룹으로 묶어 준다.
```bash
(base) $ sudo usermod -a -G jupyterhub jhadmin
(base) $ sudo usermod -a -G jupyterhub ryan
```

# SUDO 권한 사용하여 jupyterhub 실행하기

```bash
(base) $ sudo vi /etc/sudoers

// Defaults secure_path 수정, 파일 끝에 /miniconda3/bin 추가
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/miniconda3/bin"

// 전역환경에 설치한 sudospawner 실행 파일을 JUPYTER_CMD로 설정
Runas_Alias JUPYTER_USERS = %jupyterhub
Cmnd_Alias JUPYTER_CMD = /miniconda3/bin/sudospawner

// jhadmin 사용자가 jupyterhub 그룹에 있는 사용자에 대해서 암호없이 JUPYTER_CMD를 실행
%jupyterhub ALL=(jhadmin) /usr/bin/sudo
jhadmin ALL=(%jupyterhub) NOPASSWD:JUPYTER_CMD

wq!(저장하고 종료)
```

## 테스트

헬프 정보가 나오면 성공적으로 `sudo`권한 설정이 되었다. 

```bash
(base) $ sudo -u jhadmin sudo -n -u $USER /miniconda3/bin/sudospawner --help
Usage: /miniconda3/bin/sudospawner [OPTIONS]
~생략~
```

# PAM 동적인증 설정

아래의 명령어를 통해서 `/etc/shadow`의 shadow 그룹이 없다면 아래와 같은 명령어를 실행해서 만들어 준다. 보통 우분투 계열은 shadow 그룹이 만들어져 있다.

```bash
(base) $ ls -l /etc/shadow
-rw-r----- 1 root shadow 1523 May  5 23:51 /etc/shadow

(base) $ sudo chgrp shadow /etc/shadow
(base) $ sudo chmod g+r /etc/shadow
```

jhadmin 사용자를 shadow 그룹에 추가한다. 
```bash
(base) $ sudo usermod -a -G shadow jhadmin
(base) $ sudo setcap 'cap_net_bind_service=+ep' /usr/bin/node
```

## 테스트

```bash
(base) $ python3 -c "import pamela, getpass; print(pamela.authenticate('$USER', getpass.getpass()))"
```

# JupyterHub 폴더 만들기

```bash
(base) $ sudo mkdir /usr/local/jupyterhub
(base) $ sudo chown jhadmin /usr/local/jupyterhub
(base) $ cd /usr/local/jupyterhub
(base) $ jupyterhub --generate-config
(base) $ vi /usr/local/jupyterhub/jupyterhub_config.py

c.JupyterHub.spawner_class = 'sudospawner.SudoSpawner'
c.Spawner.default_url = '/lab'
c.JupyterHub.ip = '0.0.0.0' 
c.JupyterHub.hub_port = 8888
c.JupyterHub.port = 8080

: wq!(저장하고 종료)
```

# JupyterHub 실행 확인

```bash
(base) $ jupyterhub -f /usr/local/jupyterhub/jupyterhub_config.py
```

# SSL 적용

```bash
(base) $ sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
```

## 설치 확인

```bash
(base) $ sudo /opt/letsencrypt/letsencrypt-auto --help
```

## 키파일 및 체인 파일 생성

```bash
(base) $ sudo /opt/letsencrypt/letsencrypt-auto certonly --standalone -d {domain_name}
```

키파일과 체인 파일을 생성하면 아래의 경로에 설치된다. 

* 체인파일: /etc/letsencrypt/live/{domain_name}/fullchain.pem
* 키파일: /etc/letsencrypt/live/{domain_name}/privkey.pem
* 리뉴얼: letsencrypt-auto renew
* 백업: /etc/letsencrypt

## 주피터 포트 수정

```bash
(base) $ vi /usr/local/jupyterhub/jupyterhub_config.py

# c.JupyterHub.port = 8080
c.JupyterHub.port = 443
c.JupyterHub.ssl_cert = '/etc/letsencrypt/live/{domain_name}/fullchain.pem'
c.JupyterHub.ssl_key = '/etc/letsencrypt/live/{domain_name}/privkey.pem'

: wq!(정하고 종료)
```

# JupyterHub 실행 확인

```bash
(base) $ sudo -u jhadmin sudo -n -u $USER jupyterhub -f /usr/local/jupyterhub/jupyterhub_config.py
```

# 서비스로 만들기

```bash
# vi /lib/systemd/system/jupyterhub.service
[Unit]
Description=Jupyterhub

[Service]
User=root
ExecStart=/miniconda3/bin/jupyterhub -f /usr/local/jupyterhub/jupyterhub_config.py

[Install]
WantedBy=multi-user.target

: wq!(저장하고 종료)
```

# 참고 

* https://metamath1.github.io/2018/12/24/jupyterhub.html
* https://enginius.tistory.com/628
* https://github.com/jupyterhub/jupyterhub/wiki/Using-sudo-to-run-JupyterHub-without-root-privileges
* https://medium.com/@ybarraud/setting-up-jupyterhub-with-sudospawner-and-anaconda-844628c0dbee
* https://realpython.com/intro-to-pyenv/

