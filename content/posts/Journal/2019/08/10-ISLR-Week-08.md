---
date: 2019-08-10
title: An Introduiction to Statistical Learning - 8주차
categories: [기록]
tags: ["Data Science", ISLR]
draft: false
---

## 8주차 커리큘럼

### Day 1

* Ch10: Unsupervised Learning
    - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/unsupervised.pdf), [복사본](/data-science/ISLR/unsupervised.pdf)
    - 교재: 
        - Ch 10.1 The Challenge of Unsupervised Learning
        - Ch 10.2 Principal Components Analysis
    - [Unsupervised Learning and Principal Components Analysis (12:37)](https://www.youtube.com/watch?v=ipyxSYXgzjQ&list=PL5-da3qGB5IBC-MneTc9oBZz0C6kNJ-f2)


### Day 2

* Ch10: Unsupervised Learning
    - 교재: Ch 10.2 Principal Components Analysis
    - [Exploring Principal Components Analysis and Proportion of Variance Explained (17:39)](https://www.youtube.com/watch?v=dbuSGWCgdzw&list=PL5-da3qGB5IBC-MneTc9oBZz0C6kNJ-f2)

### Day 3

* Ch10: Unsupervised Learning
    - 교재: 
        - Ch 10.3 ClusteringMethods
            - 10.3.1 K-Means Clustering
    - [K-means Clustering (17:17)](https://www.youtube.com/watch?v=aIybuNt9ps4&list=PL5-da3qGB5IBC-MneTc9oBZz0C6kNJ-f2)


### Day 4 

* Ch10: Unsupervised Learning
    - 교재:
        - Ch 10.3 ClusteringMethods
            - 10.3.2 Hierarchical Clustering
    - [Hierarchical Clustering (14:45) ](https://www.youtube.com/watch?v=Tuuc9Y06tAc&list=PL5-da3qGB5IBC-MneTc9oBZz0C6kNJ-f2)


### Day 5

* Ch10: Unsupervised Learning
    - 교재: 
        - Ch 10.3 ClusteringMethods
            - 10.3.3 Practical Issues in Clustering
    - [Breast Cancer Example of Hierarchical Clustering (9:24)](https://www.youtube.com/watch?v=yUJcTpWNY_o&list=PL5-da3qGB5IBC-MneTc9oBZz0C6kNJ-f2)


### Day 6

1. 비지도 학습이란 무엇인가?
    * 정답을 따로 알려주지 않고(label이 없다), 비슷한 데이터들을 군집화 하는 것.
    * 예를들어 고양이, 병아리, 기린, 호랑이 사진을 비지도학습 시킨다고 해보자. 각 사진이 무슨 동물인지 정답(label)을 알려주지 않았기 때문에 이 동물이 '무엇'이라고 기계가 정의는 할 수 없지만 비슷한 단위로 군집화 해준다. 다리가 4개인 고양이와 호랑이를 한 분류로 묶고, 다리가 4개지만 목이 긴 기린은 다른 분류로, 다리가 얇고 몸통이 둥그런 병아리는 또 다른 분류로 나누어 놓을 것이다. 
    * 실무에서는 지도학습에서의 적절한 feature를 찾아내기 위한 전처리 방법으로 비지도 학습을 쓰기도 한다. (어떻게 분류하는 것이 좋을까?의 결과물이랄까?)
    * 비지도 학습은 통계학의 밀도 추정(density estimation)과 깊은 연관이 있으며, 머신러닝 및 데이터 마이닝 분야에서는 클러스터링 (clustering)에 많이 이용된다. 비지도 학습 또는 생성 학습 (generative learning)이라고 불리는 머신러닝 알고리즘으로는 아래와 같은 알고리즘들이 있다.
        - Deep neural network (DNN)
        - Self-organizing map (SOM)
        - Adaptive resonance theory (ART)
        - Deep autoencoder
        - Deep belief network (DBN)
        - Boltzmann machine (BM), Restricted Boltzmann machine (RBM)
        - K-means algorithm
2. PCA란 무엇이며 어떠한 특징이있는가? 고려사항은?
    * 정의
        - 고차원의 데이터를 저차원의 데이터로 환원시키는 기법이다. 서로 연관 가능성이 있는 고차원 공간의 표본들을 선형 연관성이 없는 저차원 공간(주성분)의 표본으로 변환하기 위해 직교 변환을 사용한다. 
        - 주성분의 차원수는 원래 표본의 차원수보다 작거나 같다. 
        - 주성분 분석은 데이터를 한개의 축으로 사상시켰을 때 그 분산이 가장 커지는 축을 첫 번째 주성분, 두 번째로 커지는 축을 두 번째 주성분으로 놓이도록 새로운 좌표계로 데이터를 선형 변환한다. 
    * 목적
        - 종종 많은 변수 차원의 빅데이터를 사용한다. 너무 많은 변수들을 가지는 것은 그래픽한 기술들에 문제가 발생하고, 공시적인 다변량 기술에도 문제가 있다.
    * 잠재적인 문제
        - 시각화: 많은 수의 변수들에 대해서는 불가능
        - 계산적인 병목현상: 매우 많은 수의 변수들을 처리하는 것은 계산적으로 불가능
        - Collinearity(공선성), 즉 매우 연관된 변수들 또한 관찰값 보다 더 많은 변수들은 회귀 유형 모델에 문제를 발생시킨다.
3. K-Means 클러스터링이란 무엇이며 어떠한 특징이 있는가? 고려사항은?
    * 정의:
        - 데이터 집합을 서로 비슷한 부분집합으로 나누는 방식
        - 데이터와 각 데이터의 클래스 정보(label)가 존재하면 분류(Classification)로 해결하면 되지만, 해당 데이터들의 클래스(label)나 분류규칙이 무엇인지 알 수 없을 때 이용하는 방법
    * 장점
        - 탐색적 기법: 클러스터링은 알고리즘 자체가 대용량 데이터에 대한 탐색적인 기법으로, 주어진 데이터의 내부구조에 대한 사전 정보없이 의미있는 자료 구조를 찾아낼 수 있는 방법
        - 분석방법의 적용 용이성: 대부분의 클러스터링 기법들과 마찬가지로 분석대상 데이터에 대해 사전 정보를 거의 요구하지 않으므로, 특정 변수에 대한 역할 정의가 필요하지 않으므로 적용이 용이함
    * 단점
        - 거리: 군집분석의 결과는 관찰치 사이의 유사성 또는 비 유사성인 거리를 어떻게 정의하느냐에 따라 크게 좌우되며, 따라서 거리를 정의하는 것은 매우 어려운 문제임
        - 초기 군집수의 결정: K-means는 사전에 정의된 K값에 따라 군집을 형성하게 되므로 군집 수 k가 원본 데이터 구조에 적합하지 않으면 좋은 결과를 얻을 수 없음
4. 계층적 클러스터링(Hierarchical Clustering)이란 무엇이며 어떠한 특징이 있는가? 고려사항은? 
    * 계층적 트리 모형을 이용해 개별 개체들을 순차적, 계층적으로 유사한 개체 내지 그룹과 통합하여 군집화를 수행하는 알고리즘
    * 개체들이 결합되는 순서를 나타내는 트리형태의 구조인 덴드로그램(Dendrogram) 때문에, K-평균 군집화(K-means Clustering)와 달리 군집 수를 사전에 정하지 않아도 학습을 수행할 수 있다.
    * 계층적 군집화는 이름에서 보여지듯, 이 작업은 쉽게말해 우리의 데이터를 '계층화'하는 작업을 말한다.
    * 모든 개체들 간 거리(distance)나 유사도(similarity)가 이미 계산되어 있어야 함
