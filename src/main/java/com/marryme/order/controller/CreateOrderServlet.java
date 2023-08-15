package com.marryme.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.marryme.order.service.OrderService;
import com.marryme.order.service.impl.OrderServiceImpl;
import com.marryme.product.entity.Cart;

@WebServlet("/order/create")
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private OrderService orderService;

	@Override
	public void init() throws ServletException {
		orderService = new OrderServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 獲取請求中的相關參數
		String memberId = request.getParameter("memberId");
		String recipientName = request.getParameter("recipientName");
		String recipientPhone = request.getParameter("recipientPhone");
		String recipientAddress = request.getParameter("recipientAddress");
		Integer paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
		if (paymentMethod == 1) {
			request.setAttribute("paymentMethod", paymentMethod);
			request.setAttribute("memberId", memberId);
			request.setAttribute("recipientName", recipientName);
			request.setAttribute("recipientPhone", recipientPhone);
			request.setAttribute("recipientAddress", recipientAddress);
			request.getRequestDispatcher("/front-end/product/creditCard.jsp").forward(request, response);
		}

		// 購物車的內容已在Cart物件中
		Cart cart = getCartFromSession(request);

		// 調用OrderService中的方法創建訂單
		orderService.createOrdersFromCart(cart, memberId, recipientName, recipientPhone,
				recipientAddress, paymentMethod, request);
	}

	// 從請求中獲取Cart物件
	private Cart getCartFromSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		Cart cart = (Cart) session.getAttribute("cart");

		if (cart == null) {
			// 如果Session中沒有購物車，創建一個新的購物車並存入Session
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		return cart;
	}
}
