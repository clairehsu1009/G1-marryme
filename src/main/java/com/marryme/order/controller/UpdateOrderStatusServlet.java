package com.marryme.order.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.marryme.order.entity.Order;
import com.marryme.order.service.OrderService;
import com.marryme.order.service.impl.OrderServiceImpl;

@WebServlet("/order/updateOrderStatus")
public class UpdateOrderStatusServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private OrderService orderService;

	@Override
	public void init() throws ServletException {
		orderService = new OrderServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("application/json;charset=utf-8");
		Integer orderId = Integer.valueOf(req.getParameter("orderId"));
		Integer orderStatus = Integer.valueOf(req.getParameter("orderStatus"));
		Order order = orderService.getOne(orderId);

		order.setOrderStatus(orderStatus);
		orderService.edit(order.getOrderId(), order);

		// 創建 Gson 物件
		Gson gson = new Gson();

		// 創建回應物件
		Map<String, String> responseMap = new HashMap<>();
		responseMap.put("code", "200");
		responseMap.put("message", "訂單取消成功");

		// 將回應物件轉換為 JSON 格式
		String jsonResponse = gson.toJson(responseMap);

		// 將 JSON 回應寫入 HttpServletResponse
		PrintWriter out = res.getWriter();
		out.print(jsonResponse);
		out.flush();
	}
}
