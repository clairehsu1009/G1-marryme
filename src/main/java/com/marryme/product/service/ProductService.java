package com.marryme.product.service;

import java.util.List;
import java.util.Optional;

import com.marryme.core.service.CoreService;
import com.marryme.product.entity.Product;

public interface ProductService extends CoreService {

	List<Product> findAll();

	Product getOne(Integer id);

	Integer add(Product product);

	boolean edit(Integer id, Product product);

	List<Product> findAllByVendorId(String vendorId);
	
	public Optional<Product> getProductPic(Integer productId);
	
	  /** 修改加購項目狀態為下架 */
    boolean changeStatusToInactive(Integer id);

	List<Product> findAllByProductCategoryId(Integer productCategoryId);


}
