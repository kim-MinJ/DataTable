package mybatis.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.config.SqlSessionBean;
import mybatis.vo.BuyVo;
import oracle.sql.DATE;

public class BuyMapperDao {
    private SqlSessionFactory sqlSessionFactory = SqlSessionBean.getSessionFactory();

    public List<BuyVo> selectByCustomer(String customer_id) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectByCustomer(customer_id);
        }
    }

    public List<BuyVo> selectBypcode(String pcode) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectByPcode(pcode);
        }
    }

    public List<BuyVo> selectByYear(int buy_Date) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectByYear(buy_Date);
        }
    }

    public int selectSumByPcode(String pcode) {
        try (SqlSession sqlSession = sqlSessionFactory.openSession();) {
            BuyMapper mapper = sqlSession.getMapper(BuyMapper.class);
            return mapper.selectSumByPcode(pcode);
        }
    }
}
