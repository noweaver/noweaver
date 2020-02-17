---
date: 2020-01-27
title: 윈도우 10 정품인증
tags: ["Windows 10"]
categories: [잡동사니]
draft: false
---

`윈도우 7` 사용하다 서비스 종료됨에 따라서 `윈도우 10` 사용하게 되었는데, 나는 맥에서 Parallels 를 사용하여 윈도우를 사용하다 보니 Parallels가 자동으로 `Windows10 Home`을 설치해 주었다. 하지만 정품인증이 되지 않아 몇 가지 제약이 있어, 구글 검색을 통해 해결하고 기록을 해둔다. (정확하게 어떤 원리인지 모르겠다.)

정품 인증이 되었는지 확인하기 위해서 검색창에서 영문판은 `Windows is activated`으로 한글판은 `Windows 정품` 검색하고 실행한다.

![Windows10-1](/2020/01-27/Windows10-1.png)

아래 그림처럼 정품인증이 되었다면 더 이상 진행하지 않아도 된다. 그리고 나는 `Windows 10 Home`의 라이선스 정보다. 

![Windows10-2](/2020/01-27/Windows10-2.png)

`CMD`를 실행하고 아래를 차례대로 실행한다.

```powershell
C:\Windows\system32> slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
C:\Windows\system32> slmgr /skms kms.digiboy.ir
C:\Windows\system32> slmgr /ato
```






