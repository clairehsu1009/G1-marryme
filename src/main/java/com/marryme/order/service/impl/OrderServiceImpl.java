package com.marryme.order.service.impl;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.marryme.order.dao.OrderDao;
import com.marryme.order.dao.OrderDetailDao;
import com.marryme.order.dao.impl.OrderDaoImpl;
import com.marryme.order.dao.impl.OrderDetailDaoImpl;
import com.marryme.order.entity.Order;
import com.marryme.order.entity.OrderDetail;
import com.marryme.order.service.OrderService;
import com.marryme.product.entity.Cart;
import com.marryme.product.entity.CartItem;
import com.marryme.product.entity.Product;
import com.marryme.product.service.ProductService;
import com.marryme.product.service.impl.ProductServiceImpl;

public class OrderServiceImpl implements OrderService {

	private OrderDao dao;
	private OrderDetailDao daoDetail;
	private ProductService productSvc;

	public OrderServiceImpl() {
		dao = new OrderDaoImpl();
		daoDetail = new OrderDetailDaoImpl();
		productSvc = new ProductServiceImpl();
	}

	@Override
	public Order getOne(Integer orderId) {
		Order order = null;
		try {
			beginTransaction();
			order = dao.selectById(orderId);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public List<Order> getOrderByMemberId(String memberId, Integer orderStatus) {
		List<Order> orders = new ArrayList<>();
		try {
			beginTransaction();
			orders = dao.getOrderByMemberId(memberId, orderStatus);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public List<Order> getOrderByStatus(Integer orderStatus) {
		List<Order> orders = new ArrayList<>();
		try {
			beginTransaction();
			orders = dao.getOrderByStatus(orderStatus);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public List<Order> getOrderByStatusAndVendorId(String vendorId, Integer orderStatus) {
		List<Order> orders = new ArrayList<>();
		try {
			beginTransaction();
			orders = dao.getOrderByStatusAndVendorId(vendorId, orderStatus);
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public Set<OrderDetail> getDetailsById(Integer orderId) {
		return dao.getDetailsById(orderId);
	}

	@Override
	public boolean edit(Integer orderId, Order order) {
		boolean result = false;
		try {
			beginTransaction();
			dao.update(orderId, order);
			commit();
			result = true;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Order> createOrdersFromCart(Cart cart, String memberId, String recipientName, String recipientPhone,
			String recipientAddress, int paymentMethod, HttpServletRequest req) {
		try {
			List<Order> orders = new ArrayList<>();

			Map<String, List<CartItem>> itemsByVendor = new HashMap<>();
			for (CartItem item : cart.getItems()) {
				String vendorId = item.getVendorId();
				itemsByVendor.computeIfAbsent(vendorId, k -> new ArrayList<>()).add(item);
			}

			Map<Order, List<OrderDetail>> orderToDetailsMap = new HashMap<>();
			for (Map.Entry<String, List<CartItem>> entry : itemsByVendor.entrySet()) {
				String vendorId = entry.getKey();
				List<CartItem> itemsForVendor = entry.getValue();

				Order order = new Order();
				order.setMemberId(memberId);
				order.setRecipientName(recipientName);
				order.setRecipientPhone(recipientPhone);
				order.setRecipientAddress(recipientAddress);
				order.setOrderStatus(1);
				order.setOrderDate(new Timestamp(System.currentTimeMillis()));
				order.setPaymentMethod(paymentMethod);
				// 設定付款截止日期為7天後
				LocalDate today = LocalDate.now();
				LocalDate paymentDeadline = today.plusDays(7);

				// 將LocalDate轉換為Timestamp
				Timestamp paymentDeadlineTimestamp = Timestamp.valueOf(paymentDeadline.atStartOfDay());
				order.setPaymentState(0); // 預設為已成立(0)
				order.setPaymentDeadline(paymentDeadlineTimestamp);
				order.setVendorId(vendorId);
				order.setShippingFee(120);

				int totalAmount = calculateTotalAmount(itemsForVendor, order);
				order.setTotalAmount(totalAmount);

				orders.add(order);

				List<OrderDetail> orderDetails = new ArrayList<>();
				for (CartItem item : itemsForVendor) {
					OrderDetail orderDetail = new OrderDetail();
					orderDetail.setProduct(item.getProduct());
					orderDetail.setProductId(item.getProduct().getProductId());
					orderDetail.setQuantity(item.getQuantity());
					orderDetail.setAmount(item.getPrice());
					orderDetails.add(orderDetail);
				}
				orderToDetailsMap.put(order, orderDetails); // 將Order和OrderDetail列表存儲在Map中

			}

			try {
				// 開始一個外部事務
				beginTransaction();

				List<Integer> generatedOrderIds = new ArrayList<>();
				for (Order order : orders) {
					dao.insert(order);
					generatedOrderIds.add(order.getOrderId());
				}

				for (int i = 0; i < orders.size(); i++) {
					Order order = orders.get(i);
					List<OrderDetail> orderDetails = orderToDetailsMap.get(order);
					for (OrderDetail orderDetail : orderDetails) {
						orderDetail.setOrder(order);
						orderDetail.setOrderId(generatedOrderIds.get(i));
						daoDetail.insert(orderDetail);

						Product product = orderDetail.getProduct();
						int quantity = orderDetail.getQuantity();
						productSvc.updateProductStock(product.getProductId(), quantity);
					}
				}
				commit();
				// 呼叫 ProductService 的 clearCart 方法來清空購物車
				clearCart(cart, req);
			} catch (Exception e) {
				rollback();
				e.printStackTrace();
			}
			return orders;
		} catch (Exception e) {
			throw new RuntimeException("建立訂單失敗", e);
		}
	}

	private int calculateTotalAmount(List<CartItem> items, Order order) {
		int totalAmount = 0;
		for (CartItem item : items) {
			totalAmount += item.getPrice();
		}
		totalAmount += order.getShippingFee();
		return totalAmount;
	}

	private void clearCart(Cart cart, HttpServletRequest req) {
		// 呼叫 ProductService 的 clearCart 方法
		try {
			productSvc.clearCart(cart);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 從 session 中移除購物車相關數據
		HttpSession session = req.getSession();
		session.removeAttribute("cart");
	}

}
