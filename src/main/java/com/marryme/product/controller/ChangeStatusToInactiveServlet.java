package com.marryme.product.controller;

import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.common.CommonString.RESPONSE_MSG_MAP;
import static com.marryme.common.CommonString.SUCCESS;
import static com.marryme.common.CommonString.UTF_8;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.marryme.product.entity.Product;
import com.marryme.product.service.ProductService;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/changeStatusToInactive")
public class ChangeStatusToInactiveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductService service;

	@Override
	public void init() throws ServletException {
		service = new ProductServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding(UTF_8);
		Map<String, String> responseMsgMap = new HashMap<>();
		req.setAttribute(RESPONSE_MSG_MAP, responseMsgMap);
		/** 修改狀態為下架 */
		String productId = req.getParameter("productId");
		boolean result = false;
		if (StringUtils.isNotBlank(productId)) {
			result = service.changeStatusToInactive(Integer.valueOf(productId));
		}
		// 如果更新失敗，紀錄錯誤訊息
		if (result) {
			responseMsgMap.put(SUCCESS, "商品下架成功");
		} else {
			responseMsgMap.put(EXCEPTION, "商品下架失敗");
		}
		// 回到list清單頁
		String vendorId = req.getParameter("vendorId");
		List<Product> productList = service.findAllByVendorId(vendorId);
		req.setAttribute("productList", productList);
		req.getRequestDispatcher("/front-end/vendor/product/listAllProduct.jsp").forward(req, res);
	}
}
