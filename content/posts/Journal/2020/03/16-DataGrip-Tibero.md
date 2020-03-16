---
date: 2020-03-16
title: Mac, DataGrip 에서 Tibero 설정하기
categories: [기록]
tags: [Mac, DataGrip, Tibero]
draft: false
---

맥을 사용하면서 DB Connection GUI 툴을 오래만에 사용한다. 예전에는 Oracle 접속을 위해서 Toad나 SQL Developer를 사용 했었다. 이번에 Tibero 데이터베이스에 처음으로 접근하는데, 맥용 DB 접근 GUI 툴을 제공하지 않아서 찾아보니, JDBC 드라이버만 있으면 접속할 수 있을 것 같았고, 설정을 해보니 문제 없이 동작하는 것을 확인이 되어 기록으로 남겨 둔다. 

# 1. JDBC Driver 다운 받기

Tibero 공식 홈페이지에서 JDBC 드라이버가 어딨는지 도저히 못 찾겠더라. 스무 고개 하니 Technet 을 만나기도 했지만 딱히 JDBC 드라이버는 보이지 않고, 또한 가입을 하라기에 중단하고 최신 1년 필터링으로 구글링 하니 jdbc driver가 발견이 되더라. 혹시나 하여 올려 둔다.

> **[참고] JDBC Driver**
>> * [다운로드1](/2020/03-16/tibero6-jdbc.jar)
>> * [다운로드2](/2020/03-16/tibero6-jdbc-14.jar)

# 2. DataGrip 설정

DataGrip은 IntelliJ와 PyCharm으로 유명한 JetBrains의 데이터베이스 접근 GUI 툴이다. 상당히 많은 Data Source를 제공한다. 하지만, Tibero는 인지도가 낮아서 DataGrip에서 기본으로 제공하지 않는다.

아래 화면에서 `File` -> `Data Soources...` 클릭한다.

<p align="center">
<img width="800" src="/2020/03-16/DataGrip-1.png">
</p>

아래 그림의 왼쪽 상단의 **+** 클릭한다. 

<p align="center">
<img width="800" src="/2020/03-16/DataGrip-2.png">
</p>

아래처럼 Data Source 목록을 확인할 수 있다. 하단의 `Driver` 를 클릭한다.

<p align="center">
<img width="300" src="/2020/03-16/DataGrip-3.png">
</p>

`Name` 부분에 적절한 Data Source 이름을 적는다. 여기서는 `Tibero`라고 입력했다.

<p align="center">
<img width="800" src="/2020/03-16/DataGrip-4.png">
</p>

아래처럼 `Driver files` 의 **+**를 클릭하여 `Custom JARs...` 클릭하여 위에서 #1 에서 다운로드 받은 JDBC 파일을 임포트한다.

<p align="center">
<img width="200" src="/2020/03-16/DataGrip-5.png">
</p>

`Class:`의 콤보박스를 클릭하여 `com.tmax.tibero.jdbc.TbDriver`를 선택하고, `URL templagtes`의 **+** 누르고, 아래 그림처럼 설정하자.

* Name: Tibero URL
* URL: jdbc:tibero:thin:@{host}[:{port}]:{database}

<p align="center">
<img width="800" src="/2020/03-16/DataGrip-6.png">
</p>

`OK` 버튼을 클릭한다.

이후, `Data Source` 확인하면 `Tibero` 가 보일 것이다.

