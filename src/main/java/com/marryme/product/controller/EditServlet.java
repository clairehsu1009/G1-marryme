/**
 * @Author Jeanny
 * @Create 2023/7/27 11:05
 * @Version 1.0
 */

package com.marryme.product.controller;

import static com.marryme.common.CommonString.ERROR_MSG;
import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.common.CommonString.RESPONSE_MSG_MAP;
import static com.marryme.common.CommonString.UPDATE_ERROR;
import static com.marryme.common.CommonString.UTF_8;
import static com.marryme.common.ControllerUtils.parameterMapToVo;
import static com.marryme.common.ControllerUtils.readPhotoToParameter;
import static com.marryme.common.ControllerUtils.validErrorForParameterMap;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.lang3.StringUtils;

import com.marryme.product.entity.Product;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/edit")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 10 * 1024
		* 1024)
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ProductServiceImpl service = new ProductServiceImpl();

	/** 要檢核的欄位與錯誤訊息 */
	private Map<String, String> getInValidFieldsMsg() {
		Map<String, String> inValidFieldsMsg = new HashMap<>();
		inValidFieldsMsg.put("productCategoryId", "請選擇商品類別");
		inValidFieldsMsg.put("productName", "請輸入商品名稱");
		inValidFieldsMsg.put("platformPrice", "請輸入平台售價");
		inValidFieldsMsg.put("stockQuantity", "請輸入庫存量");
		return inValidFieldsMsg;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding(UTF_8);
		Map<String, String> responseMsgMap = new HashMap<>();
		req.setAttribute(RESPONSE_MSG_MAP, responseMsgMap);

		Map<String, String[]> reqMap = req.getParameterMap();
		validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), responseMsgMap);

		String vendorId = req.getParameter("vendorId");
		String productName = req.getParameter("productName");
		Integer platformPrice = Integer.valueOf(req.getParameter("platformPrice"));
		Integer stockQuantity = Integer.valueOf(req.getParameter("stockQuantity"));
		
		// 處理欄位檢核錯誤訊息
		Map<String, String> inValidFieldsMap = getInValidFieldsMsg();
		if (StringUtils.isBlank(vendorId)) {
			responseMsgMap.put(EXCEPTION, ERROR_MSG);
		}
		if (StringUtils.isBlank(productName)) {
			responseMsgMap.put("productName", inValidFieldsMap.get("productName"));
		}
		if (StringUtils.isBlank(Integer.toString(platformPrice))) {
			responseMsgMap.put("platformPrice", inValidFieldsMap.get("platformPrice"));
		}
		if (StringUtils.isBlank(Integer.toString(stockQuantity))) {
			responseMsgMap.put("stockQuantity", inValidFieldsMap.get("stockQuantity"));
		}
		
		// 圖片處理
		Part part = req.getPart("image");

		// 最少上傳一張照片，檢核有沒有圖片
		if (part == null || part.getSize() == 0) {
			responseMsgMap.put("image", "請最少上傳一張圖片");
		}

		Product product = parameterMapToVo(reqMap, Product.class);
		if (!responseMsgMap.isEmpty()) {
			req.setAttribute("product", product);
			req.getRequestDispatcher("/front-end/vendor/product/editProduct.jsp").forward(req, res);
			return;
		}
		Integer productId = product.getProductId();
		product.setImage(readPhotoToParameter(part));
		boolean result = service.edit(productId, product);

		// 更新成功
		if (result) {
			Product productResult = service.getOne(productId);
			req.setAttribute("product", productResult);
			req.getRequestDispatcher("/front-end/vendor/product/listOneProduct.jsp").forward(req, res);
		} else {
			responseMsgMap.put(EXCEPTION, UPDATE_ERROR);
			vendorId = req.getParameter("vendorId");
			List<Product> productList = service.findAllByVendorId(vendorId);
			req.setAttribute("productList", productList);
			req.getRequestDispatcher("/front-end/vendor/product/listAllProduct.jsp").forward(req, res);
		}
	}
}
