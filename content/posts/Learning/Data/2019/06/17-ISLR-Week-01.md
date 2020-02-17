---
date: 2019-06-17
title: An Introduiction to Statistical Learning - 1주차
tags: [ISLR]
categories: [공부]
draft: false
---

ISLR 공부를 시작했다. 지긋지긋한 통계, 머시러닝 기본적인 공부를 마무리 하고 싶어서다. 또한 그룹, 팀의 리더로서 의사결정, 혹은 선택의 폭을 넒히기 위해서다. 나보다 훌륭한 사람들의 의견을 듣기 위해서는 공부가 필요하다. 온라인 스터디 형식을 힘을 빌려 끝까지 해보고자 한다. 

* 기본도서
  - [An Introduction to Statistical Learning with Applicatin in R](https://www-bcf.usc.edu/~gareth/ISL/ISLR%20Seventh%20Printing.pdf)
  - [가볍게 시작하는 통계학습 - R로 실습하는](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=81859233)


## 1주차 커리큘럼

### Day 1

* Ch1. Introduction
  - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/introduction.pdf), [복사본](/data-science/ISLR/introduction.pdf)
  - [Opening Remarks and Examples (18:18)](https://www.youtube.com/watch?v=2wLfFB_6SKI&list=PL5-da3qGB5ICcUhueCyu25slvsGp8IDTa)
  - [Supervised and Unsupervised Learning (12:12)](https://www.youtube.com/watch?v=LvaTokhYnDw&list=PL5-da3qGB5ICcUhueCyu25slvsGp8IDTa)

### Day 2

* Ch2-1. Statistical Learning
  - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/statistical_learning.pdf), [복사본](/data-science/ISLR/statistical_learning.pdf)
  - [Statistical Learning and Regression (11:41)](https://www.youtube.com/watch?v=WjyuiK5taS8&list=PL5-da3qGB5IDvuFPNoSqheihPOQNJpzyy)
  - [Curse of Dimensionality and Parametric Models (11:40)](https://www.youtube.com/watch?v=UvxHOkYQl8g&list=PL5-da3qGB5IDvuFPNoSqheihPOQNJpzyy)

### Day 3

* Ch2-2. Statistical Learning
  - [Assessing Model Accuracy and Bias-Variance Trade-off (10:04)](https://www.youtube.com/watch?v=VusKAosxxyk&list=PL5-da3qGB5IDvuFPNoSqheihPOQNJpzyy) 
  - [Classification Problems and K-Nearest Neighbors (15:37)](https://www.youtube.com/watch?v=vVj2itVNku4&list=PL5-da3qGB5IDvuFPNoSqheihPOQNJpzyy)
  - [Lab: Introduction to R (14:12) - optional](https://www.youtube.com/watch?v=jwBgGS_4RQA&list=PL5-da3qGB5IDvuFPNoSqheihPOQNJpzyy)

### Day 4

* Ch3-1. Linear Regression
  - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/linear_regression.pdf), [복사본](/data-science/ISLR/linear_regression.pdf)
  - [Simple Linear Regression and Confidence Intervals (13:01)](https://www.youtube.com/watch?v=PsE9UqoWtS4&list=PL5-da3qGB5IBSSCPANhTgrw82ws7w_or9)
  - [Hypothesis Testing (8:24)](https://www.youtube.com/watch?v=J6AdoiNUyWI&list=PL5-da3qGB5IBSSCPANhTgrw82ws7w_or9)

### Day 5

* Ch3-2. Linear Regression
  - [Multiple Linear Regression and Interpreting Regression Coefficients (15:38)](https://www.youtube.com/watch?v=1hbCJyM9ccs&list=PL5-da3qGB5IBSSCPANhTgrw82ws7w_or9)
  - [Model Selection and Qualitative Predictors (14:51)](https://www.youtube.com/watch?v=3T6RXmIHbJ4&list=PL5-da3qGB5IBSSCPANhTgrw82ws7w_or9)
  - [Interactions and Nonlinearity (14:16)](https://www.youtube.com/watch?v=IFzVxLv0TKQ&list=PL5-da3qGB5IBSSCPANhTgrw82ws7w_or9)

### 질의 응답

1. 유연한 통계학습방법과 덜 유연한 방법중 어느것이 일반적으로 성능이 더 나은지 말해보자.
  ![W01-HW-Q1](/data-science/ISLR/W01-HW-Q1.png)
  * 편향과 분산의 Trade-off 문제다. a)의 경우는 표본이 크므로 유연한 방법으로 수행하는 것이 성능이 더 좋다고 볼 수 있다. b)의 경우 관측수가 적다.  
2. 각 시나리오가 분류 혹은 회귀문제 인지 설명하고, 가장 관심 있는것이 추론인지 혹은 예측인지 명시해보자. n과 p 또한 생각해보자.
  ![W01-HW-Q2](/data-science/ISLR/W01-HW-Q2.png)
  * A: 회귀문제(영향도). n = 300, p = 3(회사의 이익, 직원 수, 업종)
  * B: 분류문제(성공/실패). n = 20, p = (판매가격, 마케팅예산, 경쟁자 가격, 그리고 10개 다른 변수 등)
  
3. 회귀 또는 분류에 대한 기법 중, 매우 유연한 방법이 덜 유연한 방법에 비해 가지는 장점과 단점은 무엇인가? 어떤 경우에 더 유연한 기법을 선호하고, 또 어떤 경우에 덜 유연한 기법을 선호하는지 생각해보자.
  * 유연/덜유연 방법은 편향과 분산의 Trade-off 존재. 
  * 유연한 방법
      - 편향이 낮고 분산 높음. 편향이 낮아 성능상 좋지만 분산이 높아 과적합 위험이 존재
      - 데이터가 비선형 관계를 갖고 데이터 양이 많은 경우 선호
  * 덜 유연한 방법
      - 편향이 높고 분산 낮음. 과소적합 위험이 존재
      - 데이터 선형관계를 갖고 데이터 양이 적은 경우 선호
4. 통계학습 기법에서 모수적 기법과 비모수적 기법의 차이는 무엇인가? 회귀 또는 분류에서 모수적 기법과 비모수적 기법의 장점과 단점은 무엇인가?
  * 모수적 기법
      - f는 선형적 데이터를 가지고 있다고 가정한 함수
      - 장점: 선형관계 있다고 가정하므로 성능도 좋고 해석력이 높음
      - 단점: 실제 데이터는 대부분 선형적이지 않음
  * 비모수적 기법
      - f에 대해서 가정한 형태가 존재하지 않음. 즉 데이터가 비선형적적임
      - 장점: 실제 환경 적용에 많이 사용
      - 단점: 데이터의 양이 많이 필요하고 해석력이 떨어짐

5. 80페이지의 표 3.4에 주어진 p값에 대응하는 귀무가설을 기술하고 어떠한 결론을 내릴수 있는지 설명하여라. 설명은 sales, TV, radio, newspaper에 대하여 해야 한다.(표 3.4 - 영문교재 74p /국문교재 80 p)
  ![week1](/data-science/ISLR/week1.png)
  * 문제를 이해 못함

6. KNN 분류기와 KNN 회귀방법 사이의 차이를 설명하여라.
  * KNN 분류기: K개의 가장 가까운 이웃들 중에서 발견된 가장 일반적인 그룹을 사용하여 분류. Qualitative 방식
  * KNN 회귀: K개의 가장 가까운 이웃들의 결과 평균을 구하여 추정하는 방식. Quantitative 방식
