package mybatis.mapper;

public class BuyMapperTest {
        public static void main(String[] args) {
                BuyMapperDao dao = new BuyMapperDao();
                // System.out.println("SelectByCustomer : " +
                // dao.selectByCustomer("mina012"));
                // System.out.println("SelectByPcode : " +
                // dao.selectBypcode("JINRMn5"));
                // System.out.println("SelectByYear : " +
                // dao.selectByYear(2024));
                System.out.println("SelectSumByPcode : " +
                                dao.selectSumByPcode("JINRMn5"));
        }

}
