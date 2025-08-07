package mybatis.mapper;

import java.util.List;
import java.util.Map;

import mybatis.vo.BuyVo;
import mybatis.vo.CustomerBuyVo;

public interface BuyMapper {
    List<BuyVo> selectByCustomer(String customer_id);

    List<BuyVo> selectByPcode(String pcode);

    List<BuyVo> selectByYear(String year); // 내 방식은 int year

    int selectSumByPcode(String pcode);

    // join
    List<CustomerBuyVo> selectSaleByCustomer(String customer_idString);

    // count 집계함수
    Map<String, Integer> selectCountByYear(String year);

    List<Map<String, Object>> selectAllCountByYear();

}