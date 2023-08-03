package com.marryme.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.ProductCategory;
import com.marryme.product.service.ProductCategoryService;
import com.marryme.product.service.impl.ProductCategoryServiceImpl;

/**
 * @Author Jeanny
 * @Create 2023/7/24 22:35
 * @Version 1.0
 */

@WebServlet("/product/FindAllProductCategory")
public class FindAllProductCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductCategoryService service;

	@Override
	public void init() throws ServletException {
		service = new ProductCategoryServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<ProductCategory> list = service.findAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/front-end/vendor/product/addProduct.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
