---
date: 2019-11-13
title: Mac 환경의 zsh 쉘 설치하기
tags: [Zsh, 설치]
categories: [기록]
draft: false
---

macOS Catalina(이하 카탈리나) 업그레이를 하면 zsh 쉘이 기본 쉘이다. 기존에는 사용자가 zsh 설치하고 커스마이징을 할 수 있다. 나는 bash 를 사용하기 때문에 굳이 사용할 필요가 없었고, 몇 번 시도를 했지만 익숙함과 편리함이 또 다른 많은 것을 잃게 하기에 다시 bash로 돌아왔다.

그런데, 카탈리나부터 zsh 디폴이기 때문에 나도 바꾸기로 했다. 그 설치 이력을 남긴다. 

## 준비 단계

brew, iTerm2은 원래 사용하고 있었고 카탈리나 업그레이드 이후 zsh 가 이미 설치되어 있다. 

## oh-my-zsh 설치

[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)의 매뉴얼 설치를 따라 했다. 먼저 iTerm2를 실행한다.

```zsh

$ git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
$ cp ~/.zshrc ~/.zshrc.orig

$ cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
$ chsh -s $(which zsh)

```

설치 이후, iTerm2를 재실행한다. 

## 테마설치

아래와 같이 실행해서 `ZSH_THEME='robyrussell'` 부분을 `ZSH_THEME='agnoster'` 변경한다. 

```zsh
$ vi .zshrc

# ZSH_THEME='robyrussell'
ZSH_THEME='agnoster'
:wq!

$ source .zshrc
```

저장하고 `source` 명령얼 쉘환경 업데이트를 하면 변경된 것을 볼 수 있는데, 폰트가 깨지는 것을 확인할 수 있다. 이 때 `powerline` 계열 폰트를 사용하면 되지만, D2Coding 또한 무료로 훌륭하게 지원하고 있으므로 D2Coding으로 변경했다.

## D2Coding 변경

iTerm2 에서 `command + ,` 명령으로 사용자 Profile을 변경한다. 

![iTerm2](/2019/11-13/iTerm2.png)

## Syntax Highlight 설치

사용할 수 있는 폰트는 `녹색`의 색상이지만 사용할 수 없는 색상은 어떤 색상도 아니다. 

```zsh

$ brew install zsh-syntax-highlighting
$ source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

명령어를 실행하면서 확인하면 변경되는 것을 확인할 수 있다.

## 호스트이름 삭제

```zsh
$ vi ~/.zshrc

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

wq!

$ source .zshrc
```