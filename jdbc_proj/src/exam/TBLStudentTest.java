package exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.OracleConnection;

public class TBLStudentTest {
    public static void main(String[] args) {
        // updateAddress("2025005", "서울시 구로구 구로동");
        addStudent();
    }

    static void addStudent() {
        String stuno = System.console().readLine("학번 >>> ");
        String name = System.console().readLine("이름 >>> ");
        String age = System.console().readLine("나이 >>> ");
        String address = System.console().readLine("주소 >>> ");

        if (stuno.length() == 0 || name.length() == 0) {
            System.out.println("필수 입력입니다.");
        } else {
            if (age.length() == 0) {
                age = null;
            }
            if (address.length() == 0)
                address = null;
            insert(stuno, name, age, address);
        }
    }

    private static void updateAddress(String stuno, String address) {
        String sql = "update tbl_student set address = ? where stuno = ?";
        try ( // try with resources : 자동 close
                Connection connection = OracleConnection.getConnection();
                PreparedStatement pstat = connection.prepareStatement(sql);) {
            connection.setAutoCommit(false);
            pstat.setString(1, address);
            pstat.setString(2, stuno);
            pstat.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL 예외 : " + e.getMessage());
        }
    }

    private static void insert(String stuno, String name, String age, String address) {
        Connection conn = OracleConnection.getConnection();
        PreparedStatement pstat = null;
        String sql = "insert into tbl_student(stuno, name,age,address) values (?, ?, ?, ?)";
        try {
            conn.setAutoCommit(false); // ✅rollback 을 위한 설정
            // ✅ 직접 commit 을 해야 테이블에 반영. 오라클은 commit은 자동, rollback 은 명령어로.
            pstat = conn.prepareStatement(sql);

            pstat.setString(1, stuno);
            pstat.setString(2, name);
            pstat.setString(3, age);
            // setInt(3,null) 불가. 오라클에서는 문자열을 number 타입으로 자동캐스팅
            pstat.setString(4, address);

            pstat.executeUpdate(); // 이 커넥션 방식은 commit 을 직접하지 않아도 close 할 때 커밋을 수행합니다.
            // int test = Integer.parseInt(name); //rollback 테스트할 NumberFormatException 예외
            // 발생

            System.out.println("1개 행이 저장되었습니다.");
        } catch (SQLException | NumberFormatException e) {
            try {
                conn.rollback();
                System.out.println("롤백 했습니다.");
                System.out.println("insert 예외 : " + e.getMessage());
            } catch (SQLException e1) {
            }
        } finally {
            OracleConnection.close(conn); // close 가 없으면 세션이 유지. commit 안됨.
            try {
                if (pstat != null)
                    pstat.close();
            } catch (SQLException e) {
            }
        }
    }
}
