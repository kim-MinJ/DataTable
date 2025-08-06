import mybatis.dao.MybatisProductDao;
import mybatis.dao.MybatisReCustomerDao;
import mybatis.vo.CustomerVo;
import mybatis.vo.ProductVo;

public class App {
    public static void main(String[] args) throws Exception {
        // MybatisReCustomerDao dao = new MybatisReCustomerDao();
        // int result = dao.insert(
        // new CustomerVo("hongGS3", "홍길순3", "hgs@a.com", 22, null));
        // System.out.println("insert result : " + result);

        // System.out.println(dao.selectByPk(("hongGS")));
        // System.out.println(dao.selectByPk(("hongGSS")));

        MybatisProductDao pdao = new MybatisProductDao();
        // System.out.println("presult : " +
        // pdao.insert(new ProductVo("GALAXYS25", "C1", null, 22222)));
        // System.out.println("delete presult : " + pdao.delete("GALAXYS25"));
        System.out.println("update presult : " + pdao.update(new ProductVo("khw", "k1", "khw!!", 10)));
        // System.out.println("select keyword : " + pdao.selectByKeyword("k"));
        // System.out.println("selectAll : " + pdao.selectAll());
        // System.out.println("selectByPk : " + pdao.selectByPk("GALAXYS"));

        // int presult = pdao.insert(
        // new ProductVo("khw", "k1", "khw!", 10000));
        // // new ProductVo() 가 parameter
        // System.out.println("insert presult" + presult);

        // System.out.println(pdao.selectByPk("khw"));
        // System.out.println(pdao.selectAll());
        // System.out.println(pdao.selectByKeyword("k"));

        // int presult = pdao.update(
        // new ProductVo("khw", "k3", "khw!?", 1010));
        // System.out.println("update presult" + presult);

        // presult = pdao.delete("khw");
        // System.out.println("delete presult" + presult);

    }
}