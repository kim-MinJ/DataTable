CREATE SEQUENCE seq_tblbuy
START WITH 2001;

DROP SEQUENCE seq_tblbuy;

CREATE TABLE tbl_customer#
(
    customer_id VARCHAR2(20) not NULL PRIMARY KEY,
    name VARCHAR2(20),
    email VARCHAR2(30) not NULL, 
    age NUMBER(3,0) default 0, 
    reg_date DATE default sysdate
);

CREATE TABLE tbl_product
(
    pcode VARCHAR2(20) PRIMARY KEY,
    category CHAR(2) not NULL,
    pname VARCHAR2(50),
    price number
);

CREATE TABLE tbl_buy
(
    buy_seq NUMBER NOT NULL PRIMARY KEY,
    customer_id VARCHAR2(20) NOT NULL,
    pcode VARCHAR2(20) NOT NULL,
    quantity NUMBER NOT NULL,   
    buy_date TIMESTAMP NOT NULL
);


ALTER TABLE tbl_buy
add CONSTRAINT FK_tbl_customer#_TO_tbl_buy
FOREIGN KEY (customer_id)
REFERENCES tbl_customer# (customer_id);

ALTER TABLE tbl_buy
ADD CONSTRAINT FK_tbl_product_TO_tbl_buy
FOREIGN KEY (pcode)
REFERENCES tbl_product (pcode);

COMMENT ON COLUMN tbl_customer#.reg_date IS '등록날짜';
COMMENT ON TABLE tbl_product IS '상품';
COMMENT ON COLUMN tbl_product.pcode IS '상품코드';
COMMENT ON COLUMN tbl_product.category IS '카테고리';
COMMENT ON COLUMN tbl_product.pname IS '상품명';
COMMENT ON COLUMN tbl_product.price IS '가격';
COMMENT ON TABLE tbl_buy IS '구매';
COMMENT ON COLUMN tbl_buy.buy_seq IS '구매번호';
COMMENT ON COLUMN tbl_buy.customer_id IS '고객_ID';
COMMENT ON COLUMN tbl_buy.pcode IS '상품코드';
COMMENT ON COLUMN tbl_buy.quantity IS '구매수량';
COMMENT ON COLUMN tbl_buy.buy_date IS '구매날짜';

INSERT INTO TBL_CUSTOMER# (CUSTOMER_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012',  '김미나',  'kimm@gmail.com',  20,  TO_DATE('2025-03-10 14:23:25', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO TBL_CUSTOMER# (CUSTOMER_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', '홍길동', 'gil@korea.com', 32,  TO_DATE('2023-10-21 11:12:23', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO TBL_CUSTOMER# (CUSTOMER_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '박모모', 'momo@daum.net', 29,  TO_DATE('2024-12-25 19:23:45', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO TBL_CUSTOMER# (CUSTOMER_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '이나나', 'lee@naver.com', NULL,  TO_DATE('2024-12-31 23:58:59', 'YYYY-MM-DD HH24 MI:SS'));

INSERT INTO tbl_product (pcode, category, pname, price)
VALUES('DOWON123a', 'B2', '동원참치선물세트', 54000);
INSERT INTO tbl_product (pcode, category, pname, price)
VALUES('CJBAb12g', 'B1', '햇반 12개입', 14500);
INSERT INTO tbl_product (pcode, category, pname, price)
VALUES('JINRMn5', 'B1', '진라면 5개입', 6350);
INSERT INTO tbl_product (pcode, category, pname, price)
VALUES('APLE5kg', 'A1', '청송사과 5kg', 66000);
INSERT INTO tbl_product (pcode, category, pname, price)
VALUES ('MANGOTK4r', 'A2', '애플망고 1kg', 32000);

INSERT INTO tbl_buy (buy_seq, customer_id, pcode, quantity, buy_date)
VALUES(SEQ_TBLBUY.nextval, 'mina012' , 'CJBAb12g' , 5,TO_DATE('2024-07-15 14:33:15', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO tbl_buy (buy_seq, customer_id, pcode, quantity, buy_date)
VALUES(SEQ_TBLBUY.nextval, 'mina012' , 'APLE5kg' , 2,TO_DATE('2024-11-10 14:33:15', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO tbl_buy (buy_seq, customer_id, pcode, quantity, buy_date)
VALUES(SEQ_TBLBUY.nextval, 'mina012' , 'JINRMn5' , 2,TO_DATE('2025-02-09 14:33:15', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO tbl_buy (buy_seq, customer_id, pcode, quantity, buy_date)
VALUES(SEQ_TBLBUY.nextval, 'twice' , 'JINRMn5' , 3,TO_DATE('2023-12-21 14:33:15', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO tbl_buy (buy_seq, customer_id, pcode, quantity, buy_date)
VALUES(SEQ_TBLBUY.nextval, 'twice' , 'MANGOTK4r' , 2,TO_DATE('2025-01-10 14:33:15', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO tbl_buy (buy_seq, customer_id, pcode, quantity, buy_date)
VALUES(SEQ_TBLBUY.nextval, 'hongGD' , 'DOWON123a' , 1,TO_DATE('2025-01-13 14:33:15', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO tbl_buy (buy_seq, customer_id, pcode, quantity, buy_date)
VALUES(SEQ_TBLBUY.nextval, 'hongGD' , 'APLE5kg' , 1,TO_DATE('2024-09-09 14:33:15', 'YYYY-MM-DD HH24 MI:SS'));
INSERT INTO tbl_buy (buy_seq, customer_id, pcode, quantity, buy_date)
VALUES(SEQ_TBLBUY.nextval, 'hongGD' , 'DOWON123a' , 1,TO_DATE('2025-01-13 09:33:15', 'YYYY-MM-DD HH24 MI:SS'));

SELECT *
FROM TBL_CUSTOMER#;

SELECT *
FROM TBL_PRODUCT;

SELECT *
FROM TBL_BUY;


--1.  age 가 30세 이상 고객의 모든 컬럼 조회
SELECT *
FROM TBL_CUSTOMER#
WHERE age >= 30;

--2.  customer_id 'twice' 의 email 조회
SELECT email
FROM TBL_CUSTOMER#
WHERE CUSTOMER_ID = 'twice';

--3.  category 'A2' 의 pname 조회
SELECT pname
FROM TBL_PRODUCT
WHERE category = 'A2';

--4. 상품  price 의 최고값 조회
SELECT max(price)
FROM TBL_PRODUCT;

--5.  'JINRMn5' 총 구매수량 조회
SELECT sum(quantity)
FROM tbl_buy
where pcode = 'JINRMn5';

-- 문제 추가 : pcode 별로 수량합계가 가장 높은 순서대로 rank 구하기
--step 1
SELECT  pcode, sum(QUANTITY)
FROM TBL_BUY
GROUP BY PCODE;

--step 2
SELECT  pcode, sum(QUANTITY), rank() over(order by sum(QUANTITY) desc) as "rnk" -- rank 구하는 값이 sum() 함수 결과값.
FROM TBL_BUY
GROUP BY PCODE;

--6.  customer_id 'mina012' 이 구매한 내용 조회
SELECT pname
FROM TBL_PRODUCT tp
JOIN TBL_BUY tb
ON tp.pcode = tb.PCODE and tb.CUSTOMER_ID = 'mina012';

--7. 구매 상품 중  pcode 가 '0'이 포함된 것 조회
SELECT *
FROM TBL_BUY
WHERE PCODE LIKE  '%0%';

--8. 구매 상품 중  pcode 에 'on'을 포함하는 것 조회(대소문자 구분없는 조회)
SELECT *
FROM TBL_BUY
WHERE LOWER(PCODE) LIKE '%ON%';

--9. 2024년에 상품을 구매한 고객ID, 이름, 구매날짜 조회
SELECT tc.CUSTOMER_ID, tc.name, tb.buy_date
FROM TBL_CUSTOMER# tc
JOIN TBL_BUY tb
on tc.CUSTOMER_ID = tb.CUSTOMER_ID
AND TO_CHAR (tb.BUY_DATE, 'YYYY') = '2024';

-- 문제 추가
-- 1) 년도별 구매 건수 집계하기
SELECT extract(year from buy_date) as "년도", count(*)
FROM TBL_BUY tb
GROUP BY EXTRACT(year from BUY_DATE)
ORDER BY "년도";

-- 2) 년도별 and pcode 상품별 구매 건수 집계하기
SELECT extract(year from buy_date) as "년도", pcode, count(*) as "년도/상품건수"
FROM TBL_BUY tb
GROUP BY EXTRACT(year from BUY_DATE), PCODE
ORDER BY "년도", PCODE;

--10. twice 가 구매한 상품과 가격, 구매금액을 조회하세요.
-- 단, 구매금액 계산은 가격 * 구매 수량 수식으로 합니다.
SELECT tp.pcode, tp.pname, tp.price, (tp.PRICE * tb.quantity) as "구매금액"
FROM TBL_PRODUCT tp
join TBL_BUY tb
on tp.PCODE = tb.PCODE
and tb.CUSTOMER_ID='twice';

COMMIT;

-- 구매 행(건수) 중에서 구매 금액이 가장 높은 것을 찾아보자. 10번 문제에 customer_id 칼럼 추가 조회
-- 오라클 FETCH 명령이 있습니다. (12c 버전 이상)
-- fetch 는 결과 행 집합을 커서로 접근 할 수 있습니다.(first, last 등...)
SELECT tp.pcode, tp.pname, tp.price, (tp.PRICE * tb.quantity) as "구매금액"
FROM TBL_PRODUCT tp
join TBL_BUY tb
on tp.PCODE = tb.PCODE
order by "구매금액" desc -- 정렬 필수
FETCH first 1 rows only;

