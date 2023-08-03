package com.marryme.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.Cart;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/deleteCartProduct")
public class DeleteCartProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//獲取得到使用者想要刪除哪個商品的id
		Integer id = Integer.valueOf(req.getParameter("productId"));

		//獲取該使用者相對應的購物車對象
		Cart cart = (Cart) req.getSession().getAttribute("cart");

		try {
		    //刪除購物車的商品
		    ProductServiceImpl productSvc = new ProductServiceImpl();
		    productSvc.deleteProduct(id, cart);

		    //刪除購物車的商品後，也應該直接跳轉回購物車的顯示頁面中
		    req.getRequestDispatcher("/front-end/product/shoppingCart.jsp").forward(req, res);
		} catch (Exception e) {
		    e.printStackTrace();

	        // 使用SweetAlert彈出錯誤提示
	        String errorMessage = "刪除中出現了異常~請稍後再試！";
	        req.setAttribute("errorMessage", errorMessage);
	        req.getRequestDispatcher("/front-end/product/shoppingCart.jsp").forward(req, res);
		}

	}
}