package com.marryme.product.dao.impl;

import java.util.List;

import org.hibernate.query.Query;

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
	public String getCategoryNameByCategoryId(Integer categoryId) {
        String hql = "SELECT pc.productCategoryName FROM ProductCategory pc WHERE pc.productCategoryId = :categoryId";
        Query<String> query = getSession().createQuery(hql, String.class);
        query.setParameter("categoryId", categoryId);
        return query.uniqueResult();
    }


	@Override
	public Integer insert(ProductCategory pojo) {
		return null;
	}

	@Override
	public void update(Integer id, ProductCategory pojo) {
	}

	@Override
	public void deleteById(Integer id) {
	}

}
