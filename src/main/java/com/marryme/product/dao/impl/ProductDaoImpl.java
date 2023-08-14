package com.marryme.product.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.marryme.product.dao.ProductDao;
import com.marryme.product.entity.Product;

/**
 * @Author Jeanny
 * @Create 2023/7/21 22:06
 * @Version 3.0
 */
public class ProductDaoImpl implements ProductDao {

	@Override
	public List<Product> selectAll() {
		String hql = "FROM Product";
		return getSession().createQuery(hql, Product.class).list();
	}

	@Override
	public Product selectById(Integer id) {
		return getSession().get(Product.class, id);
	}

	@Override
	public Integer insert(Product product) {
		getSession().persist(product);
		return 1;
	}

	@Override
	public void update(Integer id, Product vo) {
		Product product = getSession().get(Product.class, id);
		product.setProductName(vo.getProductName());
		product.setImage(vo.getImage());
		product.setOriginalPrice(vo.getOriginalPrice());
		product.setPlatformPrice(vo.getPlatformPrice());
		product.setStockQuantity(vo.getStockQuantity());
		product.setProductDescription(vo.getProductDescription());
		getSession().merge(product);

	}

	@Override
	public void deleteById(Integer id) {
		Session session = getSession();
		Product product = session.load(Product.class, id);
		session.remove(product);
	}

	@Override
	public List<Product> selectAllByVendorId(String vendorId) {
		String hql = "FROM Product WHERE vendorId = :vendorId";
		Query<Product> query = getSession().createQuery(hql, Product.class);
		query.setParameter("vendorId", vendorId);
		return query.list();
	}
	
	@Override
	public List<Product> selectAllByProductCategoryId(Integer productCategoryId) {
		String hql = "FROM Product WHERE productCategoryId = :productCategoryId";
		Query<Product> query = getSession().createQuery(hql, Product.class);
		query.setParameter("productCategoryId", productCategoryId);
		return query.list();
	}

	@Override
	public Product findProductPic(Integer productId) {
	    Session session = getSession();
	    String hql = "FROM Product WHERE productId = :productId";
	    Query<Product> query = session.createQuery(hql, Product.class);
	    query.setParameter("productId", productId);
	    return query.uniqueResult();
	}


	
	
	@Override
	public void changeStatusToInactive(Integer id) {
		Product product = getSession().get(Product.class, id);
		product.setProductStatus(0); // 狀態改為下架
		getSession().merge(product);
	}
}