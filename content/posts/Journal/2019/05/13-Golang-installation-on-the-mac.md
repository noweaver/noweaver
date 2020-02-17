---
title: "Mac에 Golang 설치하기"
date: 2019-05-13
tags: ["Golang", "설치"]
categories: [기록]
---
Golang을 설치하는 방법은 Go 언어를 배포하는 [공식사이트](https://golang.org/)에서 해당 운영체제에 맞는 패키지를 받아서 설치하면 된다. Golang은 기본적으로 GitHub 기반에서 개발되어지고 배포된다(따라서 환경설정 부분이 조금 혼동 될 수 있다. 물론 이 부분은 개발자에 관련된 내용이라 이 포스트에서 다루지 않는다). 맥에서는 Brew라는 아주 훌륭한 패키지 설치 관리자가 있고 이것을 이용하면 Golang을 조금 더 쉽게 설치할 수 있다. 이 포스트는 brew를 통해서 Golang을 설치하는 방법을 다룬다. 

# Mac 환경

```shell
sw_vers
ProductName:	Mac OS X
ProductVersion:	10.14.4
BuildVersion:	18E227
```

# Golang 환경구성

```shell
$ echo '# golang env' >> ~/.bash_profile
$ echo 'export GOPATH="${HOME}/.go"' >> ~/.bash_profile
$ echo 'export GOROOT="$(brew --prefix golang)/libexec"' >> ~/.bash_profile
$ echo 'export PATH="${GOPATH}/bin:${GOROOT}/bin:$PATH"' >> ~/.bash_profile
$ source .bash_profile

$ test -d "${GOPATH}" || mkdir "${GOPATH}"
$ test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

$ cd $GOPATH
$ tree
.
└── src
    └── github.com

2 directories, 0 files
```

# brew로 Go 설치

```shell
$ cd ~
$ brew install go
$ go env
go env
GOARCH="amd64"
GOBIN=""
GOCACHE="/Users/ryan/Library/Caches/go-build"
GOEXE=""
GOFLAGS=""
GOHOSTARCH="amd64"
GOHOSTOS="darwin"
GOOS="darwin"
GOPATH="/Users/ryan/.go"
GOPROXY=""
GORACE=""
GOROOT="/usr/local/Cellar/go/1.12.5/libexec"
GOTMPDIR=""
GOTOOLDIR="/usr/local/Cellar/go/1.12.5/libexec/pkg/tool/darwin_amd64"
GCCGO="gccgo"
CC="clang"
CXX="clang++"
CGO_ENABLED="1"
GOMOD=""
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
GOGCCFLAGS="-fPIC -m64 -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -fdebug-prefix-map=/var/folders/q8/f1n49gsx185330gwb__fpfpc0000gn/T/go-build437435357=/tmp/go-build -gno-record-gcc-switches -fno-common"

$ go get golang.org/x/tools/cmd/godoc
$ go get github.com/golang/lint/golint

$ tree .go/ -L 2
.go/
├── bin
│   └── godoc
└── src
    ├── github.com
    └── golang.org

4 directories, 1 

$ brew cleanup
$ go version
go version go1.12.5 darwin/amd64
```