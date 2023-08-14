package com.marryme.order.service;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.marryme.core.service.CoreService;
import com.marryme.order.entity.Order;
import com.marryme.order.entity.OrderDetail;
import com.marryme.product.entity.Cart;

public interface OrderService extends CoreService {

	List<Order> createOrdersFromCart(Cart cart, String memberId, String recipientName, String recipientPhone,
			String recipientAddress, int paymentMethod, HttpServletRequest req);

	Set<OrderDetail> getDetailsById(Integer orderId);

	List<Order> getOrderByMemberId(String memberId, Integer orderStatus);

	Order getOne(Integer orderId);

	boolean edit(Integer orderId, Order order);

	List<Order> getOrderByStatus(Integer orderStatus);

	List<Order> getOrderByStatusAndVendorId(String vendorId, Integer orderStatus);

}