package com.marryme.product.controller;

import static com.marryme.common.CommonString.ERROR_MSG;
import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.common.CommonString.INSERT_ERROR;
import static com.marryme.common.CommonString.INSERT_SUCCESS;
import static com.marryme.common.CommonString.RESPONSE_MSG_MAP;
import static com.marryme.common.CommonString.SUCCESS;
import static com.marryme.common.CommonString.UTF_8;
import static com.marryme.common.ControllerUtils.readPhotoToParameter;

import java.io.IOException;
import java.util.HashMap;
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
import com.marryme.product.service.ProductService;
import com.marryme.product.service.impl.ProductServiceImpl;

/**
 * @Author Jeanny
 * @Create 2023/7/24 22:02
 * @Version 1.0
 */

@WebServlet("/product/add")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 10 * 1024 * 1024)
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductService service;
    @Override
    public void init() throws ServletException {
        service = new ProductServiceImpl();
    }
    
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

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding(UTF_8);
		Map<String, String> responseMsgMap = new HashMap<>();
		req.setAttribute(RESPONSE_MSG_MAP, responseMsgMap);

		String vendorId = req.getParameter("vendorId");
		Integer productCategoryId = Integer.valueOf(req.getParameter("productCategoryId"));
		String productName = req.getParameter("productName");
		Integer originalPrice = Integer.valueOf(req.getParameter("originalPrice"));
		Integer platformPrice = Integer.valueOf(req.getParameter("platformPrice"));
		Integer stockQuantity = Integer.valueOf(req.getParameter("stockQuantity"));
		String productDescription = req.getParameter("productDescription");

		// 處理欄位檢核錯誤訊息
		Map<String, String> inValidFieldsMap = getInValidFieldsMsg();
		if (StringUtils.isBlank(vendorId)) {
			responseMsgMap.put(EXCEPTION, ERROR_MSG);
		}
//		if (StringUtils.isBlank(Integer.toString(productCategoryId))) {
//			responseMsgMap.put("productCategoryId", inValidFieldsMap.get("productCategoryId"));
//		}
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

		Product productVo = new Product();
		productVo.setVendorId(vendorId);
		productVo.setProductCategoryId(productCategoryId);
		productVo.setProductName(productName);
		productVo.setOriginalPrice(originalPrice);
		productVo.setPlatformPrice(platformPrice);
		productVo.setProductDescription(productDescription);
		productVo.setImage(readPhotoToParameter(part));
		//字段賦值
		productVo.setProductStatus(0);
		productVo.setStockQuantity(stockQuantity);
		if (!responseMsgMap.isEmpty()) {
			req.setAttribute("product", productVo);
			req.getRequestDispatcher("/front-end/vendor/product/addProduct.jsp").forward(req, res);
			return;
		}

		Integer id = service.add(productVo);
		if (id == null) {
			responseMsgMap.put(EXCEPTION, INSERT_ERROR);
			doGet(req, res);
			return;
		}
		responseMsgMap.put(SUCCESS, INSERT_SUCCESS);
		Integer productId = productVo.getProductId();
		Product product = service.getOne(productId);
		req.setAttribute("product", product);
		req.getRequestDispatcher("/front-end/vendor/product/listOneProduct.jsp").forward(req, res);
	}
}
