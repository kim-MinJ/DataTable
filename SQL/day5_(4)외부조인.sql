-- 지금까지 했던 join 은 아래와 같이 tc.CUSTOMER_ID=tb.CUSTOMER_ID 행만
-- 컬럼을 합치는 '동등 조인'
SELECT tc.customer_id, tc.name, tb.buy_date
from tbl_customer# TC --4개 행
JOIN TBL_BUY TB --8개 행
ON TC.CUSTOMER_ID = TB.CUSTOMER_ID;

-- 예시로 고객'WONDER'는 구매가 없으므로 TBL_BUY에 없어요.
-- 이럴 때 TBL_BUY 는 NULL 상태로 합치는 것이 외부 조인(LEFT OUTER JOIN 또는 RIGHT OUTER JOIN)
SELECT *   --tc.customer_id, tc.name, tb.buy_date
from tbl_customer# TC 
LEFT JOIN TBL_BUY TB  -- LEFT  에 있는 테이블(대체로 부모 테이블)의 모든 행을 포함. 부모테이블이 아니므로 동등조인 결과
ON TC.CUSTOMER_ID = TB.CUSTOMER_ID;

SELECT *   --tc.customer_id, tc.name, tb.buy_date
from tbl_customer# TC 
RIGHT JOIN TBL_BUY TB  -- RIGHT 에 있는 테이블(대체로 부모 테이블)의 모든 행을 포함. (WONDER 없음)
ON TC.CUSTOMER_ID = TB.CUSTOMER_ID;

SELECT *   --tc.customer_id, tc.name, tb.buy_date
from TBL_BUY TB 
RIGHT JOIN tbl_customer# TC  -- RIGHT 에 있는 테이블(대체로 부모 테이블)의 모든 행을 포함.
ON TC.CUSTOMER_ID = TB.CUSTOMER_ID;

-- 구매 건수가 없는 고객을 조회하기.
SELECT *
FROM TBL_CUSTOMER# TC
LEFT JOIN TBL_BUY TB
ON TC.CUSTOMER_ID = TB.CUSTOMER_ID
WHERE TB.BUY_SEQ IS NULL;  
-- ✅ 외부 조인일 때에는 추가 조건은 WHERE 로 합니다. 외부 조인 후에 실행하도록 하기 위함.

-- 문제 요구사항이 구매 이력이 있는 모든 고객을 조회하기
-- 이럴 때는 조건만 WHERE TB.BUY_SEQ IS NOT NULL;
-- 더 간단한 조회는 JOIN 없이 구매 이력이 있는 고객 찾기
SELECT DISTINCT CUSTOMER_ID
FROM TBL_BUY;