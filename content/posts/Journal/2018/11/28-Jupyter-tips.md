---
date: 2018-11-28
title: "Jupyter Tips"
tags: ["데이터 분석 환경", Jupyter]
categories: [기록]
---

# Jupyter 설치 후, 몇 가지 Customizing

## Jupyter 설정파일 생성

```shell
// ~/.jupyter 디렉토리가 생기고, 하위에 jupyter_notebook_config.py 파일이 생성된다.
$ jupyter notebook --generate-config
```

## 토큰 사용하지 않고 패스워드 사용

```shell
$ ipython                                                                                                                                   

In [1]: from IPython.lib import passwd
In [2]: passwd()
Enter password: 
Verify password: 
Out[2]: 'sha1:e54713337d5c:c9bfccddf9c07560f8590e4fc97a81ef1a1ab714'  // 컴마 안의 내용 복사

`ctrl + D`

$ vi ~/.jupyter/jupyter_notebook_config.py

c = get_config()

// 위에서 복사한 패스워드 복불
c.NotebookApp.password = 'sha1:e54713337d5c:c9bfccddf9c07560f8590e4fc97a81ef1a1ab714'
```

## 기타 설정

```
// 서버로 사용
c.NotebookApp.ip = '0.0.0.0'

// Jupyter 기본 브라우저 실행 하지 않음
c.NotebookApp.open_browser = False

// Jupyter 실행 포트번호 변경
c.NotebookApp.port = 8888

// Jupyter 실행 후, 시작 위치 지정
c.NotebookApp.notebook_dir = '/home/ryan/Workspace'
```

## Jupyter 서버로 실행 방법

```shell
$ nohup jupyter notebook --allow-root > ~/.jupyter_error.log& jobs -p | awk '{print $3}' > ~/.jupyter_pid.txt

// Jupyter 프로세스 종료 시킬 때
$ kill -9 {cat ~/.jupyter_pid.txt}
```

이것을 다음처럼 환경파일에 Alias 걸어둔다. awk 부분 single quote 부분 유의한다. 
```zsh
vi .zshrc
alias jn="nohup jupyter notebook --allow-root > ~/.jupyter_error.log& jobs -p | awk '{print \$3}' > ~/.jupyter_pid.txt"
alias killjn="kill -9 \$(cat ~/.jupyter_pid.txt)"

wq!
$ source .zshrc
```

# Jupyter 메모리 사용량 체크

## 설치

```shell
$ conda install -y memory_profiler
```

## 사용법
주피터 쉘에서 실행한다.

```python
%load_ext memory_profiler
%memit
```

# Jupyter Extension

## 설치

```shell
$ conda install -c conda-forge jupyter_contrib_nbextensions
```
## 유용한 Extensions

* 변수 탐색기: Variable Inspector
* 코드 접기: Codefolding
* 섹션 접기: Collapsible Headings
* 목차: Table of Contents
* 코드 실행시간: Execution Time

# Jupyter 폰트 변경

아래처럼 수정하고 Jupyter 재실행

```shell
// $HOME/.jupyter 디렉터리가 없으면 아래와 같이 실행
$ jupyter notebook --generate-config

$ cd $HOME/.jupyter
$ mkdir custom && touch custom.css
$ cd custom
$ vi custom.css

.CodeMirror pre {font-family: D2Coding, Consolas; font-size: 12pt; line-height: 120%;}

// 아래 설정하면 노트북 와이드하게 됨. 그래서 TOC 플러그인 하면 좌우 스크롤 생겨서 불편함
// 그래도 와이드하게 쓰고 싶으면 주석 제거
//.container { width:100% !important; }

div.output pre{
    font-family: D2Coding, Consolas;
    font-size: 12pt;
}

wq!
```
