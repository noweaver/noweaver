---
date: 2019-08-04
title: An Introduiction to Statistical Learning - 7주차
tags: [ISLR]
categories: [공부]
draft: false
---

## 7주차 커리큘럼

### Day 1

* Ch9: Support Vector Machines
    - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/svm.pdf), [복사본](/data-science/ISLR/svm.pdf)
    - 교재: Ch 9.1 Maximal Margin Classifier
    - [Maximal Margin Classifier (11:35)](https://www.youtube.com/watch?v=QpbynqiTCsY&list=PL5-da3qGB5IDl6MkmovVdZwyYOhpCxo5o)


### Day 2

* Ch9: Support Vector Machines
    - 교재: Ch 9.2 Support Vector Classifiers
    - [Support Vector Classifier (8:04)](https://www.youtube.com/watch?v=xKsTsGE7KpI&list=PL5-da3qGB5IDl6MkmovVdZwyYOhpCxo5o)

### Day 3

* Ch9: Support Vector Machines
    - 교재: Ch 9.3 Support Vector Machines
    - [Kernels and Support Vector Machines (15:04)](https://www.youtube.com/watch?v=dm32QvCW7wE&list=PL5-da3qGB5IDl6MkmovVdZwyYOhpCxo5o)


### Day 4 ~ 5

* Ch9: Support Vector Machines
    - 교재: 
        - Ch 9.4 SVMs with More than Two Classes
        - Ch 9.5 Relationship to Logistic Regression
    - [Example and Comparison with Logistic Regression (14:47)](https://www.youtube.com/watch?v=mI18GD4_ysE&list=PL5-da3qGB5IDl6MkmovVdZwyYOhpCxo5o)


### Day 6

1. 초평면은 무엇인가?
    * SVM은 비선형 형태의 데이터에 대해서는 적용할 수 없는 단점이 있다.
    * 선형 경계로 구별하는 방법으로 최대 마진 분류기를 사용하는데, 선형 경계로 사용하는 선을 초평면(Hyperlane)이라고 한다.
    * 데이터가 n차원이라면 초평면은 n-1차원을 가진다.
    * 운영자 답안)
        - SVM 은 보통 범주 값을 유사한 데이터들로 그룹짓기 위해 초평면(hyperplane )이라는 경계를 사용함. hyperplane은 p차원 공간에서 초평면은 차원이 p-1인 평평한 부분공간을 의미하는 것이며 3차원의 경우 hyperplane은 2차원의 면이 되고, 2차원의 경우는 hyperplane은 1차원의 선이됨
2. 최대 마진 분류기는 무엇인가?
    * 일반적으로 초평면을 사용하여 데이터를 분리하게 되면, 무한개의 초평면이 존재한다.
    * 왜냐하면 주어진 초평면은 어느 관측치들과도 만나지 않으면서 아주 약간 위 또는 아래로 이동하거나 회전될 수 있기 때문이다. 
    * 따라서 분리 초평면을 기반으로 분류기를 구성하기 위해서는 무한개의 가능한 분리 초평면 중 어느 것을 사용할 지 결정해야 하는데, 이때 최대마진 분류기를 사용한다.
    * 운영자 답안)
        - 초평면을 사용하여 데이터를 분리 할 경우, 무한개의 초평면이 존재함. 따라서 무한개의 가능한 분리 초평면 중 어느것을 사용할지 결정해야 함.
        - 이때 훈련 관측치 들로 부터 가장 멀리 떨어진 분리 초평면인 최대 마진 초평면을 선택함. 각각의 훈련 관측치에서 주어진 초평면까지의 수직거리를 계산하고 이값에 따라 최적의 초평면을 선택함. 이때 계산되는 관측치들에서 초평면까지의 가장 짧은 거리를 마진이라고 함.
        - 최적 마진 초평면은 분리 초평면으로 부터 마진이 가장 큰  선형 결정결계를 찾는 분류기임.
3. 서포트 벡터 머신 (SVM)은 무엇이며 어떠한 특징을 갖고 있는가?
    * 다양한 데이터 분포에서도 잘 작동하는 분류기법 중 최상의 기법이다.
    * 정확도 측면에서 다른 분류깁법들 보다 우수한 결과를 가져오기 때문.
    * 하지만, 의사결정나무처럼 직관적인 해석이 불가능
        - 어떤 이유로 데이터가 분류 되었는지 알 수 없음
        - 결과해석 있어서 의사결정나무가 자주 사용하지만, 높은 정확도를 위해서 SVM을 사용
    * 운영자 답안)
        - 이 [링크](https://docs.google.com/document/d/1c7p9v_8UHqZwmgxbkSLpM26X9vR5DEZE6cJfIJjXOj4/edit?usp=sharing)를 참고해주세요  
4. SVM 이진분류 (class 2개)를 다중분류로 확장한다고 할때 어떠한 방식으로 확장 할수있는가? 해당 방식들은 어떠한 특징을 갖고있는가?
    * 기본적으로 svm은 이진 분류기이다. 이진분류법을 확장해서 멀티클래스 분류를 하는 방법이 있는데 대표적으로 one vs one approach 그리고 one vs rest approach 방법을 사용
    * one vs rest
        - 전체 class의 수가 M개 라고 하면 i 번째 class의 부류 와 i클래스를 제외한 나머지 M-1개의 클래스가 속하는 클래스 로 이진화 시키고 분류기를 만들고, 이와 같은 작업을 M번 만큼 한다. 그러면 총 M 개의 이진분류기가 만들어 지게 된다.  즉 i class에 속하는 샘플을 +1 라벨을 붙이고 나머지 샘플에 -1라벨을 붙인다. 그래서 훈련집합(training set)을 만들게 된다.  
        - svm의 결정 초평면도 M개가 만들어 지는데 j  번째 초평면을 d(j)라 할 수 있다. 
        - 실제 Test를 할때에는 M개의 초평면에 모두 test를 하게 되는데 m번의 분류에서 1가지만 양수를 출력하고 나머지는 모두 음수를 출력한다면 문제될것이 전혀 없지만, 항상 그렇게 된다는 보장은 없다 .
        - 따라서, m번의 test중 가장 큰 d(j)를 갖는것을 예측된 class로 한다. 
        - 단점) 
            이 방법은 크게 2가지 문제를 가지고 있다. 첫번째로, 초평평값 d(j)의 크기를 단순 비교해서 값을 찾는다는것이 비합리적일 수 있다. 두번째로는 이진 분류기의 훈련집합이 불균형을 이룬다는 것이다. (1 : m-1)
    * one vs one
        - m개의 클래스 중 2개를 선택하여 2클래스에 대한 결정 초평면을 만든다. 그렇게 되면 결정초평면과 분류기는 mC2개만큼 생기게 된다. M(M-1)/2 개 된다. 
        - 이제 test 할때는 투표개념을 도입하여 분류하는데 새로들어온 sample x에 대해서 초평면 dij(x)가 x를 class i로 분류하면 class i에 +1점, j로 분류하면 class j에 +1 점을 준다. 즉 mC2개의 분류기가 M개의 class에 대해서 투표를 하는 것이다.
        - 이렇게 모든 초평면에 대해서 분류하였을때 가장 높은 점수를 획득한 class가 predicted된 클래스이다. 
        - 이때 얻을 수 있는 최대 표값은 M-1개 이고 이방법은 one vs rest가 가지고 있는 문제를 가지진 않는다. 
        - 단점) 
            클래스의 개수 M이 커지면 이진 분류기의 수가 많아지고 결국 learning 과 test에 걸리는 시간이 많아진다.
    * 운영자 답안)
        1. OVO (One vs One)
            - 한쌍의 클래스로 비교하기때문에 모든 숫자 쌍에 대해 구분하여 훈련을 시킴. 0과 1, 0과 2, 1과 2 처럼 모든 숫자에 대해 쌍을 만듬. 가장 큰 장점은 각각의 분류기를 구분하고자 하는 두개의 클래스를 위해 학습데이터의 부분에 대해서만 학습하면 됨. Class 수가 적을때 적절함.
        2. OVA (One vs ALL)
           - 하나를 나머지의 클래스와 비교함. n개의 클래스로 분류할수 있는 시스템을 생성하는 방법 중 하나는 n개의 바이너리 분류기를 각 숫자에 대해 하나씩 훈련시킴. Class수가 많을때 적절함.
