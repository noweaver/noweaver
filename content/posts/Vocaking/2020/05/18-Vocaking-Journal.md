---
date: 2020-05-18
title: 데이터베이스에 단어 입력
categories: [기록]
tags: [영어, 단어, Vocaking]
draft: true
---

conda install -y -c conda-forge sqlalchemy

postgresql 과 sqlarchemy 접속 테스트

import sqlalchemy
from sqlalchemy import create_engine

print(f'{sqlalchemy.__version__}')

