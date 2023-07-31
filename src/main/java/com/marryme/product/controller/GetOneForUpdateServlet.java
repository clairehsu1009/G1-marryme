/**
 * @Author Jeanny
 * @Create 2023/7/27 10:50
 * @Version 1.0
 */

package com.marryme.product.controller;

import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.common.CommonString.GET_ERROR;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.Product;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/getOneForUpdate")
public class GetOneForUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductServiceImpl service = new ProductServiceImpl();

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Map<String, String> responseMsgMap = new HashMap<>();
		Integer productId = Integer.valueOf(req.getParameter("productId"));
		Product product = service.getOne(productId);
		if (product == null) {
			responseMsgMap.put(EXCEPTION, GET_ERROR);
			doGet(req, res);
			return;
		}
		req.setAttribute("product", product);
		System.out.println(product.getImage());
		req.getRequestDispatcher("/front-end/vendor/product/editProduct.jsp").forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}
}
