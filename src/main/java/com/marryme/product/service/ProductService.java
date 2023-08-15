package com.marryme.product.service;

import java.util.List;
import java.util.Optional;

import com.marryme.core.service.CoreService;
import com.marryme.product.entity.Cart;
import com.marryme.product.entity.Product;

public interface ProductService extends CoreService {

	List<Product> findAll();

	Product getOne(Integer id);

	Integer add(Product product);

	boolean edit(Integer id, Product product);

	List<Product> findAllByVendorId(String vendorId);
	
	Optional<Product> getProductPic(Integer productId);

	List<Product> findAllByProductCategoryId(Integer productCategoryId);
	
	boolean toggleProductStatus(Integer id);
	
	List<Product> getProductByStatus(Integer productStatus);

	List<Product> getProductByStatusAndVendorId(Integer productStatus, String vendorId);
	
	// 購物車使用
	void buyProduct(Integer id, Cart cart, Integer productQty);
	
	void deleteProduct(Integer id, Cart cart) throws Exception;
	
	void updateQuantity(Integer id, Cart cart, Integer quantity) throws Exception;
	
	void clearCart(Cart cart) throws Exception;

	void updateProductStock(Integer productId, Integer quantity);







}
