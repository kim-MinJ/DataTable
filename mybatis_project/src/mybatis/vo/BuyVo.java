package mybatis.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter

public class BuyVo {
    private Integer buy_seq;
    private String customer_id;
    private String pcode;
    private int quantity;
    private Date buy_date;

    @Override
    public String toString() {
        return buy_seq + ", customer_id=" + customer_id + ", pcode=" + pcode + ", quantity="
                + quantity + ", buy_date=" + buy_date;
    }
}
