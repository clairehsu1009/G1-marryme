package com.marryme.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.order.entity.Order;
import com.marryme.order.entity.OrderDetail;
import com.marryme.order.service.OrderService;
import com.marryme.order.service.impl.OrderServiceImpl;

@WebServlet("/order/findOrderByMemberId")
public class FindOrderByMemberIdServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private OrderService orderService;

	@Override
	public void init() throws ServletException {
		orderService = new OrderServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		Integer orderStatus = Integer.valueOf(req.getParameter("orderStatus"));
		List<Order> orderList = orderService.getOrderByMemberId(memberId, orderStatus);
		for (Iterator<Order> iter = orderList.iterator(); iter.hasNext();) {
			Order orders = iter.next();
			List<OrderDetail> orderDetails = new ArrayList<>(orders.getOrderDetails());
			for (Iterator<OrderDetail> iter1 = orderDetails.iterator(); iter1.hasNext();) {
				OrderDetail detail = iter1.next();
				Integer platformPrice = detail.getProduct().getPlatformPrice();
				int price = detail.getQuantity() * platformPrice;
				detail.setAmount(price);
			}
		}
		req.setAttribute("orderList", orderList);
		req.setAttribute("status", orderStatus);
		req.setAttribute("memberId", memberId);
		req.getRequestDispatcher("/front-end/user/order/listAllOrder.jsp").forward(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);

	}
}
