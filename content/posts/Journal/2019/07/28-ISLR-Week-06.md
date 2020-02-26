---
date: 2019-07-28
title: An Introduiction to Statistical Learning - 6주차
categories: [기록]
tags: ["Data Science", ISLR]
draft: false
---

## 6주차 커리큘럼


### Day 1

* Ch8: Tree-Based Methods
    - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/trees.pdf), [복사본](/data-science/ISLR/trees.pdf)
    - 교재: 
        - 8.1 The Basics of Decision Trees
        - 8.1.1 Regression Trees (part 1)
    - [Decision Trees (14:37)](https://www.youtube.com/watch?v=6ENTbK3yQUQ&list=PL5-da3qGB5IB23TLuA8ZgVGC8hV8ZAdGh)


### Day 2

* Ch8: Tree-Based Methods
    - 교재:
        - 8.1.1 Regression Trees ( part 2)
        - 8.1.2 Classification Trees
    - [Pruning a Decision Tree (11:45)](https://www.youtube.com/watch?v=GfPR7Xhdokc&list=PL5-da3qGB5IB23TLuA8ZgVGC8hV8ZAdGh)

### Day 3

* Ch8: Tree-Based Methods
    - 교재:
        - 8.1.3 Trees Versus LinearModels 
        - 8.1.4 Advantages and Disadvantages of Tre
    - [Classification Trees and Comparison with Linear Models (11:00)](https://www.youtube.com/watch?v=hPEJoITBbQ4&list=PL5-da3qGB5IB23TLuA8ZgVGC8hV8ZAdGh)


### Day 4

* Ch8: Tree-Based Methods
    - 교재: 
        - Ch 8.2.1 Bagging
        - Ch 8.2.2 Random Forests
    - [Bootstrap Aggregation (Bagging) and Random Forests (13:45)](https://www.youtube.com/watch?v=lq_xzBRIWm4&list=PL5-da3qGB5IB23TLuA8ZgVGC8hV8ZAdGh)


### Day 5

* Ch8: Tree-Based Methods
    - 교재: Ch 8.2.3 Boosting
    - [Boosting and Variable Importance (12:03)](https://www.youtube.com/watch?v=U3MdBNysk9w&list=PL5-da3qGB5IB23TLuA8ZgVGC8hV8ZAdGh)


### Day 6

1. 회귀 트리는 무엇인가?
    * 결정 트리 학습법(decision tree learning)은 어떤 항목에 대한 관측값과 목표값을 연결시켜주는 예측 모델로써 결정 트리를 사용
    * 이는 통계학과 데이터 마이닝, 기계 학습에서 사용하는 예측 모델링 방법 중 하나
    * 트리 모델 중 목표 변수가 유한한 수의 값을 가지는 것을 분류 트리라고 함
    * 이 트리 구조에서 잎(리프 노드)은 클래스 라벨을 나타내고 가지는 클래스 라벨과 관련있는 특징들의 논리곱을 나타냄
    * 즉, 결정 트리 중 목표 변수가 연속하는 값, 일반적으로 실수를 가지는 것은 회귀 트리라 한다.
    * 운영자 답안)
        - 의사결정트리 방법에서 목표변수가 연속형인 경우의 회귀나무(regression tree)라고 함. ( 목표변수가 이산형인 경우의 분류나무(classification tree)라고 함) 의사결정 트리로 분할한 다음 영역마다 의사결정 트리로 분할한 다음 영역마다 평균값으로 회귀를 구함.


2. 트리에서 가지치기(Pruning)를 하는 이유는? 가지치기(Pruning)를 하는데 가장 좋은 방법은 어떻게 결정 하는가?
    * 데이터 과적합할 가능성이 높은 검정셋 성능이 나쁜 경우, 트리가 너무 복잡할 수 있다. 
    * 이 때, 분할 수가 적은 작은 트리를 만들어서 진행할 수 있겠지만, 근시안적 방법이므로 
    * 아주 큰 트리 T0를 만든 다음 그것을 다시 가지치기 하여 서브트리를 얻는 방법이 좋다. 
    * 운영자 답안)
        - 결과 트리가 너무 복잡하여 데이터가 과적합 될 가능성이 높기 때문에 과적합을 방지하기 위해 가지치기를 함. 하지만 너무 작은 트리를 만들 경우 과소적합이 발생할수 있기 때문에 큰 트리를 만들고 가지를 침. 가지치기의 가장 좋은 방법은 sub트리에 대해 교차 검증 기법을 사용해  가장 낮은 검증 오차율을 제공하는 서브트리를 선택하는 것임. 보통 교차 검증을 통해 파라미터를 선택하고 해당 파라미터로 서브트리를 얻음.

 
3. 분류 트리는 무엇인가?
    * 회귀트리와 유사하나, 다른 점은 양적 반응변수가 아니라 질적 반응변수를 예측하는데 사용
    * 각 관측치가 그것이 속하는 영역 내 훈련 관측치들이 가장 많이 포함된 클래스에 속하는지를 예측한다. 
    * 운영자 답안)
        - 회귀트리와 아주 유사한 형태이나 양적변수가 아닌 질적변수를 예측하는 데 사용됨.  반응변수의 평균 값이 아닌 가장많은 빈도 값으로 예측값을 반환함.

4. 지니 지수 교차 엔트로피 (cross-entropy)에 대해 설명해보자.
    * 분류 트리를 만들 때, 지니 지수와 교차 엔트로피가 특정 분할의 질을 평가하는 사용한다.
    * 왜냐하면 두 기업이 분류오류율보다 노드 순도에 더 민감하기 때문이다. 
    * 운영자 답안)
        - 지니, 엔트로피 두가지 모두 불순한 데이터가 포함된 정도를 나타내는 값이며, 불순도가 낮아지는 쪽으로 트리를 업데이트를 함.  일반적으로 지니는 로그 계산이 필요없어서 계산속도가 빠르다고 알려져 있지만 한쪽으로 치우칠수있기 때문에 엔트로피가 좀더 균형있는 나무가 나옴.

5. 트리모델의 장단점은 무엇인가?
    * 장점:
        - 트리는 설명하기 매우 쉽다. 선형회귀보다 설명하기 쉽다.
        - 회귀와 분류기법들보다 인간의 의사결정 과정을 더 밀접하게 반영한다. 
        - 그래픽으로 나타내기 쉽고 심지어 비전문가도 쉽게 해석할 수 있다. 
        - 트리는 가변수들을 만들지도 않고도 질적 설명변수들을 쉽게 처리할 수 있다.
    * 단점:
        - 일부 회귀 및 분류 기법들과 동일한 수준의 예측 정확도를 제공하지 못한다. 
        - 하지만, 배깅, 랜덤포레스트, 부스팅 같은 방법을 사용하여 통합하여 예측 정확도를 향상 시킨다.
    * 운영자 답안)
        - 장점 : 설명이 쉽고 직관적임. 연속형 변수와 범주형 변수를 모두 처리하기 때문에 좀 더 간편함.
        - 단점 :  polynomial 에 비해 예측 정확도가 상대적으로 떨어짐. 또한 상대적으로  robustness가 떨어지기 때문에, 작은 변화에도 결과가 크게 달라질 수 있음.

6. 배깅은 무엇인가?
    * bootstrap aggregating의 줄임말
    * 통계적 분류와 회귀 분석에서 사용되는 기계 학습 알고리즘의 안정성과 정확도를 향상시키기 위해 고안된 일종의 앙상블 학습법의 메타 알고리즘
    * 또한 배깅은 분산을 줄이고 과적합(overfitting)을 피하도록 해줌
    * 결정 트리 학습법이나 랜덤 포레스트에만 적용되는 것이 일반적이기는 하나, 그 외의 다른 방법들과 함께 사용할 수 있음
    * 운영자 답안)
        - 분산이 너무 높으면 새로운 데이터를 적합했을 때 정확도가 떨어짐.
        - Bootstrap aggregation(Bagging)은 Variance를 줄여주기 위한 목적을 가지고 있는데,
        - bootstrap을 통해 training set을 만들고 이에 대해 tree를 만듬.
        - 이때, tree들은 가지치기를 하지 않기 때문에 low bias이지만, 매우 높은 variance를 가지고 있는 모델임.  
        - 따라서 트리들을 평균내줌으로써, variance를 줄이고 성능을 개선함.


7. 랜덤포레스트에서 변수중요도는 어떻게 계산되는가?
    * 변수 중요도는 변수가 정확도(Accuracy)와 노드 불순도(Node Impurity) 개선에 얼마만큼 기여하는지로 측정
    * 이렇게 구한 변수 중요도는 다른 모델(예를 들면, 선형 회귀)에 사용할 변수를 선택하는 데 사용할 수 있음
    * 즉, 이 방법은 변수 선택 방법 중 필터 방법이다.
    * 운영자 답안)
        - Regression tree의 경우에는 전체 m개의 tree에서 predictor별로 split이 되었을 때 감소하는 RSS의 평균으로 알 수 있음. 감소하는 폭이 클 수록 중요한 predictor임.
        - Classification tree에서는 Gini index로 알 수 있으며 지니 지수의 평균 감소를 사용하여 계산하고 최대값에 대한 상대값으로 표현됨.

8. 부스팅은 무엇인가? (별 100개)
    * Bagging과 유사하게 초기 샘플 데이터를 조작하여 다수의 분류기를 생성하는 기법 중 하나
    * 일반적으로 부스팅은 약검출기(weak classifier)들을 여러 개 모아 강검출기(strong clssifier)를 생성하는 방법을 말하고 주로 의사결정나무 모형을 사용함.
    * 부스팅의 경우 전체 데이터에서 여러 샘플링 데이터를 추출하여 순차적으로 이전 학습 분류기의 결과를 토대로 다음 학습 데이터의 샘플 가중치를 조정하면서 학습을 진행
    * 부스팅의 가장 큰 특징은 다음 단계의 weak classifier가 이전 단계의 weak classifier의 영향을 받는다는 점임. 
        - 즉, 이전의 classifier의 양상을 보고 보다 잘 맞출 수 있는 방향으로 다음 단계를 진행하고 각 classifier의 weight를 업데이트 함.
        - 최종적으로 서로 영향을 받아 만들어진 여러 weak classifier와 서로 다른 weight를 통해 strong classifier를 생성하게 됨.
    * 일반적인 분류 문제는 잘못 분류된 개체들을 더 잘 분류하는 것이 목적이므로 부스팅은 잘못 분류된 개체들에 집중하여 새로운 분류 규칙을 만드는 것을 목적으로 함.
        - 즉, 배깅이 일반적인 모델을 만드는데 집중되어 있다면, 부스팅은 맞추기 어려운 문제를 맞추는데 초점이 맞춰져 있음
    * 운영자 답안)
        - Boosting은 약한 모델(Weak leaner)를 결합해서 정확하고 강력한 모델(Strong Learner)를 만드는데 목적이 있음.
        - 잘못 분류된 개체들에 집중하여 새로운 분류규칙을 만드는 단계를 반복하는 방법인데, 다음 모델을 적합할때 바로 원래의 data set Y에 적합을 하는 것이 아니라, 현재 모델이 잡지 못한, 현재모델과 Y와의 차이인 residual에 적합을 함.


9.  배깅, 랜덤포레스트, 부스팅의 차이를 다시한번 정리해보자 (별 100개)
    * 랜댐포레스트
        - 의사결정나무를 여러 개 모아 놓으면(Decision Tree 여러개) 숲이 되는데, 이 숲을 구성하는 방법을 random으로 함
        - 나무마다 독립변수가 다르게 들어갈 수 있도록 그 수를(독립변수 사용 개수)를 제한 시키는 것
        - 이 때, 배깅 기법을 사용함
    * 배깅
        - 배깅은 원 표본에서 중복을 허용하여 표본을 추출(복원 추출)
        - (학습) 데이터셋을 여러 개 만들 수 있는데 데이터가 각 셋마다 다르다.
    * 부스팅
        - Train 데이터 중, 일부를 랜덤으로 추출하여 모델을 만든다. 이 모델의 정확도를 측정한다. 
        - 여기서 에러가 난 데이터들을 찾고, 이 데이터들에게 가중치를 더 준 상태에서 다음 번 모델을 만들 데이터들을 랜덤으로 추출한다. 
        - 이 과정에 가중치가 큰 데이터(기존에 에러 났던 데이터)가 들어올 확률이 높다. 
        - 이렇게 다시 모델을 만들고, 전체 Train 데이터 셋을 통해 다시 정확도를 측정한다.(Sequential하게 모델을 만들어간다.)
        - 해당 과정을 반복하여 완벽한 모델을 만들도록 하는게 부스팅
    * 운영자 답안)
        - 배깅) 
            - bootstrap을 통해 training data set을 여러개 생성한 후 각각의 data set을 이용해 각각의 tree를 만들고 나중에 모두 한꺼번에 합하는 방식임 (모델 5개를 만들면 단순 평균내서 하나의 결과를 도출함.)
        - 부스팅)
            - 약한모델을 순차적으로 학습시키며 학습이 끝나면 나온 결과에 따라 가중치가 재분배되는데 모델 5개를 만들면, 모델1이 학습하고 1에서 잘못 학습한 부분을 2가 제대로 학습하고 2가 잘못 학습한것을 3이 제대로 학습해서 5까지 간 다음에 각 5개의 모델에 다른 가중치를 줘서 합하는 방식임.
        - 랜덤포레스트)
            - 기존 의사결정나무에 배깅의 개념, 임의 선택(random selection)을 더한 앙상블 기법임.