---
date: 2020-02-17
title: NVM(Node) 설치
categories: [기록]
tags: ["Node", "설치"]
draft: false
---

`nvm`은 여러 `Node.js` 버전을 분리하여 사용할 수 있는 Node.js `버전 매니저`이다. 기존에 Node를 설치를 했다면, [여기](http://junsikshim.github.io/2016/01/29/Mac%EC%97%90%EC%84%9C-Node.js-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0.html)를 참조하여 노드를 제거한다. 대략 제걱하는 방법은 다음과 같다. 맥을 기준으로 설명한다. 

## 기존 노드 삭제

```zsh
$ sudo rm /usr/local/bin/npm
$ sudo rm /usr/local/share/man/man1/node.1
$ sudo rm /usr/local/lib/dtrace/node.d
$ sudo rm -rf ~/.npm
$ sudo rm -rf ~/.node-gyp
$ sudo rm /opt/local/bin/node
$ sudo rm /opt/local/include/node
$ sudo rm -rf /opt/local/lib/node_modules
```

## 노드 매니저 NVM 설치

맥은 Brew 를 이용하는 것이 가장 편하다. 사용자 구성을 위해서는 공식사이트를 이용한다. 여기서는 Brew를 이용한다.

```zsh
$ brew install nvm
$ mkdir ~/.nvm
$ vi .zshrc

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

:wq!

$ source .zshrc
$ nvm install stable
```
## 노드 설치 확인

```zsh
$ nvm ls
->      v13.8.0
         system
default -> stable (-> v13.8.0)
node -> stable (-> v13.8.0) (default)
stable -> 13.8 (-> v13.8.0) (default)
iojs -> N/A (default)
unstable -> N/A (default)
lts/* -> lts/erbium (-> N/A)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.17.1 (-> N/A)
lts/carbon -> v8.17.0 (-> N/A)
lts/dubnium -> v10.19.0 (-> N/A)
lts/erbium -> v12.16.0 (-> N/A)
```
