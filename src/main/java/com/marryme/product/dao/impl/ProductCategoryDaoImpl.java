package com.marryme.product.dao.impl;

import java.util.List;

import com.marryme.product.dao.ProductCategoryDao;
import com.marryme.product.entity.ProductCategory;

/**
 * @Author Jeanny
 * @Create 2023/7/23 06:22
 * @Version 1.0
 */

public class ProductCategoryDaoImpl implements ProductCategoryDao {
	@Override
	public List<ProductCategory> selectAll() {
		String hql = "FROM ProductCategory";
		return getSession().createQuery(hql, ProductCategory.class).list();
	}

	@Override
	public ProductCategory selectById(Integer id) {
		return getSession().get(ProductCategory.class, id);
	}

	@Override
	public Integer insert(ProductCategory pojo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Integer id, ProductCategory pojo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub

	}

}
