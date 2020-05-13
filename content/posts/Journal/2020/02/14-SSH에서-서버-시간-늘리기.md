---
date: 2020-02-14
title: SSH에서 서버와의 연결 시간 늘리기
categories: [기록]
tags: [SSH]
draft: false
---

# SSH 클라이언트

```zsh
$ vi ~/.ssh/config 

ServerAliveInterval 120

:wq!
```

# SSH 서버

```zsh
$ sudo vi /etc/ssh/sshd_config

ClientAliveInterval 120
ClientAliveCountMax 720

:wq!
