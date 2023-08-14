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
		String hql = "FROM Product WHERE productCategoryId = :productCategoryId AND productStatus = 1";
		Query<Product> query = getSession().createQuery(hql, Product.class);
		query.setParameter("productCategoryId", productCategoryId);
		return query.list();
	}
	
	@Override
	public List<Product> getOrderByStatus(Integer productStatus) {
		String hql = "FROM Product WHERE productStatus = :productStatus ORDER BY productId DESC";
		Query<Product> query = getSession().createQuery(hql, Product.class);
		query.setParameter("productStatus", productStatus);
		return query.list();
	}
	
	@Override
	public List<Product> getOrderByStatusAndVendorId(Integer productStatus, String vendorId) {
		String hql = "FROM Product WHERE productStatus = :productStatus AND vendorId = :vendorId ORDER BY productId DESC";
		Query<Product> query = getSession().createQuery(hql, Product.class);
		query.setParameter("productStatus", productStatus);
		query.setParameter("vendorId", vendorId);
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
	public void toggleProductStatus(Integer id) {
	    Product product = getSession().get(Product.class, id);

	    if (product.getProductStatus() == 0) {
	        // 當前狀態是下架，改為上架
	        product.setProductStatus(1);
	    } else {
	        //當前狀態是上架，改為下架
	        product.setProductStatus(0);
	    }

	    getSession().merge(product);
	}

	@Override
	public void updateProductStock(Integer productId, Integer newStock) {
		try {
			Session session = getSession();

			// 獲取商品
			Product product = session.get(Product.class, productId);
			if (product == null) {
				throw new RuntimeException("商品不存在");
			}

			// 更新庫存
			product.setStockQuantity(newStock);
			session.merge(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
