package mybatis.mapper;

import java.util.List;
import java.util.Map;

public class BuyMapperTest {

        public static void main(String[] args) {
                BuyMapperDao dao = new BuyMapperDao();
                String cutomerId = "hongGD"; // mina012, twice, hongGD, wonder
                System.out.println(cutomerId + "고객 구매 내역 집계 : " + dao.saleByCustomer(cutomerId));
                // 리턴 타입이 Map
                String year = "2024";
                Map<String, Integer> result = dao.countByYear(year);
                System.out.println(year + "년도 구매 건수 : " + dao.countByYear(year));
                // 2024 년도 구매 건수 : {YEAR=2024, COUNT=3} :
                // year 는 key, 2024는 값(value), count는 key, 3은 값
                System.out.println(result.get("YEAR"));
                System.out.println(result.get("COUNT"));

                System.out.println("-- 년도별 구매 건수 --");
                // Map 에서는 오라클 타입 number 의 자리수가 없으면 값을 BigDecimal 로 가져옵니다.
                // Map 의 제너릭타입을 Integer 사용 ❌ Object 로 대체. Object 로 대체. %d, %s 포맷 문자는 사용 못함.
                List<Map<String, Object>> list = dao.allCountByYear();
                System.out.println("년도\t구매건수\t수량합계");
                for (Map<String, Object> one : list) {
                        System.out.println(one.get("YEAR") + "\t" + one.get("COUNT") + "\t\t" + one.get("SUM"));
                }

        }

        // public static void main(String[] args) {
        // BuyMapperDao dao = new BuyMapperDao();
        // String pcode = "APLE5kg"; // DOWON123a, JINRMn5 , APLE5kg ,
        // System.out.println(pcode + " 상품의 구매 내역 : " + dao.selectByPcode(pcode));
        // System.out.println(pcode + " 상품의 구매 수량 합계 : " + dao.selectSumByPcode(pcode));
        // System.out.println(" 2024 년도 상품 구매 내역 : " + dao.selectByYear("2024"));
        // // 내방식은 int 값이라 2024( "" 안씀)
        // String cutomerId = "mina012"; // mina012, twice, hongGD
        // cutomerId = "wonder";
        // System.out.println(cutomerId + " 상품의 구매 내역 : " +
        // dao.selectByCustomer(cutomerId));
        // }
}