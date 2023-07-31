package com.marryme.product.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;

import com.marryme.product.dao.ProductDao;
import com.marryme.product.dao.impl.ProductDaoImpl;
import com.marryme.product.entity.Product;
import com.marryme.product.service.ProductService;

/**
 * @Author Jeanny
 * @Create 2023/7/23 19:57
 * @Version 1.0
 */

public class ProductServiceImpl implements ProductService {
	private ProductDao dao;

	public ProductServiceImpl() {
		dao = new ProductDaoImpl();
	}

	@Override
	public List<Product> findAll() {
		List<Product> productList = new ArrayList<>();
		try {
			beginTransaction();
			productList = dao.selectAll();
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return productList;
	}

	@Override
	public Product getOne(Integer id) {
		Product product = null;
		try {
			beginTransaction();
			product = dao.selectById(id);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return product;
	}

	@Override
	public Integer add(Product product) {
		Integer id = null;
		try {
			beginTransaction();
			id = dao.insert(product);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public boolean edit(Integer id, Product product) {
		boolean result = false;
		try {
			beginTransaction();
			dao.update(id, product);
			commit();
			result = true;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Product> findAllByVendorId(String vendorId) {
		List<Product> productList = new ArrayList<>();
		try {
			beginTransaction();
			productList = dao.selectAllByVendorId(vendorId);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return productList;
	}
	
	@Override
	public List<Product> findAllByProductCategoryId(Integer productCategoryId) {
		List<Product> productList = new ArrayList<>();
		try {
			beginTransaction();
			productList = dao.selectAllByProductCategoryId(productCategoryId);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return productList;
	}

	public Optional<Product> getProductPic(Integer productId) {
		Optional<Product> result = Optional.empty();
		try {
			beginTransaction();
			Product product = dao.findProductPic(productId);
			commit();
			result = Optional.ofNullable(product);
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean changeStatusToInactive(Integer id) {
		boolean result = false;
		try {
			beginTransaction();
			dao.changeStatusToInactive(id);
			commit();
			result = true;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return result;
	}

}
