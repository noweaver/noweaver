---
date: 2019-04-24
title: Pandas Tips
tags: ["데이터 분석 환경", Pandas]
categories: [기록]
---

# 쉘 실행시, 경고메시지 제거

```python
import warnings
warnings.filterwarnings('ignore')
# warnings.filterwarnings(action='once')
```

# Pandas Display 옵션

```python
pd.set_option('display.notebook_repr_html', True)
pd.set_option('display.max_column', 100)
pd.set_option('display.max_rows', 10)
pd.set_option('display.width', 60)
```