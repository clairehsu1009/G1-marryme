package com.marryme.order.entity;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.marryme.member.vo.Member;
import com.marryme.vendor.vo.Vendor;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "orders", schema = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "order_id")
	private Integer orderId;
	@Column(name = "member_id")
	private String memberId;
	@Column(name = "vendor_id")
	private String vendorId;
	@Column(name = "recipient_name")
	private String recipientName;
	@Column(name = "recipient_phone")
	private String recipientPhone;
	@Column(name = "recipient_address")
	private String recipientAddress;
	@Column(name = "order_status")
	private Integer orderStatus;
	@Column(name = "order_date")
	private Timestamp orderDate;
	@Column(name = "payment_method")
	private Integer paymentMethod;
	@Column(name = "payment_deadline")
	private Timestamp paymentDeadline;
	@Column(name = "payment_state")
	private Integer paymentState;
	@Column(name = "shipping_fee")
	private Integer shippingFee;
	@Column(name = "total_amount")
	private Integer totalAmount;
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
	private List<OrderDetail> orderDetails;
	@ManyToOne
	@JoinColumn(name = "member_id", insertable = false, updatable = false)
	private Member member;
	@ManyToOne
	@JoinColumn(name = "vendor_id", insertable = false, updatable = false)
	private Vendor vendor;
}
