package com.marryme.order.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.order.entity.OrderDetail;
import com.marryme.order.service.impl.OrderServiceImpl;


@WebServlet("/order/listDetailById")
public class ListDetailByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);

		try {
			Integer orderId = Integer.valueOf(req.getParameter("order_no"));
			OrderServiceImpl orderSvc = new OrderServiceImpl();
			Set<OrderDetail> set = orderSvc.getDetailsById(orderId);
			req.setAttribute("orderDetailSet", set); // 資料庫取出的set物件,存入request
			req.getRequestDispatcher("/front-end/order/orderList.jsp").forward(req, res);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

}
