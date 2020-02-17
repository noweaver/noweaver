---
date: 2019-10-30
title: Mac에 Java 설치하기
tags: [Java, 설치]
categories: [기록]
draft: false
---

AES 관련 코드를 자바로 작성하기 위해서 맥에 OpenJDK(자바) 설치 기록을 남긴다.

## 다운로드

[OpenJDK](https://jdk.java.net/)에서 다운로드 했다. 2019년 10월 30일 기준으로 JDK13 버전을 다운로드 했다. 

## 설치

```bash

$ tar xvfz openjdk-13.0.1_osx-x64_bin.tar.gz
$ mv jdk-13.0.1.jdk/ /Library/Java/JavaVirtualMachines/
```

## 설치 확인

```bash
$ /usr/libexec/java_home -V
Matching Java Virtual Machines (1):
    13.0.1, x86_64:	"OpenJDK 13.0.1"	/Library/Java/JavaVirtualMachines/jdk-13.0.1.jdk/Contents/Home

/Library/Java/JavaVirtualMachines/jdk-13.0.1.jdk/Contents/Home

$ java -version
openjdk version "13.0.1" 2019-10-15
OpenJDK Runtime Environment (build 13.0.1+9)
OpenJDK 64-Bit Server VM (build 13.0.1+9, mixed mode, sharing)
```


-----

$ brew tap AdoptOpenJDK/openjdk
$ brew cask install adoptopenjdk8

# JAVA Home
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"


(base)  ryan@RyanMac  ~  java -version
openjdk version "1.8.0_232"
OpenJDK Runtime Environment (AdoptOpenJDK)(build 1.8.0_232-b09)
OpenJDK 64-Bit Server VM (AdoptOpenJDK)(build 25.232-b09, mixed mode)
(base)  ryan@RyanMac  ~  which java
/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin/java
