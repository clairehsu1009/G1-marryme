package com.marryme.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.Product;
import com.marryme.product.service.ProductService;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/getProductByStatus")
public class GetProductByStatusServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service;

	@Override
	public void init() throws ServletException {
		service = new ProductServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String vendorId = req.getParameter("vendorId");
		Integer productStatus = Integer.valueOf(req.getParameter("productStatus"));
		List<Product> productList = service.getProductByStatus(productStatus);
		req.setAttribute("productList", productList);
		req.setAttribute("status", productStatus);
		req.setAttribute("vendorId", vendorId);
		req.getRequestDispatcher("/back-end/product/listAllProduct.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
