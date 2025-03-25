---
layout: post
title: SQL 문제 풀이
nav_order: 1
has_child: true
---

## 취지

SQL 테스트를 위한 기본 문법 사용 및 함수를 익히고자 함.

## 기본 문법

일반적으로 SELECT가 압도적으로 많이 사용된다.

간혹, 데이터 업데이트를 위한 UPDATE문

삭제를 위한 DELETE문이 사용된다.

```sql
-- SELECT
SELECT * FROM 테이블 이름

-- UPDATE
UPDATE 테이블 이름 SET 칼럼=변경값 WHERE 조건

-- DELETE
DELETE FROM 테이블 이름 WHERE 조건

-- DROP
DROP TABLE 테이블이름
```

## 사용 함수

주로 사용되는 함수가 있다.

- count(칼럼) : 해당 칼럼의 수를 센다. 데이터의 수를 계산하는데 사용되며, group by와 같이 사용되기도 한다.
- distinct(칼럼) : 해당 칼럼에 해당되는 중복 값을 제외한다.
  - ex) name : hello, hello => distinct(name) = hello
- year(), month(), day() : date 형식으로 지정된 컬럼의 데이터에서 특정 값만 가져올 수 있다.
  - ex) year('2023-10-23') = 2023
- substring(문자열, 시작위치, 길이) : 문자열데이터에서 원하는 값을 가져오는 함수이다. 문자열 대신에 칼럼을 넣을 수 있다. 시작위치는 인덱스가 아니다. 길이를 생략하면 끝까지 추출한다.
  - ex) substring('hello', 1) = hello
  - ex) substring('hello', 2,3) = ell
  - ex) substring('hello', -1) = o
