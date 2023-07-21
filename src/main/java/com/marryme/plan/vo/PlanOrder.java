package com.marryme.plan.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.checkerframework.checker.units.qual.C;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * ClassName: PlanOrder
 * Package: marryme.plan.vo
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/12 下午 06:39
 * @Version 1.0
 */
@Entity
@Table(name = "plan_order", catalog = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlanOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "plan_order_id")
    private Integer planOrderId;
    /** 會員ID */
    @Column(name = "member_id")
    private String memberId;
    /** 方案商品ID */
    @Column(name = "plan_product_id")
    private Integer planProductId;
    /** 方案場地ID */
    @Column(name = "place_id")
    private Integer placeId;
    /** 不可預約日期ID */
    @Column(name = "unavailable_dates_id")
    private Integer unavailableDatesId;
    /** 實際桌數 */
    @Column(name = "order_tables")
    private Integer orderTables;
    /**
     * 訂單狀態,
     * 0已成立、1處理中、2已聯繫廠商、3廠商已確認訂購品項、4已完成、5已取消
     * */
    @Column(name = "order_status")
    private Integer orderStatus;
    /**
     * 付款方式：
     * 0轉帳、1刷卡
     * */
    @Column(name = "payment_method")
    private Integer paymentMethod;
    /**
     * 付款狀態：
     * 0未付款、1已付訂、2已付清、3取消
     * */
    @Column(name = "payment_state")
    private Integer paymentState;
    /** 總金額 */
    @Column(name = "total_amount")
    private Integer totalAmount;
    /** 訂單時間 */
    @Column(name = "order_dateTime")
    private Date orderDateTime;
    /** 餘額 */
    @Column(name = "grant_amount")
    private Integer grantAmount;
    /** 原價 */
    @Column(name = "original_price")
    private Integer originalPrice;
    /** 折扣價 */
    @Column(name = "discount_price")
    private Integer discountPrice;
    /** 優惠代碼 */
    @Column(name = "discount_code")
    private Integer discountCode;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name = "plan_order_id")
    private List<PlanOrderDetail> PlanOrderDetail = new ArrayList<>();


}
