-- tbl_buy와 tbl_customer, tbl_buy와 tbl_product 각각 참조관계일 때
-- 3개의 테이블 join 가능합니다.

SELECT tb.buy_seq, tc.customer_id, tc.name, tp.pcode, tp.pname, tp.price *tb.quantity as "구매금액"
FROM TBL_BUY tb
join TBL_CUSTOMER# tc on tb.CUSTOMER_ID = tc.CUSTOMER_ID
join tbl_product tp on tb.pcode = tp.pcode;

-- 3개 이상의 조인은 쿼리 성능을 떨어뜨릴 수 있습니다.
-- 대부분은 2개 테이블의 조인으로 요구사항을 처리할 수 있습니다.


SELECT *
from tbl_buy tb  --자식테이블을 from 뒤에 작성하기
join tbl_customer# tc ON tb.CUSTOMER_ID = tc.CUSTOMER_ID
join TBL_PRODUCT tp ON tb.PCODE = tp.PCODE;