---
date: 2020-05-20
title: PostgreSQL, 필드 패스워드 형태로 만들기
categories: [기록]
tags: [PostgreSQL]
draft: false
---

# SuperUser 권한 주기

```zsh
$ sudo su - postgres
$ psql
postgres=# alter user vkadmin with superuser;
postgres=# create extension pgcrypto
```

# Create Table

```sql
create table if not exists crypto_tb (
      no        serial      primary key
    , id        varchar     not null
    , pw        varchar     not null
);
```

# Insert

```sql
insert into crypto_tb (id, pw) values ('TEST1', crypt('test1234', gen_salt('des')));
insert into crypto_tb (id, pw) values ('TEST2', crypt('test1234', gen_salt('des')));
```

# Select

```sql
select * from crypto_tb;
select * from crypto_tb where pw = crypt('test1234', pw);
```

# Update

```sql
update crypto_tb set pw = crypt('qwer12345', gen_salt('des')) where no = 3;
```