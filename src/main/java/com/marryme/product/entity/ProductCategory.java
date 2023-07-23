/**
 * @Author Jeanny
 * @Create 2023/7/23 12:17
 * @Version 1.0
 */

package com.marryme.product.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "product_category", schema = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductCategory {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_category_id")
	private Integer productCategoryId;
	@Column(name = "product_category_name")
	private String productCategoryName;
	@OneToMany
	@JoinColumn(name = "product_category_id", referencedColumnName = "product_category_id")
	private List<Product> products;

}
