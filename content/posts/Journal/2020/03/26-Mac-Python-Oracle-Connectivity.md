---
date: 2020-03-26
title: Mac, Python에서 Oracle 연결하기
categories: [기록]
tags: [Mac, Oracle, Python]
draft: false
---

데이터베이스 기반의 업무가 아니기 때문에 별달리 접근할 일은 없었다. 하지만, 해외 법인의 데이터베이스에 접근할 일이 종종 있는데, 그럴 경우 JDBC를 통해서 DBGrip 이나 DBwever 를 통해서 접근을 했기 때문에 별 달리 고민이 없었다. 그런데, Mac의 Python을 통해서 오라클 데이터베이스에 접근해야 해서 기록으로 남견둔다. 

> 참고: https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html

# Oracle Instance Client 설치

오라클 [Instant Client](https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html) 페이지에서 최신 버전과 목적에 맞게 다운로드를 한다.

여기서는 기본(디폴트) 라이브러리와 SDK를 다운로드 했다.

* instantclient-basic-macos.x64-19.3.0.0.0dbru.zip
* instantclient-sdk-macos.x64-19.3.0.0.0dbru.zip

다음과 같이 설치 작업을 진행한다.

3rd-party 라이브러리이므로 /opt 디렉터리에 oracle 디렉터리를 만든다. `/opt`는 접근 권한이 없으므로 `sudo` 권한으로 만든다. 이후, `/opt/oracle` 디렉터리에 **`-d`** 옵션을 주고 압축을 푼다.

```zsh
$ sudo mkdir -p /opt/oracle

$ sudo unzip instantclient-basic-macos.x64-19.3.0.0.0dbru.zip -d /opt/oracle
$ sudo unzip instantclient-sdk-macos.x64-19.3.0.0.0dbru.zip -d /opt/oracle
```

압축이 잘 풀렸는지 목록을 확인한다.

```zsh
$ cd /opt/oracle/ 
$ ls
instantclient_19_3

$ cd /opt/oracle/instantclient_19_3 
$ ls -altrh
total 478272
-r-xr-xr-x@ 1 root  wheel   5.6K Mar 26 09:30 BASIC_LICENSE
-rw-r--r--@ 1 root  wheel   1.6K Mar 26 09:30 BASIC_README
-r-xr-xr-x@ 1 root  wheel   5.6K Mar 26 09:30 SDK_LICENSE
-rw-r--r--@ 1 root  wheel   1.6K Mar 26 09:30 SDK_README
-rwxr-xr-x@ 1 root  wheel   9.7K Mar 26 09:30 adrci
-rwxr-xr-x@ 1 root  wheel    39K Mar 26 09:30 genezi
lrwxr-xr-x  1 root  wheel    20B Mar 26 09:30 libclntsh.dylib -> libclntsh.dylib.19.1
lrwxr-xr-x  1 root  wheel    20B Mar 26 09:30 libclntsh.dylib.10.1 -> libclntsh.dylib.19.1
lrwxr-xr-x  1 root  wheel    20B Mar 26 09:30 libclntsh.dylib.11.1 -> libclntsh.dylib.19.1
lrwxr-xr-x  1 root  wheel    20B Mar 26 09:30 libclntsh.dylib.12.1 -> libclntsh.dylib.19.1
lrwxr-xr-x  1 root  wheel    20B Mar 26 09:30 libclntsh.dylib.18.1 -> libclntsh.dylib.19.1
-rwxr-xr-x@ 1 root  wheel    94M Mar 26 09:30 libclntsh.dylib.19.1
-rwxr-xr-x@ 1 root  wheel   4.6M Mar 26 09:30 libclntshcore.dylib.19.1
-rwxr-xr-x@ 1 root  wheel   8.0M Mar 26 09:30 libnnz19.dylib
lrwxr-xr-x  1 root  wheel    18B Mar 26 09:30 libocci.dylib -> libocci.dylib.19.1
lrwxr-xr-x  1 root  wheel    18B Mar 26 09:30 libocci.dylib.10.1 -> libocci.dylib.19.1
lrwxr-xr-x  1 root  wheel    18B Mar 26 09:30 libocci.dylib.11.1 -> libocci.dylib.19.1
lrwxr-xr-x  1 root  wheel    18B Mar 26 09:30 libocci.dylib.12.1 -> libocci.dylib.19.1
lrwxr-xr-x  1 root  wheel    18B Mar 26 09:30 libocci.dylib.18.1 -> libocci.dylib.19.1
-rwxr-xr-x@ 1 root  wheel   1.5M Mar 26 09:30 libocci.dylib.19.1
-rwxr-xr-x@ 1 root  wheel   120M Mar 26 09:30 libociei.dylib
-r-xr-xr-x@ 1 root  wheel   148K Mar 26 09:30 libocijdbc19.dylib
-rwxr-xr-x@ 1 root  wheel    98K Mar 26 09:30 liboramysql19.dylib
drwxr-xr-x@ 3 root  wheel    96B Mar 26 09:30 network
-rw-r--r--@ 1 root  wheel   4.0M Mar 26 09:30 ojdbc8.jar
drwxr-xr-x@ 7 root  wheel   224B Mar 26 09:30 sdk
-rw-r--r--@ 1 root  wheel   1.6M Mar 26 09:30 ucp.jar
-rwxr-xr-x@ 1 root  wheel   147K Mar 26 09:30 uidrvci
-rw-r--r--@ 1 root  wheel    73K Mar 26 09:30 xstreams.jar
```

Oracle Instant Client 의 라이브러리를 모두 (심볼릭) 링크를 걸어둔다. 
> 이 때 유의할 사항은 디렉터리 이름의 버전은 `19_3` 을 나타내고 있다.
> 하지만, 위이 목록을 확인했을 때를 보면, `19.1` 로 링크가 걸려 있다. 
> 따라서 심볼릭 링크를 걸 때, `19.1`로 링크를 걸어야 한다. 

```zsh
$ ln -sf /opt/oracle/instantclient_19_3/sdk/include/*.h /usr/local/include/
$ ln -sf /opt/oracle/instantclient_19_3/*.dylib /usr/local/lib/
$ ln -sf /opt/oracle/instantclient_19_3/*.dylib.19.1 /usr/local/lib/
$ ln -sf /opt/oracle/instantclient_19_3/libclntsh.dylib.19.1 /usr/local/lib/libclntsh.dylib
```

# Oracle Instance Client의 환경 세팅

```zsh
$ vi .zshrc
export ORACLE_HOME="/opt/oracle/instantclient_19_3"
export OCI_INC_DIR="$ORACLE_HOME/sdk/include/"
export OCI_LIB_DIR="$ORACLE_HOME"
export LD_LIBRARY_PATH="$ORACLE_HOME"
export DYLD_LIBRARY_PATH="$ORACLE_HOME:$DYLD_LIBRARY_PATH"

// 저장 후, 종료

$ source .zshrc
```

# Python에서 사용할 Oracle 패키지 설치

(미니)아나콘다를 사용하고 있기 때문에 `conda` 명령어로 설치한다. 

> 참고: https://anaconda.org/anaconda/cx_oracle

```zsh
$ conda install -y -c anaconda cx_oracle
```

## 파이썬에서 확인 작업


```python
import cx_Oracle as cx

host = "10.55.210.235"
port = 1521
tns = "MY_TNS"
user = "READONLY"
password = "READONLY"
db_name = "MY_DB"

print(cx.makedsn(host, port, sid))

with cx.connect(url_string) as conn:
    print('ORACLE VERSION: ', conn.version)
    
    curr = conn.cursor()
    curr.execute('SELECT systimestamp FROM dual')
    print('TIME: ', curr.fetchone())
```