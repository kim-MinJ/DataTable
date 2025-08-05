package app;

import java.util.List;

import dao.TblProductDao;
import vo.ProductVo;

public class ProductManageApp {
    public static void main(String[] args) {
        System.out.println("====== 상품 관리 App ======");
        boolean run = true;
        while (run) {
            System.out.println("\n선택 메뉴 : 1. 등록 2.  조회");
            System.out.println("                 3. 변경 4. 삭제  5. 검색");
            String menu = System.console().readLine("메뉴 선택 >>> ");
            switch (menu) {
                case "5":
                    seach();
                    break;
                case "4":
                    deletes();
                    break;
                case "3":
                    update();
                    break;
                case "2":
                    printInfo();
                    break;
                case "1":
                    register();
                    break;

                default:
                    System.out.println("없는 메뉴 입니다.");
                    break;
            }
        }
    }

    private static void deletes() {
        System.out.println("\t :: 상품 삭제 :: ");
        String code = System.console().readLine("삭제할 상품의 code >>> ");
        TblProductDao dao = new TblProductDao();

        int result = dao.delete(code);

        if (result > 0) {
            System.out.println("상품이 삭제되었습니다.");
        } else {
            System.out.println("해당하는 코드의 상품이 존재하지 않습니다.");
        }
    }

    private static void update() {
        System.out.println("\t :: 상품 변경 :: ");
        String change = System.console().readLine("변경할 상품 code >>> ");
        TblProductDao dao = new TblProductDao();
        ProductVo product = dao.selectByPk(change);

        if (product == null) {
            System.out.println("해당 상품이 존재하지 않습니다.");
        } else {
            String category = System.console().readLine("카테고리 재지정 >>> ");
            String pname = System.console().readLine("새 상품명 >>> ");
            int price = 0;
            try {
                String temp = System.console().readLine("수정할 가격 >>> ");
                price = Integer.parseInt(temp);
            } catch (Exception e) {
                System.out.println("숫자만 입력하세요.");
            }
            product.setCategory(category);
            product.setPname(pname);
            product.setPrice(price);
            int result = dao.update(product);

            if (result > 0) {
                System.out.println("변경 완료");
            } else {
                System.out.println("변경 실패");
            }
        }
    }

    private static void seach() {
        System.out.println("\t :: 상품 검색 :: ");
        String keyword = System.console().readLine("검색어 입력 >>> ");
        TblProductDao dao = new TblProductDao();
        List<ProductVo> list = dao.searchByKeyword(keyword);
        System.out.println("\t :: 조회 결과 ::");
        for (ProductVo vo : list) {
            System.out.println(String.format("%10s \t%2s \t%20s \t%8d",
                    vo.getPcode(),
                    vo.getCategory(),
                    vo.getPname(),
                    vo.getPrice()));
        }
    }

    private static void printInfo() {
        System.out.println("\t :: 상품 정보 조회 ::");
        String code = System.console().readLine("식별 코드 입력 >>> ");
        TblProductDao dao = new TblProductDao();
        ProductVo pcode = dao.selectByPk(code);
        System.out.println("카테고리 : " + pcode.getCategory());
        System.out.println("상품이름 : " + pcode.getPname());
        System.out.println("가격 : " + pcode.getPrice());
    }

    public static void register() {
        System.out.println("\t 상품 등록");
        boolean run = true;
        TblProductDao dao = new TblProductDao();
        String pcode = null;
        while (run) {
            pcode = System.console().readLine("등록할 상품 코드 >>> ");
            if (dao.selectByPk(pcode) != null) {
                System.out.println("이미 사용중인 코드입니다.");
                continue;
            } else
                run = false;
        }

        String category = System.console().readLine("카테고리 >>>");
        String pname = System.console().readLine("상품이름 >>>");

        int price = 0;
        run = true;
        while (run) {
            String temp = System.console().readLine("상품가격 >>>");
            if (temp.length() == 0)
                break;
            try {
                price = Integer.parseInt(temp);
                run = false;
            } catch (NumberFormatException e) {
                System.out.println("숫자만 입력하세요.");
            }
            ProductVo vo = new ProductVo(pcode, category, pname, price);

            if (dao.insert(vo) == 0)
                System.out.println("등록 실패");
            else
                System.out.println("등록 완료");
        }
    }
}
