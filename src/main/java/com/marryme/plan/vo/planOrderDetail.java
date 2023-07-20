package com.marryme.plan.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

/**
 * ClassName: PlanDetailOrder
 * Package: marryme.plan.vo
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/12 下午 06:45
 * @Version 1.0
 */
@Entity
@Table(name = "plan_order_detail", catalog = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class planOrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "plan_order_detail_id")
    private Integer planOrderDetailId;
    /** 方案訂單_ID */
    @Column(name = "plan_order_id")
    private Integer planOrderId;
    /** 方案加購項目_ID */
    @Column(name = "plan_item_id")
    private Integer planItemId;


}
