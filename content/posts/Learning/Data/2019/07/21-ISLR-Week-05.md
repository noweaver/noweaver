---
date: 2019-07-21
title: An Introduiction to Statistical Learning - 5주차
tags: [ISLR]
categories: [공부]
draft: false
---

## 5주차 커리큘럼


### Day 1

* Ch7: Moving Beyond Linearity
    - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/nonlinear.pdf), [복사본](/data-science/ISLR/nonlinear.pdf)
    - 교재: Ch7.1 Polynomial Regression
    - [Polynomial Regression and Step Functions (14:59)](https://www.youtube.com/watch?v=gtXQXA7qF3c&list=PL5-da3qGB5IBn84fvhh-u2MU80jvo8OoR)

### Day 2

* Ch7: Moving Beyond Linearity
    - 교재
      - Ch 7.2 Step Functions
      - Ch 7.3 Basis Functions
    - [Polynomial Regression and Step Functions (14:59)](https://www.youtube.com/watch?v=gtXQXA7qF3c&list=PL5-da3qGB5IBn84fvhh-u2MU80jvo8OoR)

### Day 3

* Ch7: Moving Beyond Linearity
    - 교재: Ch7.4 Regression Splines
    - [Piecewise Polynomials and Splines (13:13)](https://www.youtube.com/watch?v=7ZIqzTNB8lk&list=PL5-da3qGB5IBn84fvhh-u2MU80jvo8OoR)


### Day 4

* Ch7: Moving Beyond Linearity
    - 교재: Ch 7.5 Smoothing Splines
    - [Smoothing Splines (10:10)](https://www.youtube.com/watch?v=mxXHJa1DsWQ&list=PL5-da3qGB5IBn84fvhh-u2MU80jvo8OoR)

### Day 5

* Ch7: Moving Beyond Linearity
    - 교재:     
        - Ch 7.6 Local Regression
        - Ch 7.7 Generalized Additive Models
    - [Local Regression and Generalized Additive Models (10:45)](https://www.youtube.com/watch?v=N2hBXqPiegQ&list=PL5-da3qGB5IBn84fvhh-u2MU80jvo8OoR)


### Day 6

1. 기저함수로 사용되는 대표적인 함수들에 대해 나열해보자
    * 기저함수는 공간상에서 일어나는 것을 표현하기 위한 기본적인 함수들의 집합이고 그것을 이용해서 공간상에서 일어나는 모든 것들 을 표현할 수 있다.
    * 다항식회귀, 계단함수, 회귀 스플라인, 평활 스플라인 등

2. 기존 선형회귀보다 다항식 회귀가 갖는 장점은 무엇이며 보통 몇 차수까지 사용 하는가? 차수를 선택하는 검정기법은?
    * 선형회귀는 예측 능력면에서 상당히 제한적임
        - 가정 부준은 근사 값이고, 때때로 잘 맞지 않는다. 
        - 해석력이 다소 떨어지는 부분이 있다. 
    * 다항식 회귀는 원래의 설명변수를 각 거듭제곱하여 얻은 추가적인 설명변수를 포함하혀 선형모델을 확장함
        -  삼차회귀는 세 개의 변수 X, X^2, X^3을 설명변수로 사용
    * 코치 답)
        - 기존 선형회귀와 달리 비선형 데이터에도 적합 가능 함
        - 보통 3 - 4차수까지 선택함
        - ANOVA // 교차검정

3. 회귀 스플라인을 설명하고 회귀 스플라인의 장점을 설명하라
    * 다항식 회귀, 계단함수를 적용한 기저함수의 문제점을 해결하기 위해 구간을 나누어 낮은 차원의 다항식 모형을 적합함.
    * 다항식은 유연한 적합을 위해 높은 차수(차수가 가장 높은 항의 지수)를 사용해야 하지만 스플라인은 차수는 고정시키고 매듭의 수를 증가시켜 유연성을 높일 수 있으며 더 좋은 성능을 냄. 
    * 일반적으로, 스플라인에서 사용하는 기법이 더 안정적인 추정치들을 제공함
    * 코치 답)
        - 구간마다 잘라서 다항식 회귀를 적용 할 수 있으며 구간이 많이 잘릴수록 (knot 커질수록) 유연해짐
        - 장점: 유연한 적합을 위해 높은 차수를 써야하는 다항식 회귀와 달리 회귀 스플라인은 차수를 고정하고 매듭(knots)를 늘려 안정적인 값을 제공함

4. 평활 스플라인을 설명하고 회귀 스플라인의 장점을 설명하라
    * 데이터에 smoothing 한 곡선을 찾아 관측된 데이터에 잘 적합하는 함수
    * 즉, RSS를 가장 작게하는 함수를 찾는 방법. 
    * 하이퍼 파라미터를 튜닝하여 함수를 평활하게 함
    * 코치 답)
        - 평활 스플라인이란 RSS를 작게 하지만 모델의 곡선의 정도에 패널 티를 주어, 함수가 평활(smooth)해지도록 함.
        - 장점: 지나치게 유연해져서 과적합이 발생하는것을 제어 할수 있음

5. GAM은 무엇이며 장점, 단점 및 한계는 무엇인가?
    * 여러 개의 설명변수 X를 기반으로 Y를 유연하게 예측하는 것으로 다중선형회귀의 확장임. 
    * 다중선형회귀와 같이 가산성(additivity)는 유지하면서 각 변수의 비선형함수를 허용하여 표준선형모델을 확장함. 
    * 장점
        - 표준적 선형회귀로는 놓치게 될 비선형 관계를 자동적으로 모델링을 할수있음.
        - 비선형 적합은 반응변수 Y에 대해 더 정확하게 예측할 가능성이 있음. 
    * 단점
        - 모델이 가산적이어야 하며, 그렇기 때문에 많은 변수들이 있는 경우 중요한 상호작용을 놓칠 수 있다.
    * 코치 답)
        - Generalized Additive Models(GAM)은 다중회귀모델과 같이 가산성(additivity)을 유지하면서 비선형함수들로 대체하여 모델을 확장함
        - 장점: 
            - 변수마다 비선형 함수를 적합 할수 있어 비선형 관계를 자동으로 모델링 할수 있음. 
            - 비선형이기 때문에 성능이 더 뛰어남. 함수의 smooth한 정도는 자유도를 통해서 요약가능함
        - 단점: 다중회귀 모델같이 가산성(additivity)어야 하기 때문에 많은 변수들이 있는 경우 중요한 상호작용을 놓칠 수 있음
