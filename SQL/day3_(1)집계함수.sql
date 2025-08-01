/*
  집계(통계) 함수 : count, sum, avg, max, min, 표준편차, 분산, 
                            데이블의 컬럼을 대상으로 실행되는 함수
                            🔥 tbl_car_co2 테이블에서는 합계, 평균, 최대, 최소값은 number
                            volume, weight, co2 을 대상으로 테스트 할 수 있습니다.
  집계 함수를 사용할 때, 다른 컬럼을 조회할 수 없습니다. -> 그룹화가 필요합니다.
*/
-- 1. count 함수
-- 1) 데이터의 전체 갯수 : count 함수는 컬럼지정 대신 *
SELECT COUNT(*) as "전체갯수"
FROM tbl_car_co2;

-- 2) count(weight) 로 컬럼을 지정하면 null 이 아닌 값만 카운트 합니다.
UPDATE TBL_CAR_CO2 
set WEIGHT = null
WHERE MODEL = 'Up!';  -- 테스트를 위해 null 값으로 변경

SELECT COUNT(WEIGHT) as "NULL 제외 갯수"
FROM tbl_car_co2;
-- 3) count(distinct car) : 컬럼 값 중복 제거
SELECT distinct car
FROM TBL_CAR_CO2;

SELECT COUNT(DISTINCT CAR) as "중복 제거 갯수"
FROM tbl_car_co2;

-- where 조건으로 갯수 구하기        as ""는 별칭붙이기
SELECT COUNT(*) as "브랜드 갯수"
FROM TBL_CAR_CO2
WHERE car = 'Ford';

SELECT COUNT(*)
FROM TBL_CAR_CO2
WHERE WEIGHT < 1000;

-- 오류 : 그룹화 해야함.
SELECT car, COUNT(*) as "브랜드 갯수"
FROM TBL_CAR_CO2
WHERE car = 'Ford';

-- 2. avg 함수 (평균 구하기)
-- 1) CO2 평균 (NULL 제외 평균 구함.)
SELECT AVG(co2)
FROM TBL_CAR_CO2;
-- 널 값이 있는 weight 컬럼 : 나누기 9 => sum()/count(weight)
SELECT AVG(WEIGHT)
FROM TBL_CAR_CO2;  --1126.4

-- 2) 평균을 null 값은 0으로 바꾸기 : 나누기 10 => sum()/count(*)
SELECT WEIGHT
FROM TBL_CAR_CO2;

SELECT NVL(WEIGHT, 0)
FROM TBL_CAR_CO2;

SELECT AVG(NVL(WEIGHT, 0))
FROM TBL_CAR_CO2;  -- 1024

SELECT ROUND(AVG(WEIGHT), 0)
FROM TBL_CAR_CO2;

SELECT avg(co2),avg(WEIGHT)
FROM TBL_CAR_CO2;

-- 참고 : 함수에 조건식 적용하기

SELECT COUNT(*)
FROM TBL_CAR_CO2
WHERE WEIGHT < 1000;

SELECT COUNT(*)
FROM TBL_CAR_CO2
WHERE WEIGHT >= 1000;

-- 위의 2개의 select 를 대체하는 방식
SELECT
avg(case when weight >= 1000 then weight end),  -- when 조건식 then 값
avg(case when weight < 1000 then weight end)
FROM TBL_CAR_CO2;

-- 3. sum, min, max 테스트
-- sum(합계)
SELECT SUM(WEIGHT)
FROM TBL_CAR_CO2;
-- min (최솟값)
SELECT MIN(WEIGHT)
FROM TBL_CAR_CO2;
-- max (최댓값)
SELECT MAX(WEIGHT)
FROM TBL_CAR_CO2;