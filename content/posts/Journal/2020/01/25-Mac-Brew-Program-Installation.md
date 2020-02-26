---
date: 2020-01-25
title: 맥 키보드 한/영 키 설정
categories: [기록]
tags: [Mac, Karabiner]
draft: false
---

## Karabiner 설치
여기서는 Brew로 맥의 GUI 프로그램을 설치하는 `brew cask`방법으로 설치한다.

```zsh
$ brew cask install karabiner-elements
```

## Karabiner 구성파일 셋업

Finder에서 `command + shift + g` 실행한다. 그리고 팝업에 다음을 입력하고 엔터한다.

 `~/.config/karabiner/assets/complex_modifications`

![Karabiner1](/2020/01-25/Karabiner-1.png)

[애플키보드 한영전환/한자키 지정 (rev.1.13d)](/2020/01-25/KorEng-Hanja.json) 다른 이름으로 저장해서 위의 디렉터리로 파일 복사 혹은 이동

> 출처: https://blog.naver.com/hankboy/221200885234

![Karabiner2](/2020/01-25/Karabiner-2.png)

## Karabiner-Elements 실행

3번째 `Complex modifications` 클릭

![Karabiner3](/2020/01-25/Karabiner-3.png)

아래 `Add rule` 클릭하고, `Enable All` 클릭해서 등록

![Karabiner4](/2020/01-25/Karabiner-4.png)

아래처럼 나오는지 확인하고 종료

![Karabiner5](/2020/01-25/Karabiner-5.png)


오른쪽에 `Command` 키가 잘 동작하는지 눌러보자. 나는 Parallels를 같이 사용하고 있는데, 마찬가지로 잘 동작한다.