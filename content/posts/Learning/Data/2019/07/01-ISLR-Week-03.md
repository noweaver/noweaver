---
date: 2019-07-01
title: An Introduiction to Statistical Learning - 3주차
tags: [ISLR]
categories: [공부]
draft: false
---

## 3주차 커리큘럼


### Day 1

* Ch5: Resampling Methods
    - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/cv_boot.pdf), [복사본](/data-science/ISLR/cv_boot.pdf)
    - 교재: 5.1.1
    - 영문: 176p~178p / 국문:202p~205p
    - [Estimating Prediction Error and Validation Set Approach (14:01)](https://www.youtube.com/watch?v=_2ij6eaaSl0&list=PL5-da3qGB5IA6E6ZNXu7dp89_uv8yocmf)
 
 
### Day 2

* Ch5: Resampling Methods
    - 교재: 5.1.2 ~ 5.1.3
    - 영문: 178p~182p / 국문:205p~210p
    - [K-fold Cross-Validation(13:33)](https://www.youtube.com/watch?v=nZAM5OXrktY&list=PL5-da3qGB5IA6E6ZNXu7dp89_uv8yocmf)

### Day 3

* Ch5: Resampling Methods
    - 교재: 5.1.4 ~ 5.1.5
    - 영문: 183p~187p / 국문:210p~214p
    - [Cross-Validation: The Right and Wrong Ways (10:07)](https://www.youtube.com/watch?v=S06JpVoNaA0&list=PL5-da3qGB5IA6E6ZNXu7dp89_uv8yocmf)

### Day 4

* Ch5: Resampling Methods
    - 교재: 5.2
    - 영문: 187p~190p / 국문:214p~217p
    - [The Bootstrap  (11:29)](https://www.youtube.com/watch?v=p4BYWX7PTBM&list=PL5-da3qGB5IA6E6ZNXu7dp89_uv8yocmf)

### Day 5

* Ch5: Resampling Methods
    - 교재 5.2에 부가설명
    - [More on the Bootstrap (14:35)](https://www.youtube.com/watch?v=BzHz0J9a6k0&list=PL5-da3qGB5IA6E6ZNXu7dp89_uv8yocmf)

### Day 6

1. Kfold cross validation이란 무엇인가?
    * 모델의 적합성, 검증을 위해 사용되는 대표적인 방법.
    * Training과 test로 데이터를 나누기 양이 충분하지 않을때, 오버피팅 이슈등을 위해 사용됨.
    * data set을 k개의 fold (=그룹)으로 나누고, 첫번째 fold를 test로 하며 나머지 k-1개 fold로 모델을 훈련시킴. (이 과정을 모든 fold가 test로 사용 될때까지 여러 번 반복함)
  
2. 검증셋(validation set)기법에 대한 k fold 교차검정(cross validation)의 장점과 단점은 무엇인가?
    * 장점 (validation set 기법의 결점)
        - Validation set기법은 검정오차율(test error rate)의 검증치는 어느 관측치(obs)들이 훈련셋의 검증셋에 포함되느냐에 따라 변동이 상당히 클수있음.
        - Validation set 기법은 검증셋 오차율은 전체 데이터 셋에 대한 모델 적합의 검정오차율을 과대추정하는 경향이 있을 수 있음
    * 단점
        - validation set기법에 비해 복잡하고 오래걸림. (Not Simple)

3. LOOCV기법에 대한 kfold 교차검정(cross validation)의 장점과 단점은 무엇인가?
    * 장점 ( LOOCV의 결점)
        - LOOCV는 K가 n(즉, 샘플수)인 Kfold 기법으로 많은 수의 model을 만들고 test를 해야하기 때문에 computing time이 굉장히 오래 걸리나 Kfold는 상대적으로 덜 걸림
    * 단점
        - Fold를 정해놓고 검정하는 kfold 와 달리, LOOCV기법은 결국 모든 샘플에 대해서 다 한번씩 test를 하기 때문에 편향(bias)가 작으며 ,여러 번 수행해도 같은 결과를 도출함

4. bootstrap은 무엇이며 언제 사용되어지는가? bootstrap의 장점은 무엇인가?
    * 모델 성능추정의 불확실성을 추론하기위해 널리 사용되고 있으며 특히 머신러닝에서는 랜덤샘플링을 통해 학습데이터를 늘리는데 사용됨 (데이터셋의 분포가 고르지 않는 경우 혹은 측정된 샘플이 부족한 경우 사용됨)
    * 불충분한 데이터, 불균형한 데이터를 다루거나 과적합 이슈를 줄이는데 도움이 됨.

5. 주어진 관측치(observation)가 bootstrp 표본의 일부가 되는 확률을 구하자. n개의 관측치(observation)의 셋으로부터 bootstrap 표본을 얻는다고 해보자. (참고: ISLR 교재 5.4 Excercise #2)
    1. 첫번째 bootstrap 관측치가 원래 표본의 j번째 관측치가 아닐 확률은 얼마인가?
        - 1-1/n

    2. n=5일때 j번째 관측치가 bootstrap 표본에 있을 확률은 얼마인가?
        - P(j번째 관측치가 bootstrap 표본안에 있을 확률) = 1 – (1-1/5)^5 = 1-0.8^5=0.672

    3. n= 100일때 j번째 관측치가 bootstrap 표본에 있을 확률은얼마인가?
        - P(j번째 관측치가 bootstrap 표본안에 있을 확률) = 1 – (1-1/100)^100 =1-0.99^100= 0.634

    4. n= 10,000일때 j번째 관측치가 bootstrap 표본에 있을 확률은 얼마인가?
        - P(j번째 관측치가 bootstrap 표본안에 있을 확률) = 1 – (1-1/10000)^10000 = 2-0.9999^10000=0.632

    5. 위의 b,c,d의 결과로 어떠한 결론을 추정할수 있는가?
        - 샘플사이즈가 커질수록 확률은 0.63에 수렴한다는 것을 추정할수 있음


