package com.marryme.plan.vo;
import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: Plan
 * Package: marryme.plan.vo
 * Description:
 *          方案實體類(pojo)
 * @Author Claire
 * @Create 2023/7/7 下午 11:31
 * @Version 1.0
 */
@Entity
@Table(name = "plan_product", schema = "marryme")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Plan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "plan_product_id")
    private Integer planProductId;
    /** 廠商ID */
    @Column(name = "vendor_id")
    private String vendorId;
    /** 方案主圖片 */
    @Column(name = "plan_picture")
    private byte[] planPicture;
    /** 方案名稱 */
    @Column(name = "plan_title")
    private String planTitle;
    /** 方案介紹 */
    @Column(name = "plan_introduction")
    private String planIntroduction;
    /**
     *  狀態 0下架 1上架 2預定額滿<br>
     *  預設1 上架 <br>
     *  改為0 下架，就不能再改上架，需要重新新增
     * */
    @Column(name = "plan_product_status")
    private Integer planProductStatus;
    /** 更新時間 */
    @Column(name = "update_time")
    private Timestamp updateTime;
    /** 圖1簡介 */
    @Column(name = "plan_picture_intro1")
    private String planPictureIntro1;
    /** 圖1 */
    @Column(name = "plan_pictures1")
    private byte[] planPictures1;
    /** 圖2簡介 */
    @Column(name = "plan_picture_intro2")
    private String planPictureIntro2;
    /** 圖2 */
    @Column(name = "plan_pictures2")
    private byte[] planPictures2;
    /** 圖3簡介 */
    @Column(name = "plan_picture_intro3")
    private String planPictureIntro3;
    /** 圖3簡介 */
    @Column(name = "plan_pictures3")
    private byte[] planPictures3;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    @JoinColumn(name = "plan_product_id", referencedColumnName = "plan_product_id")
    private List<PlanDetail> PlanDetail = new ArrayList<>();

}
