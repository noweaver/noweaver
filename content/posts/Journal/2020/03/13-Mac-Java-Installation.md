---
date: 2020-03-13
title: Mac에 자바 설치하기
categories: [기록]
tags: [Mac, Java, 설치]
draft: false
---

오라클의 자바가 유료화 되면서, 그리고 자바 업무를 더 이상 하지 않아 설치를 미루고 있었다. 이클립스 기반의 DBeaver 를 Brew로 설치하고 실행하니 아래와 같은 팝업이 뜬다. 

![Java Missed](/2020/03-13/Java-Missed.png)

한 만디로 자바가 없다는 얘기다. 아래 참고를 통해서 설치한다.

> ***참고***
>> * ***OpenJDK 설명: https://ko.wikipedia.org/wiki/OpenJDK***
>> * ***OpenJDK: https://openjdk.java.net/***
>> * ***AdoptOpenJDK: https://adoptopenjdk.net/***
>> * ***AdoptOpenJDK GitHub: https://github.com/AdoptOpenJDK/homebrew-openjdk***

# 설치

여기서는 `Java 8`을 설치했다.

```zsh
$ brew tap AdoptOpenJDK/openjdk
$ brew cask install adoptopenjdk8
```

# 설치 확인

설치 된 자바 버전 확인

```zsh
$ java -version
$ openjdk version "1.8.0_242"
$ OpenJDK Runtime Environment (AdoptOpenJDK)(build 1.8.0_242-b08)
$ OpenJDK 64-Bit Server VM (AdoptOpenJDK)(build 25.242-b08, mixed mode)
```

# Java Home 세팅

자바 설치 위치 확인

```zsh
$ /usr/libexec/java_home -V
Matching Java Virtual Machines (1):
    1.8.0_242, x86_64:	"AdoptOpenJDK 8"	/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

```

환경변수 설정

```zsh
$ vi .zshrc
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

// 저장 후 종료

$ source ~/.zshrc
$ which java
/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin/java
```