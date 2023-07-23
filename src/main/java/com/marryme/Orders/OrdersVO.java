package com.marryme.Orders;

import java.sql.Timestamp;

public class OrdersVO {
	private Integer order_id;
	private String member_id;
	private String discount_code;
	private Integer order_status;
	private Timestamp order_date;
	private Integer payment_method;
	private Timestamp payment_deadline;
	private Integer payment_state;
	private Timestamp order_statrt_time;
	private Timestamp order_end_time;
	private Integer shipping_fee;
	private Double discount_amount;
	private Integer total_amount;

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getDiscount_code() {
		return discount_code;
	}

	public void setDiscount_code(String discount_code) {
		this.discount_code = discount_code;
	}

	public Integer getOrder_status() {
		return order_status;
	}

	public void setOrder_status(Integer order_status) {
		this.order_status = order_status;
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}

	public Integer getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(Integer payment_method) {
		this.payment_method = payment_method;
	}

	public Timestamp getPayment_deadline() {
		return payment_deadline;
	}

	public void setPayment_deadline(Timestamp payment_deadline) {
		this.payment_deadline = payment_deadline;
	}

	public Integer getPayment_state() {
		return payment_state;
	}

	public void setPayment_state(Integer payment_state) {
		this.payment_state = payment_state;
	}

	public Timestamp getOrder_statrt_time() {
		return order_statrt_time;
	}

	public void setOrder_statrt_time(Timestamp order_statrt_time) {
		this.order_statrt_time = order_statrt_time;
	}

	public Timestamp getOrder_end_time() {
		return order_end_time;
	}

	public void setOrder_end_time(Timestamp order_end_time) {
		this.order_end_time = order_end_time;
	}

	public Integer getShipping_fee() {
		return shipping_fee;
	}

	public void setShipping_fee(Integer shipping_fee) {
		this.shipping_fee = shipping_fee;
	}

	public Double getDiscount_amount() {
		return discount_amount;
	}

	public void setDiscount_amount(Double discount_amount) {
		this.discount_amount = discount_amount;
	}

	public Integer getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(Integer total_amount) {
		this.total_amount = total_amount;
	}

}