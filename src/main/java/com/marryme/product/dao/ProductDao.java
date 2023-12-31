package com.marryme.product.dao;


import java.util.List;

import com.marryme.core.dao.CoreDao;
import com.marryme.product.entity.Product;

/**
 * @Author Jeanny
 * @Create 2023/7/23 06:22
 * @Version 1.0
 */

public interface ProductDao extends CoreDao<Product, Integer>{
	
    /** 取得該廠商所有商品的資料 */
    List<Product> selectAllByVendorId(String vendorId);
    
    Product findProductPic(Integer productId);

	List<Product> selectAllByProductCategoryId(Integer productCategoryId);

	void updateProductStock(Integer productId, Integer newStock);

	void toggleProductStatus(Integer id);

	List<Product> getOrderByStatus(Integer productStatus);

	List<Product> getOrderByStatusAndVendorId(Integer productStatus, String VendorId);
}
