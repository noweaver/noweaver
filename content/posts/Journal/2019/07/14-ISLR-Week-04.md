---
date: 2019-07-14
title: An Introduiction to Statistical Learning - 4주차
categories: [기록]
tags: ["Data Science", ISLR]
draft: false
---

## 4주차 커리큘럼


### Day 1

* Ch6: Linear Model Selection and Regularization (선형모델 선택 및 Regularization)
    - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/model_selection.pdf), [복사본](/data-science/ISLR/model_selection.pdf)
    - 교재: 6.1 Subset Selection
    - 영문: 203p / 국문: 233p
    - [Linear Model Selection and Best Subset Selection(13:44)](https://www.youtube.com/watch?v=91si52nk3LA&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)
 


### Day 2

* Ch6: Linear Model Selection and Regularization (선형모델 선택 및 Regularization)
    - 교재: 6.1.2 Stepwise Selection
    - 영문: 207p / 국문: 237p
    - [Forward Stepwise Selection (12:26)](https://www.youtube.com/watch?v=nLpJd_iKmrE&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)
    - [Backward Stepwise Selection (5:26)](https://www.youtube.com/watch?v=NJhMSpI2Uj8&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)


### Day 3

* Ch6: Linear Model Selection and Regularization (선형모델 선택 및 Regularization)
    - 교재: 6.1.3 Choosing the Optimal Model
    - 영문: 210p / 국문: 241p
    - [Estimating Test Error Using Mallow's Cp, AIC, BIC, Adjusted R-squared (14:06)](https://www.youtube.com/watch?v=LkifE44myLc&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)
    - [Estimating Test Error Using Cross-Validation (8:43)](https://www.youtube.com/watch?v=3p9JNaJCOb4&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)


### Day 4

* Ch6: Linear Model Selection and Regularization (선형모델 선택 및 Regularization)
    - 교재: 6.2 Shrinkage Methods 
    - 영문: 214p / 국문: 246p
    - [Shrinkage Methods and Ridge Regression (12:37)](https://www.youtube.com/watch?v=cSKzqb0EKS0&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)
    - [The Lasso (15:21)](https://www.youtube.com/watch?v=A5I1G1MfUmA&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)
    - [Tuning Parameter Selection for Ridge Regression and Lasso (5:27)](https://www.youtube.com/watch?v=xMKVUstjXBE&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)



### Day 5

* Ch6: Linear Model Selection and Regularization (선형모델 선택 및 Regularization)
    - 교재:     
        - 6.3 Dimension Reduction Methods (영문 228p, 국문 263p)
        - 6.4 Considerations in High DImensions (영문 238p, 국문 275p)
    - [Dimension Reduction (4:45)](https://www.youtube.com/watch?v=QlyROnAjnEk&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)
    - [Principal Components Regression and Partial Least Squares (15:48)](https://www.youtube.com/watch?v=eYxwWGJcOfw&list=PL5-da3qGB5IB-Xdpj_uXJpLGiRfv9UVXI)


### Day 6

1. 하나의 자료에 대해 최상의 서브셋(subset) 선택, 전진 단계적 선택, 후진 단계적 선택을 수행한다. 각 기법에 대해 0,1,2…,p개의 설명번수를 포함하는 p+1개의 모델을 얻는다. 
    a) k개의 설명 변수를 갖는 세 모델 중 어느 것이 가장 작은 훈련 RSS를 가지는가? 
        * 최상의 서브셋 기법 (Best Subset), 최상의 서브셋을 위한 k predictor(=parameter)에 대해 가능한 모든 모델을 고려하기때문 (가장 작은 훈련 RSS를 찾기위해위해) 

    b) k개의 설명변수를 갖는 세 모델 중 어느것이 가장 작은 검정 RSS를 가지는가?
        * 알수없음, Testing data set의 패턴에 따라 달라질것임. 위의 정보로 판단하기 어려움

    c) 다음의 각각에 대해 참 또는 거짓을 말하여라 (거짓인 경우 이유 설명)
        * 후진 단계적으로 얻어진 k변수 모델의 설명 변수들은 후진 단계적 선택법에 의한 (k+1) 변수 모델 내 설명변수들의 서브셋이다. 
            - FALSE, 이는 k = 1(with설명변수(predictors)가 2개)일때만 유효함. 그렇지 않다면, 전진 또는 후진 단계별 선택에 의해 모델에 포함 된 설명변수는 서로 관련이 없음.

        * 전진 단계적으로 얻어진 k변수 모델의 설명 변수들은 후진 단계적 선택법에 의한 (k+1) 변수 모델 내 설명변수들의 서브셋이다. 
            - FALSE, 전진 또는 후진 단계별 선택에 의한 모델에 포함 된 설명변수(predictors) 서로 관련이 없음.

        * 최상의 서브셋으로 얻어진 k 변수 모델의 설명변수들은 최상의 서브셋 선택법에 의한 (k+1) 변수 모델 내 설명변수들의 서브셋이다.
            - FALSE, 최상의 서브셋은 가능한 모든 서브셋 중에서 선택하므로, k 개의 설명변수가있는 최상의 모델은 (k + 1) 개의 설명변수가있는 모델과 완전히 다른 설명 변수 일 수 있음.


2. lasso는 최소제곱에 비해 (아래 보기 중 옳은 것을 모두 고르시오)
    [] 유연성이 높고, 따라서 편향의 증가가 분산 감소보다 작을 경우 예측 정확도가 향상될 것이다.
    [] 유연성이 높고, 따라서 분산의 증가가 편향 감소보다 작을 경우 예측 정확도가 향상될 것이다.
    [X] 유연성이 낮고, 따라서 편향의 증가가 분산 감소보다 작을 경우 예측 정확도가 향상될 것이다.
    [] 유연성이 낮고, 따라서 분산의 증가가 편향 감소보다 작을 경우 예측 정확도가 향상될 것이다.

3. ridge와 lasso를 정의하고 둘의 차이점 및 특징을 설명하라
    * Ridge, Lasso 두기법 모두regularization 방법이며 회귀계수에대한 제한을 하면서 모델이 과도하게 최적화 되는 과적합을 막는 방법임
    * Ridge
        - 회귀계수(coefficient, weight, 가중치 등)의 제곱합을 최소화 하는 것을 제약조건으로 검. 회귀계수를 0에 가깝게 수렴시키나 정확하게 0에 수렴하게는 하지 못함. 따라서 변수선택이 불가능함. 람다(하이퍼파라미터)로 계수의 영향도를 조정하면서 분산을 줄여 성능을 개선함.
    * Lasso
        - Ridge의 단점을 개선한 기법으로 몇몇 회귀계수를 0으로 수렴할수 있으며 Ridge와 달리 변수 선택이 가능함. 계수의 절대값의 합을 최소화 하는 것을 제약조건으로 검

  
4. 책에서 다룬 1.선형모델, 2.PCR모델, 3.PLS모델과 같은 다양한 회귀모델에 대해 다시 한번 정리해봅시다. (ridge, lasso는 위에서 언급하였으므로 제외)
    * 선형 모델
        - 변수들의 가장 설명력 높은 선형함수를 찾아내는 방법이며, 분산은 낮으나 편향이 높아 모델의 성능이 안좋은 경우가 많음.  가장 단순하고 직관적이라는 장점이 있으나, Coefficient가 크거나(Variance가 커짐) predictor가 많을 경우(Model Interpretability가 떨어짐) 정확한 예측이 어려울 수 있음.
    * PCR (Principal Component Regression)모델
        - 독립 변수들의 주성분들을 추출한 후 차원축소를 통해 만들어진 주성분들을 이용해 회귀모델을 만들어 반응변수 예측. (PCA + multiple linear regression) 다중공선성 (주성분들은 직교함으로) 발생하지 않는다는 장점이 있으나 모델의 영향력을 파악하기가 어려우므로 해석이 어렵다는 단점이 있음.
    * PLS (Partial Least Square regression) 모델
        - PCR과 마찬가지로 차원 축소을 수행하나 반응 Y를 이용하여 원래 변수들을 근사해 반응변수와 관련이 있는 새로운 변수들을 식별해 더 나은 회귀 모형을 찾음. PCR과 달리 반응변수 Y가 차원축소에 관여하기 때문에 반응변수를 잘 설명하는 예측변수를 담은 축을 선택할 수 있음.
