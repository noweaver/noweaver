---
date: 2019-10-31
title: Mac (로컬)환경에서 PySpark와 Jupyter 연동 설치
tags: [PySpark, Jupyter]
categories: [기록]
draft: false
---

## 준비단계


### XCode Developer Tools 설치

터미널에서 아래와 같이 실행
```
$ xcode-select --install
```


### 홈블루(homebrew) 설치

터미널에서 아래와 같이 실행
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```




### 파이썬 환경

아나콘다는 미리 설치되어 있어야 한다. 아나콘다 파이썬 가상환경에서 진행하므로 아나콘다 가상환경을 생성한다.


```bash
$ conda create --name myspark python=3.7
```

### 자바 설치

오라클 자바를 설치하지 않고, OpenJDK를 사용했다. 나는 맥에 이미 자바를 섩치하는 [과정](../../../../misc/2019-10-30-mac-openjdk-installation)을 작성했었다. 


```bash
$ java -version
openjdk version "13.0.1" 2019-10-15
OpenJDK Runtime Environment (build 13.0.1+9)
OpenJDK 64-Bit Server VM (build 13.0.1+9, mixed mode, sharing)
```

## Spark 설치


[Apache Spark](https://spark.apache.org/downloads.html) 에서 다운로드하고 /Workspace/devlibs 디렉터리에 설치한다. 

```
$ tar -xzf spark-2.4.4-bin-hadoop2.7.tgz -C $HOME/Workspace/devlibs/
$ sudo mv spark-2.4.4-bin-hadoop2.7 $HOME/Workspace/devlibs/spark-2.4.4
$ sudo ln -s $HOME/Workspace/devlibs/spark-2.4.4 $HOME/Workspace/devlibs/spark
```

환경파일을 수정한다.

```
$ vi ~/.zshrc

# Spark
export SPARK_HOME="$HOME/Workspace/devlibs/spark"
export PATH=$SPARK_HOME/bin:$PATH
export SPARK_LOCAL_IP='127.0.0.1'

wq!

$ source ~/.zshrc
```

## PySpark 설치

아나콘다를 통해서 pyspark 패키지를 설치한다. 

```
$ source activate myspark
(myspark) $ conda install -y pyspark
```

환경파일을 수정한다
```
$ vi ~/.zshrc

export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

wq!

$ source ~/.zshrc
```

conda install -c conda-forge findspark





----

brew tap homebrew/cask-versions




brew install scala

# SCALA Home
export SCALA_HOME="/usr/local/Cellar/scala/2.13.1"
export PATH="$SCALA_HOME/bin:$PATH"


# brew install spark가 아니다.
brew install apache-spark


http://sanghun.xyz/2017/12/mac-apche-spark-%EC%84%A4%EC%B9%98/