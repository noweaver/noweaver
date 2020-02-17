---
date: 2019-05-14
title: "Hugo 블로그 생성"
tags: ["Hugo", "설치"]
categories: [기록]
---

이 블로그는 Golang 기반의 정적 블로그 엔진 [Hugo](https://gohugo.io/)를 기반으로 만들었다. 매뉴얼을 보고 했지만 github 으로 디플로이 하는 부분이 가장 이해가 되지 않아 이 [블로그](https://ryan-han.com/post/etc/creating_static_blog/)를 참조했다. 그러나 이 블로그의 댓글에도 남겼지만, `git submodule` 등의 명령어가 제대로 먹히지 않아서 그냥 여러 블로그를 참조해서 만들었다. Hugo기반의 블로그를 생성하려면 golang이 설치되어야 한다. [Golang 설치 방법](/post/2019/2019-05-13-golang-installation-on-the-mac/)을 참고한다.

# Hugo 설치

```shell
$ brew install hugo

$ which hugo
/usr/local/bin/hugo

$ hugo version
Hugo Static Site Generator v0.55.5/extended darwin/amd64 BuildDate: unknown
```

# 미리 할 일

Hugo 기반의 블로그를 만들고 GitHub 에 디플로이를 하기 위해서는 두 개의 Repository가 필요하다. Hugo 엔진과 관련 파일이 저장할 Repository 이름은  `noweaver` 이고 Hugo 기반으로 랜더링 된 웹페이지가 저장 될 Repository 이름은 `noweaver.github.io`로 만들었다.

# Hugo 블로그 생성

```shell
$ hugo new site noweaver
$ cd noweaver
$ tree
.
├── archetypes
│   └── default.md
├── config.toml
├── content
├── data
├── layouts
├── static
└── themes

6 directories, 2 files

$ git init
$ echo "public/" >> .gitignore
$ more .gitignore
$ git add .
$ git commit -m "first commit"
$ git remote add origin https://github.com/noweaver/noweaver.git
$ git push -u origin master
```

## 테마 설치

테마를 설치하지 않으면 페이지를 만들어도 보이지 않았다. 그래서 [Hugo 테마 사이트](https://themes.gohugo.io) 에서 내가 [마음에 드는 것](https://themes.gohugo.io/whiteplain/) 찾았고 이 테마의 [github 페이지](https://github.com/taikii/whiteplain) 찾았다. 

```shell
$ pwd 
/noweaver

$ git submodule add https://github.com/taikii/whiteplain.git themes/whiteplain

// 테마 가이드대로 cofig.toml 파일을 수정했다. 테마마다 config.toml 파일이 테마 디렉터리 안에도 있었다. 
// 하지만 공식 매뉴얼에는 기본 config.toml 파일은 `hugo` 명령어로 만든 디렉터리 안에 있는 파일이다.
// 'whiteplain' 테마의 GitHub 블로그 config.toml 파일을 수정해서 복불했다. 
// 그리고 baseurl title 만 수정했다.

$ vi .config.toml
baseurl = "https://noweaver.github.io/"
title = "noweaver"
theme = "whiteplain"
languageCode = "en"

~ 생략 ~

:wq!
```

## 첫 번째 포스트 생성

포스트는 수동으로 contents/post/ 안에 만들어도 된다. 하지만, 매뉴얼대로 명령어로로 만들었다.

```shell
$ hugo new post/2019-05-14-첫번째페이지.md
$ hugo server -D
```

실행 터미널의 로그와 같이 http://localhost:1313/ 확인하니 블로그를 볼 수 있었다. `hugo` 명령어로 자동으로 만들어진 `2019-05-14-첫번째페이지.md` 페이지를 보면 안에 `draft: true` 값을 볼 수 있었다. 이것은 초안으로 만들어진 것으로 `-D`옵션을 주지 않으면 웹페이지로 랜더링(퍼블리싱) 되지 않아 실제로 볼 수가 없다. 

아래 명령어를 실행하기 전에 `2019-05-14-첫번째페이지.md` 파일에서 `draft: true` 값을 삭제하고 저장했다. 이유는 `draft` 버전의 파일은 `publishing` 이 되지 않는다.

```shell
$ hugo
```

위의 명령어를 주면 noweaver 디렉터리 안에 `public` 디렉터리가 생성 된다. 이 디렉터리는 실제 실제 웹으로 배포 된다. 

# GitHub 으로 Deploy 하기

## 랜더링 될 Repository를 Clone

```shell
// noweaver 가 아닌 다른 곳에서 한다

$ git clone https://github.com/noweaver/noweaver.github.io.git
Cloning into 'noweaver.github.io'...
warning: You appear to have cloned an empty repository.

$ cd noweaver.github.io
$ cp -R ../nowever/public/* ./
$ git init
$ git add .
$ git commit -m "Hugo 첫번째 페이지"
$ git push -u origin master
```



