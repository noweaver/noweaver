---
date: 2018-03-31
title: 파이썬 데이터 분석 환경에 대해서
tags: ["데이터 분석 환경", Python, 설치]
categories: [기록]
---
파이썬 분석 환경 이해가 너무 어려워서 기록한다. 우선 내가 파이썬 전문가가 아닌 것도 있지만 Python은 2개의 버전을 가지고 각 가상환경의 [이력의 변화](http://egloos.zum.com/mcchae/v/11271948)도 무척이나 다양하다. *여기서 가상환경은 OS 가상화가 아니다.*

주로 쓰는 환경은 맥과 리눅스다. 물론 회사에서는 윈도우 환경에서 사용도 한다. 모든 환경에서 100% 적용되는 것인지 확인할 수 없다. 그러나 아직까지는 이렇게 구성해서 사용하는데 크게 문제는 없는 것 같다. 파이썬은 공식적인 버전 외에 다양한 버전이 존재한다. 이런 버전 관리를 해주는 것이 pyenv 이다. pyenv 부터 설치한다. 

## 환경 구성

### 리눅스(우부투 16.04)

일종의 개발키트(DevKit)로 설치 시에 필요한 라이브러리 등을 설치한다. 사실, 이미 깔려 있다면 생략해도 된다. 또한 우분투에서 설치했다. 서버 운영환경은 CentOS를 쓰지만 아무래도 개인적으로 쓰기에는 우분투가 덜 부담스럽다. (아닌가?)

#### 의존성 라이브러리 및 프로그램 미리 설치

```
$ sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev
```

#### pyenv 설치

```
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv

$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile

// 파이썬 버전 정보를 prompt 에서 보여주기 위한 방법
$ echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

$ source ~/.bash_profile
$ pyenv --version
pyenv 1.2.7-7-g21c75c1

```

pyenv 명령어를 실행하면 조금 다르게 나올 수 있는데, 시스템에라도 파이썬이 설치 되어 있다면 system 에 기 설치 된 버전을 확인할 수 있다.

```
$ pyenv versions
pyenv: no such command `versios'
```

### Mac(High Sierra)

맥은 pyenv 를 brew 로 설치하면 된다. 조금 더 깔끔하다. ^^ [brew](https://brew.sh/index_ko) 가 설치되어 있지 않는다면 미리 설치 해야한다.

#### pyenv 설치

```
$ brew install pyenv
$ brew upgrade pyenv

$ echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
$ echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile

// 파이썬 버전 정보를 prompt 에서 보여주기 위한 방법
$ echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

$ source ~/.bash_profile
$ pyenv --version
pyenv 1.2.7
```

## Anaconda 설치

왜 아나콘다를 설치하는 것일까? 아나콘다는 각종 개발자나 분석가가 필요한 패키지가 거의 설치가 이미 되어 있다. 따로 pip 로 설치하는 경우가 드물다. 다만, 내 정성적 느낌일지 모르겠으나 패키지가 많아서인지 모르겠으나 실행이 느리다. 특히, 윈도우에서 더 느리다. 심지어 윈도우 워크스테이션인데도.

```
// 설치할 파이썬 목혹을 확인해 보자 파이썬 종류 확인
$ pyenv install -l | more

// 선택사항이긴 하지만 기본적인 python 을 우선 설치
$ pyenv install 3.7.0
$ pyenv versions
  system
  3.7.0

// 데이터 분석을 위해서 수 많은 라이브러리가 있는 아나콘다 설치
// 우분투에서 pyenv 의 아나콘다 버전은 5.3.0 이나, 맥은 5.2.0 이다. 
$ pyenv install anaconda3-5.3.0

// 두 파이썬을 설치하고 내가 사용할 수 있는 파이썬 버전을 확인해 본다.
$ pyenv versions
  system
  3.7.0
  anaconda3-5.3.0

// 주 파이썬 버전을 3.7.0 으로 사용하려면 global 옵션을 준다.
$ pyenv global 3.7.0

// '*' 마크가 3.7.0 으로 되어 있는 것을 확인할 수 있다.
$ pyenv versions
  system
* 3.7.0 (set by /home/spark/.pyenv/version)
  anaconda3-5.3.0

// 아나콘다로 변경해 보자.
$ pyenv global anaconda3-5.3.0
$ pyenv versions
  system
  3.7.0
* anaconda3-5.3.0 (set by /Users/ryan/.pyenv/version)

$ python --version
Python 3.7.0

$ which python
/Users/ryan/.pyenv/versions/anaconda3-5.3.0/bin/python
```

## 가상환경

virtualenv, autoenv 등으로 가상환경을 구성할 수도 있다. 그러나, 아나콘다를 더 많이 사용하는 python 사용자(특히, 분석가)라면 아나콘다의 conda 가상환경을 적극 추천한다. 이유는 덜 혼란스럽다. 즉, virtualenv, autoenv 가상환경이 아님을 주의해야 한다. 

앞 단계에서 리눅스는 아나콘다 5.3.0, 맥은 5.2.0 으로 아나콘다를 설치했다. 아나콘다의 환경설정을 우선 한다.

```
$ echo 'CONDA_HOME="$PYENV_ROOT/versions/anaconda3-5.3.0"' >> .bash_profile
$ echo 'export PATH="$CONDA_HOME/bin:$PATH"' >> .bash_profile

$ source .bash_profile
$ conda update conda
```

이제 conda 를 이용하여 가상환경을 만들어 보자.

```
$ conda create -y -n jupyter-env python=3.6
$ source activate jupyter-env

// 가상환경 바뀜
(jupyter-env) $ 

$ conda env list
# conda environments:
#
base                     /home/spark/.p yenv/versions/anaconda3-5.3.0
jupyter-env           *  /home/spark/.pyenv/versions/anaconda3-5.3.0/envs/jupyter-env

$ pyenv versions
  system
  3.7.0
* anaconda3-5.3.0 (set by /home/spark/.pyenv/version)
  anaconda3-5.3.0/envs/jupyter-env
```

가상환경을 쓰려면, pyenv 로 아나콘다 환경으로 변경하고, 아나콘다 명령으로 가상환경으로 들어간다. 사용하면서 이것이 가장 덜 불편한 것 같다. 왜냐하면 아나콘다만 쓰면 되니까. 또한 conda 를 통해서 python 의존성 패키지 및 라이브러리를 모두 업데이트를 할 수도 있다. 조금 느리지만 편의성만 보면 가장 좋은 선택이다.

conda 의 간단한 사용법은 다음과 같다.


## Conda 기본 사용법

```
$ conda --version                               // 아나콘다 버전 확인
$ conda update conda                            // 아나콘다 업데이트

$ conda create -n jupyter-env python=3.6        // 아나콘다 가상환경 생성
$ conda create --name jupyter-env python=3.6    // 아나콘다 가상환경 생성

$ conda remove -y -name jupyter-env --all       // 아나콘다 가상환경 제거   
$ conda remove -y -n jupyter-env --all          // 아나콘다 가상환경 제거   

$ conda env list                                // 가상환경 리스트
$ conda info --envs                             // 가상환경 리스트


$ activate jupyter-env                          // 가상환경 활성화
$ deactivate jupyter-env                        // 가상환경 비활성화

$ conda install jupyter                         // jupyter 패키지 설치
$ conda list                                    // 패키지 리스트 확인
$ conda update jupyter                          // 패키지 업데이트
$ conda remove jupyter                          // 패키지 제거

$ conda clean --all                             // 캐시 삭제
$ conda clean -a                                // 캐시 삭제
```
## 결론

파이썬 글로벌 버전 관리는 pyenv 로 한다. pyenv 로 Anaconda 를 설치한다. Anaconda 를 설치했으면 파이썬 가상환경은 Anaconda 의 관리자 툴인 conda 를 사용한다. 
