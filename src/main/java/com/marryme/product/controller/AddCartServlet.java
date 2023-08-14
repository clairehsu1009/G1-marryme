package com.marryme.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.Cart;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/addCart")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 獲取得到傳遞過來的id
		Integer id = Integer.valueOf(req.getParameter("productId"));
		Integer productQty = Integer.valueOf(req.getParameter("productQty"));

		// 把使用者想要買的商品放到購物車上
		Cart cart = (Cart) req.getSession().getAttribute("cart");

		// 如果當前使用者還沒有點擊過購買的商品，那麼是使用者的購物車是空的
		if (cart == null) {
			cart = new Cart();
			req.getSession().setAttribute("cart", cart);
		}

		ProductServiceImpl productSvc = new ProductServiceImpl();
		productSvc.buyProduct(id, cart, productQty);

	}

}
