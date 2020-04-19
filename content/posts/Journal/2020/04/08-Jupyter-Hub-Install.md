---
date: 2020-04-08
title: Jupyter Hub 설치
categories: [기록]
tags: [Jupyter, "데이터 분석 환경"]
draft: true
---

> 참고: http://tljh.jupyter.org/en/latest/


Ubuntu 18.04 x64

apt upgrade
apt update


$ sudo apt install python3 python3-dev git curl

$ curl https://raw.githubusercontent.com/jupyterhub/the-littlest-jupyterhub/master/bootstrap/bootstrap.py | sudo -E python3 - --admin <admin-user-name>

`<admin-user-name>` 는 주피터허브를 관라하고자 하는 관리자 이름이며, 잊어서는 안된다. 




$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
$ echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile

pyenv install miniconda3-latest
pyenv global miniconda3-latest
conda update -y conda
conda init bash
source .bashrc

conda create -y -n jupyterhub-env python=3.7

alias jpyhub="conda activate juypterhub-env"
alias deact="conda deactivate"

conda install -y -c conda-forge nodejs
npm install -g configurable-http-proxy
$ node -v
v13.12.0

$ npm -v
6.14.4

$ conda install -y -c conda-forge jupyterhub
$ conda install -y notebook
$ conda install -y jupyterlab














주피터 허브 실행

$ jupyterhub

웹에서 확인

http://{IP_ADDRESS}:8000/


주피터 허브 구성하기

jupyterhub --generate-config

c = get_config()

c.JupyterHub.ip = '0.0.0.0'
c.JupyterHub.port = 443

SSL 적용하기

git clone https://github.com/letsencrypt/letsencrypt .letsencrypt

cd ~/.letsencrypt

$ sudo ./letsencrypt-auto --help

$ sudo ./letsencrypt-auto certonly --standalone -d {DOMANIN}

$ sudo -s
# ls
README  cert.pem  chain.pem  fullchain.pem  privkey.pem


/etc/letsencrypt/live/noweaver.com/privkey1.pem
/etc/letsencrypt/live/noweaver.com/fullchain1.pem