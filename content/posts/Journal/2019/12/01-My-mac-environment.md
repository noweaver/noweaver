---
date: 2019-12-01
title: Mac, 나의 작업환경 만들기 1
tags: [Mac, 설치]
categories: [기록]
draft: false
---

집에 있는 2013년 맥북에 아무것도 설치가 되지 않아서 새로 세팅하면서 기록을 남겨 놓는다.

## 키보드 백스페이스 속도 올리기

1. System Preference 실행
1. Keyboard 실행

![Keyboard_Speed_1](/2019/12-01/1_Keyboard_Speed.png)

1. Show All 클릭
1. Accessibility 실행
1. 왼쪽 메뉴에서 `Keyboard` 선택
1. 중간의 Enable Show Keys 체크박스 클릭하지 말고, 옆에 `Options...` 버튼클릭

![Keyboard_Speed_2](/2019/12-01/2_Keyboard_Speed.png)


## D2Coding 폰트 설치

1. D2Coding [다운로드](https://github.com/naver/d2codingfont)
1. 다운받은 D2Coding-*.zip 파일의 압축을 푼다.
1. D2CodingAll 디렉터리에서 *.ttc 파일을 더블 클릭한다. 
1. 팝업 창이 2개 오픈 되는데, 하단에 있는 `Install Font`를 클릭하여 설치한다.


## Homebrew 설치

Brew 는 CentOS/RedHat의 `RPM`, Ubuntu의 `Apt`와 비슷하다. 맥은 예전에는 `Port`명령어를 썼지만 Brew로 이제 완전히(?) 넘어온 것 같다. 물론 Brew는 맥의 공식 설치 프로그램이 아니다. 맥에서 프로그램 설치는 다음과 같은 방법이 있다.

* AppStore
* Zip
* Pkg
* Dmg
* Brew
* Brew Cask

[Brew](https://brew.sh/index_ko) 웹사이트 가면 설치방법 있다. 설치방법의 스크립트를 복사하여 터미널에 붙여넣기하고 실행하면 되는데, 아래와 같은 에러 메시지를 만날 수 있다.


> error: could not lock config file /usr/local/Homebrew/.git/config: Permission denied
fatal: could not set 'core.repositoryformatversion' to '0'

위의 메시지가 나온다면 /usr/local 접근 권한이 없기 때문이므로 아래처럼 자신의 계정에 admin 퍼미션으로 변경을 해주면 된다. 따라서 아래처럼 실행한다. 

```zsh
$ sudo chown -R $USER:admin /usr/local
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Brew cask도 설치한다. Brew는 맥에서 사용하는 패키지 관리자 프로그램으로 우분투의 `apt`, RedHat 계졀의 `rpm`과 유사한 Command Line 계열의 패키지 설치관리자이다. 하지만, Brew는 GUI 기반 프로그램 설치관리자로 `brew cask`를 제공한다. 이것도 설치한다. `brew search --casks` 명령어를 통해서 소프트웨어 설치 가능한 목록을 확인할 수 있다.

```zsh
$ brew cask install
```

## VS Code 설치

VC Code를 웹사이트에서 [다운로드](https://code.visualstudio.com/Download)해도 되지만, 여기서는 brew (cask) 명령어를 통해서 설치한다. 

```zsh
$ brew search --cask | grep code
appcode
avidcodecsle
avocode
code-notes
code42-crashplan
codekit
codelite
coderunner
dcp-o-matic-encode-server
jclasslib-bytecode-viewer
key-codes
open-in-code
paintcode
qlcolorcode
teacode
ukrainian-unicode-layout
unicodechecker
visual-studio-code

$ brew cask install visual-studio-code
$ brew cask list
```

`LaunchPad` 실행으로 설치가 된 것을 확인할 수 있다. Code > Preference > Settings 실행하고 상단 검색창에서 `Font` 검색한다. `Font Family` 텍스트박스를 확인할 수있는데, 가장 앞에 `D2Coding` 이라고 작성한다. 바로 아래에 `Font Size` 텍스트 박스에 폰트 크기 설정한다.

## Chrome 설치

brew cask 통해서 설치

```zsh
$ brew search --cask | grep chrome
$ brew cask install google-chrome
$ brew cask list
```

## iTerm2 설치

### 설치

brew cask 통해서 설치한다. 

```zsh
$ brew search --cask | grep iterm
iterm2

$ brew cask install iterm2
$ brew cask list
```

### 테마 설치

dracular 테마를 설치한다. 

1. [웹페이지](https://draculatheme.com/)에 가서 `iTerm` 검색하면 설치가이드가 나온다. 여기서는 설치 가이드의 GitHub .zip 파일을 수동으로 다운로드하는 방식으로 설치
1. 다운받았으면 압축을 해제
1. `iTerm2 ` 실행
1. iTerm2 > Preferences > Profiles 탭으로 이동
1. 하단의 톱니바퀴의 `Other Actions` 선택 > `Duplicate Profile` 선택
1. 해당 프로파일 선택 후, 다시, 하단의 톱니바퀴의 `Other Actions` 선택 >`Set as Default` 선택
1. 오른쪽의 `General` 탭 > `Basics`의 `Name`을 수정
1. 오른쪽의 `Colors`  탭 > 오른쪽 아래 코너에 `Color Presets...` 클릭 
1. `Import...` 클릭하고 다운받은 파일 중, `Dracula.itermcolors` 선택
1. `Color Presets...`에서 `Dracula` 선택

### 폰트 설정

오른쪽의 `Text` 탭 선택하고 아래 그림처럼 Font 변경한다. 

![iTerm2_Font](/2019/12-01/1.iTerm2-Font.png)

## zsh 환경 구성하기

### oh-my-zsh 설치

[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)의 매뉴얼 설치를 따라 했다. 먼저 iTerm2를 실행한다.

```zsh
$ git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
$ cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
$ chsh -s $(which zsh)
```
설치 이후, iTerm2를 재실행한다.

### 테마설치

아래와 같이 실행해서 ZSH_THEME='robyrussell' 부분을 ZSH_THEME='agnoster' 변경한다.

```zsh
$ vi .zshrc
# ZSH_THEME='robyrussell'
ZSH_THEME='agnoster'


:wq!

$ source .zshrc
```

### Syntax Highlight 설치

사용할 수 있는 폰트는 녹색의 색상이지만 사용할 수 없는 색상은 어떤 색상도 아니다.

```zsh
$ brew install zsh-syntax-highlighting
$ source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

### 호스트 이름 삭제

맨 아래에 작성

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

## Brew cask 사용하여 자동화 하기

Brew Cask 는 리스트를 만들어서 한 번에 설치를 할 수 있다. 내가 설치하고자 하는 프로그램이 cask repository 에 있는지 `brew search --casks` 명령어를 통해서 확인한다. 

여기서는 cask를 통해서 미리 설치되어 있는 프로그램을 리스트를 만들어 나중에 다시 설치할 때 자동설치를 할 수 있다.

### 목록만들기
  
```zsh

$ brew install zsh-autosuggestions

$ brew cask list > brew_cask_program_list.text
iina
iterm2
visual-studio-code
vlc
selfcontrol
karabiner
spectacle
appcleaner
keka
google-chrome
```

### 자동 설치하기

```zsh
$ brew cask install $(cat brew_cask_program_list.text)
```
