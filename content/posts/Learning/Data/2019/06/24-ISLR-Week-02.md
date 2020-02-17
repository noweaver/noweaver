---
date: 2019-06-24
title: An Introduiction to Statistical Learning - 2주차
tags: [ISLR]
categories: [공부]
draft: false
---

## 2주차 커리큘럼

### Day 1

* Ch4. Classification: 4.1 ~ 4.2
  - 슬라이드: [원본](https://lagunita.stanford.edu/c4x/HumanitiesScience/StatLearning/asset/classification.pdf), [복사본](/data-science/ISLR/classification.pdf)
  - 영문: 127 ~ 130p / 국문: 147 ~151p
  - [Introduction to Classification (10:25)](https://www.youtube.com/watch?v=sqq21-VIa1c&list=PL5-da3qGB5IC4vaDba5ClatUmFppXLAhE)
 
### Day 2

* Ch4. Classification: 4.3
  - 영문: 130 ~ 137p / 국문: 151 ~159p
  - [Logistic Regression and Maximum Likelihood (9:07)](https://www.youtube.com/watch?v=31Q5FGRnxt4&list=PL5-da3qGB5IC4vaDba5ClatUmFppXLAhE)
  - [Multivariate Logistic Regression and Confounding (9:53)](https://www.youtube.com/watch?v=MpX8rVv_u4E&list=PL5-da3qGB5IC4vaDba5ClatUmFppXLAhE)
  - [Case-Control Sampling and Multiclass Logistic Regression (7:28)](https://www.youtube.com/watch?v=GavRXXEHGqU&list=PL5-da3qGB5IC4vaDba5ClatUmFppXLAhE)

### Day 3

* Ch4. Classification: 4.4.1, 4.4.2
  - 영문: 138~ 141 / 국문: 159 ~ 164p
  - [Linear Discriminant Analysis and Bayes Theorem (7:12)](https://www.youtube.com/watch?v=RfrGiG1Hm3M&list=PL5-da3qGB5IC4vaDba5ClatUmFppXLAhE)
  - [Univariate Linear Discriminant Analysis (7:37)-4.4.2]

### Day 4

* Ch4. Classification: 4.4.3
  - 영문: 142~148p / 국문: 164 ~ 172p 
  - [Multivariate Linear Discriminant Analysis and ROC Curves (17:42](https://www.youtube.com/watch?v=X4VDZDp2vqw&list=PL5-da3qGB5IC4vaDba5ClatUmFppXLAhE)

### Day 5

* Ch4. Classification: 4.4.4 ~ 4.5
  - 영문: 149~153p / 국문: 172 ~ 178p
  - [Quadratic Discriminant Analysis and Naive Bayes (10:07)](https://www.youtube.com/watch?v=6FiNGTYAOAA&list=PL5-da3qGB5IC4vaDba5ClatUmFppXLAhE)

### Day 6

1. 회귀(regression)를 사용하지 못하는 경우는 어떤 경우이며 회귀와 분류(classification)의 차이는 무엇인가?
    * 데이터가 비선형 관계일 경우 선형 모델인 회귀는 적합하지 않음/예측하고자 하는 변수가 범주형(categorical)이며 특히 레벨이 3이상일 경우 회귀로 문제 해결이 적합하지 않음
    * 회귀는 보통 연속적인 숫자를 예측하는 문제를 해결할 때 사용 됨  
        `예) 올해 12월에는 매출이 몇 나올까? 이번 학기에는 몇점을 받을까?`
    * 분류의 경우 보통 예측해야할 변수가 범주형인 경우, 즉 class가 두가지 혹은 두가지 이상인 경우에 사용이 됨  
        `예) 받은 메일이 스팸인가 아닌가,  고객은 해지를 할것인가 아닌가`
    * 위와 같은 예 아니오 문제에 가장 많이 쓰이고있음
    * 참고
        - (로지스틱회귀분석 = 분류) 같은 개념으로 보시면됩니다.
            ![W02-HW-A1.png](/data-science/ISLR/W02-HW-A1.png)
2. 로지스틱(logistic regression) 모델에서 사용되는 odds는 무엇인가?
    * odds(오즈=공산)은 어떠한 일이 일어날 확률 (1이 될 확률)을 일어나지 않을 확률 (1-p)로 나눈 것임.
        ```
            예) 고객이 해지를 할 확률 = 0.3
            고객이 해지를 하지 않을 확률 = 0.7
            즉 이때odss 는 0.3/0.7 => 0.43
        ```
        ![W02-HW-A2.png](/data-science/ISLR/W02-HW-A2.png)
3. 신용카드 대금을 연체할 공산(odds)이 0.28인 사람 중 평균 몇 퍼센트가 실제로 연체할 것인가?
   * 21.88%
    ![W02-HW-A3.png](/data-science/ISLR/W02-HW-A3.png)
4. 통계 수업을 듣는 한 그룹의 학생들에 대한 데이터를 수집한다고 해보자. 여기서, 변수 X1 = 공부한 시간, X2 = GPA, 그리고 Y = A학점 취득을 나타낸다. 로지스틱 회귀를 적합하여 아래와 같은 결과를 얻었다.
    ![W02-HW-A4.png](/data-science/ISLR/W02-HW-Q4.png)
    1) 30시간 공부하고 GPA가 3.6인 학생이 통계수업에서 A를 받을 확률을 추정하라  
        - 0.29
        ![W02-HW-A4-a.png](/data-science/ISLR/W02-HW-A4-a.png)
    2) 1)의 학생이 통계수업에서 A를 받을 가능성이 50%가 되려면 몇시간 공부를 해야하는가?
        - 48
        ![W02-HW-A4-b.png](/data-science/ISLR/W02-HW-A4-b.png)
5. LDA와 QDA에 대해 설명하라
    * LDA(linear discriminant analysis)
        - 두 범주를 잘 구분 할수 있는 직선을 찾는 것을 목표로 하며, 두 범주의 평균이 서로 멀고 동시에 분산이 작아야 함 (normal dist의 분산-공분산의 행렬이 동일한 경우 사용)
        - 특징
            - 적은 수의 파라미터만 예측을 하면 됨. 
            - 선형의 결정 경계를 가지기 때문에 유연성이 떨어짐
            -  추정 모수가 상대적으로 적기 때문에 편향(Bias)문제, 즉 underfitting 문제 발생 가능성이 있음.   
    * QDA(quadratic discriminant analysis)
        - LDA와 유사하나, 동일한 분산을 가정하지 않으며 x가 2차 함수로 나타남 (normal dist의 분산-공분산의 행렬이 범주별로 다른경우)
        - 특징
            - 유연함
            - 많은 파라미터 예측이 필요함
            - Overfitting의 문제 발생 가능성 있음
6. 일반적으로 표본크기(sample size) n이 증가하면 QDA의 검정예측정확도(test prediction accuracy)가 LDA에 비해 개선되는가, 나빠지는가, 변함이없는가? 이유는?
    * 개선된다.
        - 일반적으로 표본사이즈가 증가하게되면, 유연한 모델이 성능이 잘나옴. 편향이 줄기 때문에 QDA가 성능이 개선될것이며 샘플사이즈가 커지게 되면 분산문제는 절충(offset) 될것임.
7. 아래의 Confusion Matrix 테이블을 보고 모델의 Accuracy, Precision, Recall, F1-score를 계산하라.
    ![W02-HW-A7.png](/data-science/ISLR/W02-HW-A7.png)

