package com.marryme.plan.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

/**
 * ClassName: PlanCheckOrder
 * Package: com.marryme.plan.vo
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/6 下午 03:40
 * @Version 1.0
 */
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlanCheckOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer planCheckOrderId;
    /** 會員ID */
    private String memberId;
    /** 方案商品ID */
    private Integer planProductId;
    /** 方案場地ID */
    private Integer placeId;
    /** 不可預約日期*/
    private String unavailableDate;
    /** 不可預約時間*/
    private String unavailableTime;
    /** 實際桌數 */
    private Integer orderTables;
    /** 餐價 */
    private Integer tablePrice;
    /** 總金額 */
    private String total;
    /** 加購項目id陣列 */
    private List<Integer> planItemId;

}
