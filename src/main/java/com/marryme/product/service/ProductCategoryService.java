package com.marryme.product.service;

import java.util.List;

import com.marryme.core.service.CoreService;
import com.marryme.product.entity.ProductCategory;

/**
 * @Author Jeanny
 * @Create 2023/7/23 06:22
 * @Version 1.0
 */

public interface ProductCategoryService extends CoreService {

	List<ProductCategory> findAll();

	ProductCategory getOne(Integer id);
}
