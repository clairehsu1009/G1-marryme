/**
 * @Author Jeanny
 * @Create 2023/7/23 12:18
 * @Version 2.0
 */

package com.marryme.product.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "product", schema = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Integer productId;
	// 廠商ID 尚未加關聯
	@Column(name = "vendor_id")
    private String vendorId;
	@Column(name = "product_category_id")
    private Integer productCategoryId;
	@Column(name = "product_name")
    private String productName;
    private byte[] image;
	@Column(name = "original_price")
    private Integer originalPrice;
	@Column(name = "platform_price")
    private Integer platformPrice;
	@Column(name = "stock_quantity")
	private Integer stockQuantity;
	@Column(name = "product_description")
    private String productDescription;
	@Column(name = "created_time", insertable = false)
    private Timestamp createdTime;
	@Column(name = "product_status")
    private Integer productStatus;
	@ManyToOne
	@JoinColumn(name = "product_category_id", insertable = false, updatable = false)
	private ProductCategory productCategory;
}
