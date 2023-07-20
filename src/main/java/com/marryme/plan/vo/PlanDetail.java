package com.marryme.plan.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

/**
 * ClassName: PlanProductDetail
 * Package: com.marryme.plan.vo
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/20 下午 08:18
 * @Version 1.0
 */
@Entity
@Table(name = "plan_product_detail", catalog = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlanDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "plan_product_detail_id")
    private Integer planProductDetailId;
    /** 方案ID */
    @Column(name = "plan_product_id")
    private Integer planProductId;
    /** 加購項目ID */
    @Column(name = "plan_item_id")
    private Integer planItemId;
    /** 場地ID */
    @Column(name = "place_id")
    private Integer placeId;
}
