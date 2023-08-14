package com.marryme.order.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.hibernate.query.Query;

import com.marryme.order.dao.OrderDao;
import com.marryme.order.entity.Order;
import com.marryme.order.entity.OrderDetail;

public class OrderDaoImpl implements OrderDao {

	@Override
	public Integer insert(Order order) {
		getSession().persist(order);
		return 1;
	}

	@Override
	public Set<OrderDetail> getDetailsById(Integer orderId) {
		String hql = "FROM OrderDetail WHERE orderId = :orderId";
		Query<OrderDetail> query = getSession().createQuery(hql, OrderDetail.class);
		List<OrderDetail> resultList = query.getResultList();
		return new HashSet<>(resultList);
	}

	@Override
	public List<Order> getOrderByMemberId(String memberId, Integer orderStatus) {
		String hql = "FROM Order AS a LEFT JOIN fetch a.orderDetails b LEFT JOIN fetch b.product WHERE a.memberId = :memberId and a.orderStatus = :orderStatus ORDER BY a.orderId DESC";
		Query<Order> query = getSession().createQuery(hql, Order.class);
		query.setParameter("memberId", memberId);
		query.setParameter("orderStatus", orderStatus);
		List<Order> list = query.list();
		List<Order> collect1 = list.stream().distinct().collect(Collectors.toList());
		return collect1;
	}

	@Override
	public List<Order> getOrderByStatus(Integer orderStatus) {
		String hql = "FROM Order AS a LEFT JOIN fetch a.orderDetails b LEFT JOIN fetch b.product WHERE a.orderStatus = :status ORDER BY a.orderId DESC";
		Query<Order> query = getSession().createQuery(hql, Order.class);
		query.setParameter("status", orderStatus);
		List<Order> list = query.list();
		List<Order> collect1 = list.stream().distinct().collect(Collectors.toList());
		return collect1;
	}

	@Override
	public List<Order> getOrderByStatusAndVendorId(String vendorId, Integer orderStatus) {
		String hql = "FROM Order AS a LEFT JOIN fetch a.orderDetails b LEFT JOIN fetch b.product WHERE a.vendorId = :vendorId and a.orderStatus = :status ORDER BY a.orderId DESC";
		Query<Order> query = getSession().createQuery(hql, Order.class);
		query.setParameter("vendorId", vendorId);
		query.setParameter("status", orderStatus);
		List<Order> list = query.list();
		List<Order> collect1 = list.stream().distinct().collect(Collectors.toList());
		return collect1;
	}

	@Override
	public Order selectById(Integer orderId) {
		return getSession().get(Order.class, orderId);
	}

	@Override
	public void update(Integer orderId, Order vo) {
		Order order = getSession().get(Order.class, orderId);
		order.setRecipientName(vo.getRecipientName());
		order.setRecipientPhone(vo.getRecipientPhone());
		order.setRecipientAddress(vo.getRecipientAddress());
		order.setOrderStatus(vo.getOrderStatus());
		order.setPaymentState(vo.getPaymentState());
		order.setShippingFee(vo.getShippingFee());
		order.setTotalAmount(vo.getTotalAmount());
		getSession().merge(order);
	}

	@Override
	public List<Order> selectAll() {
		return null;
	}

	@Override
	public void deleteById(Integer id) {
	}

}
