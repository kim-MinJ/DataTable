/*
- OVER는 함수 자체는 아니며 분석 함수와 함께 쓰이는 절(Clause)
- PARTITION BY를 이용하여 OVER 절 안에서
- RANK(), ROW_NUMBER(), SUM(), AVG() 같은 함수들이 어떻게 계산될지 범위를 지정해주는 역할
-  원래 행을 유지하면서 추가 정보 표시
-  각 행에 대해 그룹 내 집계 결과를 보고 싶을 때
*/
SELECT
car,
model,
co2,
ROUND(avg(co2) OVER(ORDER BY car), 2) AS "co2평균" -- car 컬럼 정렬 후 같은 값끼리 묶어서 co2 평균 구하기
FROM tbl_car_co2;

SELECT
distinct car,
ROUND(avg(co2) OVER(ORDER BY car), 2) AS "co2평균" -- car 컬럼 정렬 후 같은 값끼리 묶어서 co2 평균 구하기
FROM tbl_car_co2;

-- OVER 는 순위(RANK 함수)를 구할 때
-- co2 기준. 값이 작은 것이 순위를 1부터

-- 1) rank() 같은 값은 같은 순위
SELECT
car,
model,
co2,
ROUND(rank() OVER(ORDER BY co2), 2) AS "co2순위" -- co2로 정렬(내림차순) 후에 순위를 매기기
FROM tbl_car_co2;

-- 2) row_number() 같은 값도 다른 순위(임의)
SELECT
car,
model,
co2,
ROUND(row_number() OVER(ORDER BY co2), 2) AS "co2순위" -- co2로 정렬(내림차순) 후에 순위를 매기기
FROM tbl_car_co2;

-- 3) rank() : 특정 컬럼(car) 그룹안에서 순위
SELECT
car,
model,
co2,
ROUND(rank() OVER(PARTITION BY car ORDER BY co2), 2) AS "co2rank" -- co2로 정렬(내림차순) 후에 순위를 매기기
FROM tbl_car_co2;

-- rank 결과에 조건을 이용한 검색을 하려면 서브쿼리 사용
-- select 안에서 from 또는 where 에서 사용되는 다른 select
-- 요구사항 : 동일한 car 그룹안에서 co2가 제일 적은(min) 1등 모델을 조회하기
SELECT *
FROM -- 테이블명 대신에 다른 select 결과를 사용
(SELECT
car,
model,
co2,
ROUND(rank() OVER(PARTITION BY car ORDER BY co2), 2) AS "co2rank" -- "co2rank" : invalid identifier
FROM tbl_car_co2)
where "co2rank" = 1;  -- "co2rank" 컬럼 인식

-- 오류 : "co2rank" : invalid identifier
SELECT
car,
model,
co2,
ROUND(rank() OVER(PARTITION BY car ORDER BY co2), 2) AS "co2rank" -- "co2rank" : invalid identifier
FROM tbl_car_co2
where "co2rank" = 1;  -- 새로 생긴 rank 컬럼은 여기 where에 바로 사용 못함.

-- 요구사항 : 동일한 car 그룹안에서 co2가 제일 많은(max) 1등 모델을 조회하기SELECT *
SELECT *
FROM
(SELECT
car,
model,
co2,
ROUND(rank() OVER(PARTITION BY car ORDER BY co2 desc), 2) AS "co2rank" -- "co2rank" : invalid identifier
FROM tbl_car_co2)
where "co2rank" = 1;
-- desc 는 오름 차순 : 큰 값 -> 작은 값

-- 직접 테이블에서 확인해보세요.
SELECT *
FROM TBL_CAR_CO2
order by car, model, co2 desc;   --car는 오름차순, 같은 car 값 행은 co2 내림차순 정렬


SELECT
car,
model,
co2,
WEIGHT,
ROUND(rank() OVER(ORDER BY co2, WEIGHT), 2) AS "co2순위 같으면 weight값 rank"
FROM tbl_car_co2;