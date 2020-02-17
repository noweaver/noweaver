---
date: 2019-12-01
title: Mac, 나의 작업환경 만들기 2
tags: [Mac, PySpark, Jupyter, 설치]
categories: [기록]
draft: false
---

집에 있는 2013년 맥북에 아무것도 설치가 되지 않아서 새로 세팅하면서 기록을 남겨 놓는다.

## Pyenv 설치

```zsh
$ brew search pyenv
$ brew install pyenv
$ pyevn --version
pyenv 1.2.15

$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc

// 파이썬 버전 정보를 prompt 에서 보여주기 위한 방법
$ echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

## Anaconda 설치

```zsh
$ pyenv install -l | more
$ pyenv install anaconda3-5.3.1

$ pyenv versions
* system (set by /Users/Ryan/.pyenv/version)
  anaconda3-5.3.1

$ pyenv global anaconda3-5.3.1
$ pyenv versions
  system
* anaconda3-5.3.1 (set by /Users/Ryan/.pyenv/version)

$ python --version
```

## Anaconda 데이터분석(가상)환경 만들기

### 가상환경 설정

```zsh
$ conda update conda
$ conda create -y -n myjupyter python=3.7
```

pyenv 명령어를 통해서 가상환경이 만들어졌음을 확인할 수 있다.
```zsh
$ pyenv versions
  system
* anaconda3-5.3.1 (set by /Users/Ryan/.pyenv/version)
  anaconda3-5.3.1/envs/myjupyter
```
### 가상환경 접속

위의 `conda activate myjupyter` 명령을 통해서 가상환경으로 접속한다. 접속하게 되면 프롬프트 다음과 같이 변경된다. 

```zsh
(base) $ conda activate myjupyter
(myjupyter) $
```

이 때, 기존의 bash 사용자가 bash를 사용하다 zsh 로 변경하여 사용하는 경우 Anaconda는 환경셋업을 `conda init` 명령을 통해서 새롭게 만든다. 이때 .zshrc 가장 아래에 다음과 같은 코드가 추가된다. 만일 추가 되지 않았다면 직접 .zshrc에 추가하면 된다. 

```zsh
conda_setup="$('/Users/Ryan/.pyenv/versions/anaconda3-5.3.1/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$conda_setup"
else
    if [ -f "/Users/Ryan/.pyenv/versions/anaconda3-5.3.1/etc/profile.d/conda.sh" ]; then
        . "/Users/Ryan/.pyenv/versions/anaconda3-5.3.1/etc/profile.d/conda.sh"
    else
        export PATH="/Users/Ryan/.pyenv/versions/anaconda3-5.3.1/bin:$PATH"
    fi
fi
unset conda_setup
```

### 시스템 환경변수에 앨리어스

앨리어스를 걸어둔다. 

```zsh
(base) $ vi .zshrc

alias myjupyter="conda activate myjupyter"
alias jn="jupyter notebook"
alias deact="conda deactivate"

wq!

(base) $ source .zshrc
```

### Jupyter 설정

#### Jupyter 설정파일 생성

```zsh
(base) $ jn --generate-config
Writing default config to: /Users/Ryan/.jupyter/jupyter_notebook_config.py
```

#### 토큰 사용하지 않고 패스워드 사용

IPython 쉘 환경 접속한다. 

```zsh
$ ipython                                                                  Python 3.7.2 (default, Dec 29 2018, 00:00:04)
Type 'copyright', 'credits' or 'license' for more information
IPython 6.5.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]: from IPython.lib import passwd
In [2]: passwd()
Enter password:
Verify password:
Out[2]: 'sha1:eaf62b4dbd6b:2918c79bd6efca008833368a2ac8c8e3bf21df6f'       

(Ctrl + d)
In [3]:
Do you really want to exit ([y]/n)? y
```

' ' 안의 내용을 복사(clipboard)해 둔다. 그리고 `Ctrl + d`를 누르고 IPython 환경에서 빠져나온다. 그리고 아래와 같이 위에서 생성한 파일을 수정한다. 가장 상단에 configuration 정보를 가져오는 코드 `c = get_config()` 를 작성한다. 그리고 대략 260라인 정도의 `c.NotebookApp.password` 변수를 찾아서 위에서 복사한 인코딩 값을 아래처럼 할당한다. 

```zsh
$ vi ~/.jupyter/jupyter_notebook_config.py

# Configuration file for jupyter-notebook
c = get_config()

c.NotebookApp.password = 'sha1:eaf62b4dbd6b:2918c79bd6efca008833368a2ac8c8e3bf21df6f'
```

### 주피터 기타 환경변수 설정

```zsh
// 서버로 사용
c.NotebookApp.ip = '0.0.0.0'

// Jupyter 기본 브라우저 실행 하지 않음
c.NotebookApp.open_browser = False

// Jupyter 실행 포트번호 변경
c.NotebookApp.port = 8888

// Jupyter 실행 후, 시작 위치 지정
c.NotebookApp.notebook_dir = '/home/ryan/Workspace'
```

### 주피터 익스텐션 설치

```zsh
(base) $ myjupyter
(myjupyter) $ conda install -c conda-forge jupyter_contrib_nbextensions
```
 - 변수 탐색기: Variable Inspector
 - 코드 접기: Codefolding
 - 섹션 접기: Collapsible Headings
 - 목차: Table of Contents
 - 코드 실행시간: Execution Time


### JupyterLab 설치

JupyterLab은 Jupyter에서 부족한 기능을 제공한다. 하지만 Jupyter 만으로도 충분하다. 

```zsh
(myjupyter) $ conda install -y jupyterlab
(myjupyter) $ jupyter lab
(myjupyter) $ vi .zshrc
alias jl="jupyter lab"

wq!

(myjupyter) $ source .zshrc
```

JupyterLab을 실행하고 다시 Jupyter 를 실행하고자 할 때는 기존의 URL을 변경해주기만 하면 된다. `http://localhost:8888/lab` 에서 `http://localhost:8888/tree` 이렇게 하면 분석할 때는 Jupyter Lab을 사용하다. 프리젠테이션 모드의 경우는 Jupyter Notebook의 익스텐션 기능을 사용할 수 있다. 


## Anaconda 개발(가상)환경 만들기

```zsh
$ conda update conda
$ conda create -y -n mydev python=3.7
$ conda activate mydev
(mydev) $

(mydev) $ vi .zshrc
alias mydev="conda activate mydev"
```

## PyCharm 설치

JetBrains 사이트의 [다운로드](https://www.jetbrains.com/pycharm/)에서 다운받아서 설치한다. 

1. PyCharm을 실행한다.
  ![1.pycharm](/2019/12-01/1.pycharm.png)
1. 오른쪽 하단에 `Configure` > `Preferences` 선택하고 왼쪽 `Editor` 선택한다.
  ![2-1.pycharm](/2019/12-01/2-1.pycharm.png)
1. 왼쪽메뉴에서 `Font` 선택한다.
  ![2-2.pycharm](/2019/12-01/2-2.pycharm.png)
1. 왼쪽메뉴에서 `Project Interpreter` 선택하고, 오른쪽 상단의 '톱니바퀴' 선택하고 `Add` 선택한다.
  ![3.pycharm](/2019/12-01/3.pycharm.png)
1. 왼쪽에서 `Conda Environment` 선택하고 아래 `Exsisting environment`를 선택한다. Interprester: 의 콤보박스를 선택해서 위에서 `Conda`로 생성했던 파이썬 가상환경 `mydev`를 선택한다. 그리고 아래 `Make available to all projects` 체크박스에 체크를 하고 `OK`를 누른다.
  ![5.pycharm](/2019/12-01/5.pycharm.png)
1. 그러면, 설치되어 있는 패키지를 확인할 수 있다. `OK`버튼을 누른다.
  ![6.pycharm](/2019/12-01/6.pycharm.png)
