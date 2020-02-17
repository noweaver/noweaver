---
date: 2019-04-11
title: 아나콘다, Mac에서 삭제 방법
tags: ["데이터 분석 환경", Anaconda, 설치]
categories: [기록]
---

# 앱으로 삭제

[App Cleaner](https://itunes.apple.com/kr/app/app-cleaner-uninstaller/id1013897218?mt=12) 이용

# 직접 삭제

```
$ rm -rf ~/anaconda3 ~/.conda ~/.anaconda ~/.condarc
$ rm ~/Library/Application Support/binstar/*anaconda*
$ rm ~/Library/Receipts/io.continuum.pkg.anaconda*
```
