---
date: 2018-11-28
title: Jupyter Lab & Git Extension 설치
tags: ["데이터 분석 환경", Jupyter, 설치]
categories: [기록]
---

주피터를 사용하다 사내 분석 환경 중에 Jupyter Lab이 설치 되어 있는 것을 발견했다. 플랫폼 엔지니어가 PySpark 등 아주 유용한 커널을 설치해 두었다. 그러나 가장 아쉬운 부분이 Git 연동이 되지 않는 것이다. 그래서 플랫폼 엔지니어에게 요청하니 다른 업무로 시간이 부족해 보였다. 그 다른 업무도 내가 간접적으로 Involve 되어 있는 것이라 강력하게 요청하는 것도 무리였다. 목마른 사람이 우물을 팔 수 밖에 없어서 결국 내가 설치 테스트 해봤다. 

그러나 아직 한글 폰트, 그래프 테스트는 끝나지 않아 더 테스트를 해 봐야겠다. 

# 파이썬 가상머신 설치

Anaconda 사용자로 무작정 패키지 설치하는 것을 지양하여 Anaconda 제공한 conda 로 가상환경을 생성했다.

```
$ conda create -y -n jupyterlab-env python=3.6
$ source activate jupyterlab-env
(jupyterlab-env) $

(jupyterlab-env) $ conda install -y -c conda-forge jupyterlab

```

# Jupyter Lab, Git extension

## Git Installation

```
(jupyterlab-env) $ conda install -y -c conda-forge nodejs

(jupyterlab-env) $ jupyter labextension install @jupyterlab/git
(jupyterlab-env) $ pip install jupyterlab-git
(jupyterlab-env) $ jupyter serverextension enable --py jupyterlab_git
```

## Jupyter Lab Git Usage

참고로 Jupyter Lab에서 Copy & Paste 명령인 Ctrl + c / Ctrl + v 명령은 두 가지 방법이 존재

* Ctrl + c => Ctrl + Shift + c
* Ctrl + v => Ctrl + Shift + v
* Shift + [Mouse right button]

