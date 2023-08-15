package com.marryme.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.Cart;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/updateCartQuantity")
public class UpdateCartQuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 獲取使用者想要修改哪一個商品的id和相對應的數量
		Integer id = Integer.valueOf(req.getParameter("productId"));
		Integer quantity = Integer.valueOf(req.getParameter("quantity"));

		// 獲得當前使用者的購物車
		Cart cart = (Cart) req.getSession().getAttribute("cart");

		try {

			// 調用ProductServiceImpl的方法去修改對應的資料
			ProductServiceImpl productSvc = new ProductServiceImpl();
			productSvc.updateQuantity(id, cart, quantity);

			// 修改完再跳轉回購物車的頁面
			req.getRequestDispatcher("/front-end/product/shoppingCart.jsp").forward(req, res);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
