package com.marryme.order.dao.impl;

import java.util.List;

import com.marryme.order.dao.OrderDetailDao;
import com.marryme.order.entity.OrderDetail;

public class OrderDetailDaoImpl implements OrderDetailDao {
	@Override
	public Integer insert(OrderDetail orderDetail) {
		getSession().persist(orderDetail);
		return 1;
	}

	@Override
	public List<OrderDetail> selectAll() {
		return null;
	}

	@Override
	public OrderDetail selectById(Integer id) {
		return null;
	}

	@Override
	public void update(Integer id, OrderDetail pojo) {
	}

	@Override
	public void deleteById(Integer id) {
	}

}
