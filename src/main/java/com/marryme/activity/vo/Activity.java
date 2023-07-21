/**
 * @Author Jeanny
 * @Create 2023/7/21 22:07
 * @Version 4.0
 */

package com.marryme.activity.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(schema = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Activity {
	@Id
	// 優惠代碼
	@Column(name = "discount_code")
	private String discountCode;
	// 廠商ID
	@ManyToOne
	@JoinColumn(name = "vendor_id", insertable = false, updatable = false)
	private String vendorId;
	// 活動名稱
	@Column(name = "activity_name")
	private String activityName;
	// 折扣
	private BigDecimal discount;
	// 活動開始時間
	@Column(name = "activity_start_time")
	private Timestamp activityStartTime;
	// 活動結束時間
	@Column(name = "activity_end_time")
	private Timestamp activityEndTime;
	// 活動細項
	@Column(name = "activity_detail")
	private String activityDetail;
	 /**
     * 狀態 0下架 1上架
     * 預設1 上架
     * 改為0 下架，就不能再改上架，需要重新新增
     * */
    @Column(name = "status")
    private Integer status;
    /**
     * 可否編輯內容 
     * 預設 0可修改 (若有已上架的優惠券，需提醒是否確認修改，仍可修改、優惠券帶出的資料會同步變更）
     * 1不可修改 (已有已成立之訂單使用該優惠券，不可更改優惠券內容，只能下架）
     * */
    @Column(name = "edit_status")
    private Integer editStatus;
}