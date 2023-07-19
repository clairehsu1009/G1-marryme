/**
 * @Author Jeanny
 * @Create 2023/7/19 21:31
 * @Version 2.0
 */

package com.marryme.activity.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Activity {
	private String discount_code;
	private String vendor_id;
	private String activity_name;
	private BigDecimal discount;
	private Timestamp activity_start_time;
	private Timestamp activity_end_time;
	private String activity_detail;

	public Activity() {
	}
	
	// Getters and Setters
	public String getDiscount_code() {
		return discount_code;
	}

	public void setDiscount_code(String discount_code) {
		this.discount_code = discount_code;
	}

	public String getVendor_id() {
		return vendor_id;
	}

	public void setVendor_id(String vendor_id) {
		this.vendor_id = vendor_id;
	}

	public String getActivity_name() {
		return activity_name;
	}

	public void setActivity_name(String activity_name) {
		this.activity_name = activity_name;
	}

	public BigDecimal getDiscount() {
		return discount;
	}

	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	public Timestamp getActivity_start_time() {
		return activity_start_time;
	}

	public void setActivity_start_time(Timestamp activity_start_time) {
		this.activity_start_time = activity_start_time;
	}

	public Timestamp getActivity_end_time() {
		return activity_end_time;
	}

	public void setActivity_end_time(Timestamp activity_end_time) {
		this.activity_end_time = activity_end_time;
	}

	public String getActivity_detail() {
		return activity_detail;
	}

	public void setActivity_detail(String activity_detail) {
		this.activity_detail = activity_detail;
	}
}