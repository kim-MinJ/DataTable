-- 조인 : 테이블의 컬럼을 합치는 작업
-- 행연산 : 행단위를 대상으로 하는 작업
-- UNION(합집합), INTERSECT(교집합), MINUS(차집합)

-- 데이터의 특징 : 'wonder' 고객은 tbl_buy 에 없음.
-- 합집합 : 4개나옴
SELECT CUSTOMER_ID
FROM TBL_CUSTOMER#
UNION
SELECT CUSTOMER_ID  -- 자동으로 중복 제거하고 연산
FROM TBL_BUY;

-- 교집합 : 3개나옴
SELECT CUSTOMER_ID
FROM TBL_CUSTOMER#
INTERSECT
SELECT CUSTOMER_ID  
FROM TBL_BUY;

-- 차집합 : 1개나옴
SELECT CUSTOMER_ID
FROM TBL_CUSTOMER#
MINUS
SELECT CUSTOMER_ID
FROM TBL_BUY;