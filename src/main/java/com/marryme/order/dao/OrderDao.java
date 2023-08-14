package com.marryme.order.dao;

import java.util.List;
import java.util.Set;

import com.marryme.core.dao.CoreDao;
import com.marryme.order.entity.Order;
import com.marryme.order.entity.OrderDetail;

public interface OrderDao extends CoreDao<Order, Integer> {

	Set<OrderDetail> getDetailsById(Integer orderId);

	List<Order> getOrderByMemberId(String userId, Integer status);

	List<Order> getOrderByStatus(Integer orderStatus);

	List<Order> getOrderByStatusAndVendorId(String vendorId, Integer orderStatus);

}