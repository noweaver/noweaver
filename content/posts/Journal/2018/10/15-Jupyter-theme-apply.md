---
date: 2018-10-15
title: 주피터 테마 적용
tags: ["데이터 분석 환경", Python, Jupyter, 설치]
categories: [기록]
---

오랫동안 개발 툴을 사용하면 생산성을 위해서 손에 익히는 데 상당히 시간을 썼다. 그런데, UI/UX 훌륭하지 않으면 조금 거리를 두게 되는 경향이 있다. 사실 노트북 스타일 보다는 PyCharm 을 쓰고 싶은데 많은 분석가들이 Jupyter Notebook 을 사용하는 것 같더라. 나도 좀 쓰다가 말다가 했는데, 이번에 본격적으로 쓰기 시작하면서 여러 가지 문제를 발견했다. 그 중 하나 테마 적용 시, 출력 값이 짤리더라. 이유인즉 CSS 적용 상 버그 같다. 왜 안 고치는지 모르겠으나 이슈 리포트를 보고 적용해보니 쓸만할 정도가 되어 기록으로 남긴다.

참고: [공식 사이트](https://github.com/dunovank/jupyter-themes/blob/master/README.md)

## Jupyter Theme 설치

```
$ source activate jupyter-env
(jupyter-env) $ 

// install jupyterthemes
(jupyter-env) $ pip install jupyterthemes

// upgrade to latest version
(jupyter-env) $ pip install --upgrade jupyterthemes

// 주피터 테마 리스트 확인
(jupyter-env) $ jt -l
```

## Jupyter Theme 적용

| 옵션 | 값 | 설명 |
|:---|:---|:---|
| -f | bitstream | Bitstream Vera Sans Mono 폰트 설정 |
| -fs | 10 | 폰트 사이즈 10 설정 |
| -ofs | 10 | 출력 폰트 크기 10 설정 |
| -dfs | 10 | Pandas 결과 폰트 크기 10 설정 |
| -tf | bitsteam | 출력 폰트 Bitstream Vera Sans Mono 폰트 설정 |
| -cellw | 88% | 셀의 가로 길이 |
| -lineh | 130 | 셀의 높이 |
| -T | - | 툴바 보이기 |
| -N | - | 노트북 이름 보이기 |


```
// 아래와 같이 테마 적용
(jupyter-env) $ jt -t grade3 -f bitstream -fs 10 -ofs 10 -dfs 10 -tf bitstream -tfs 11 -nfs 115 -cellw 88% -lineh 150 -T -N -kl


// output_area 검색해서 padding: 13px; 추가 후, 브라우저 새로고침해서 확인
(jupyter-env) $ vi ${HOME}/.jupyter/custome/custom.css
div.output_area {
 display: -webkit-box;
 padding: 13px;
}
```

브라우저 새로고침 이후 적용이 안 되면, Jupyter 를 재시작 하니까 됐다. 실제, Jupyter Custom 의 경우 적용이 되는 시점은 알겠는데, 어느 시점에 원복이 되버렸다. 이유는 모르겠으나 분명 순서가 있는 것 같다. 
