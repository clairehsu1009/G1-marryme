package com.marryme.product.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.marryme.product.dao.ProductCategoryDao;
import com.marryme.product.dao.impl.ProductCategoryDaoImpl;
import com.marryme.product.entity.ProductCategory;
import com.marryme.product.service.ProductCategoryService;

/**
 * @Author Jeanny
 * @Create 2023/7/23 06:22
 * @Version 1.0
 */

public class ProductCategoryServiceImpl implements ProductCategoryService {
	private ProductCategoryDao dao;

	public ProductCategoryServiceImpl() {
		dao = new ProductCategoryDaoImpl();
	}

	// 取得所有商品類別	
	@Override
	public List<ProductCategory> findAll() {
		List<ProductCategory> productCategoryList = new ArrayList<>();
		try {
			beginTransaction();
			productCategoryList = dao.selectAll();
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return productCategoryList;
	}

	@Override
	public ProductCategory getOne(Integer id) {
		ProductCategory productCategory = null;
		try {
			beginTransaction();
			productCategory = dao.selectById(id);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return productCategory;
	}

	@Override
	public String getCategoryNameByCategoryId(Integer productCategoryId) {
		String productCategoryName = null;
		try {
			beginTransaction();
			productCategoryName = dao.getCategoryNameByCategoryId(productCategoryId);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return productCategoryName;
	}

}
