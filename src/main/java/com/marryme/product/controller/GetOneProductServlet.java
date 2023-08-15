package com.marryme.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.marryme.product.entity.Product;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/getOneChat")
public class GetOneProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductServiceImpl service;

	@Override
	public void init() throws ServletException {
		service = new ProductServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 測試用 之後上線要刪除
		resp.setHeader("Access-Control-Allow-Origin", "*"); // 允許來自所有網域的請求
		resp.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE"); // 允許的 HTTP 方法
		resp.setHeader("Access-Control-Allow-Headers", "Content-Type"); // 允許的請求Header
		resp.setHeader("Access-Control-Allow-Credentials", "true"); // 是否允許帶有憑證的請求

		String productIdParam = req.getParameter("productId");
		if (productIdParam == null || productIdParam.isEmpty()) {
			// 如果沒有提供productId參數，返回錯誤訊息
			resp.setContentType("application/json; charset=utf-8");
			JsonObject errorResponse = new JsonObject();
			errorResponse.addProperty("error", "productId parameter is missing.");
			try (PrintWriter out = resp.getWriter()) {
				out.println(errorResponse.toString());
			}
			return;
		}

		try {
			Integer productId = Integer.parseInt(productIdParam);
			Optional<Product> product = service.getProductPic(productId);

			resp.setContentType("application/json; charset=utf-8");
			try (PrintWriter out = resp.getWriter()) {
				if (product.isPresent()) {
					Product foundProduct = product.get();
					String imageBase64 = getImageBase64(foundProduct.getImage());

					JsonObject jsonObject = new JsonObject();
					jsonObject.addProperty("id", foundProduct.getProductId());
					jsonObject.addProperty("image", imageBase64);
					jsonObject.addProperty("title", foundProduct.getProductName());
					jsonObject.addProperty("price", formatPrice(foundProduct.getPlatformPrice()));

					Gson gson = new GsonBuilder().setPrettyPrinting().create();
					out.println(gson.toJson(jsonObject));
				} else {
					// 若找不到對應的商品，返回錯誤訊息
					JsonObject errorResponse = new JsonObject();
					errorResponse.addProperty("error", "Product not found.");
					out.println(errorResponse.toString());
				}
			}
		} catch (NumberFormatException e) {
			// 如果productId參數無效，返回錯誤訊息
			resp.setContentType("application/json; charset=utf-8");
			JsonObject errorResponse = new JsonObject();
			errorResponse.addProperty("error", "Invalid productId parameter.");
			try (PrintWriter out = resp.getWriter()) {
				out.println(errorResponse.toString());
			}
		}
	}

	// 格式化價格，加上千分位
	private String formatPrice(double price) {
		// 使用 NumberFormat 將價格轉換為帶有千分位的字串
		java.text.NumberFormat format = java.text.NumberFormat.getInstance(java.util.Locale.TAIWAN);
		return format.format(price);
	}

	// 將圖片資料轉換為Base64編碼的字符串
	private String getImageBase64(byte[] imageData) {
		String imageBase64 = "";
		if (imageData != null) {
			imageBase64 = Base64.getEncoder().encodeToString(imageData);
		} else {
			// 若該欄位無圖片則顯示預設圖片
			// 取得預設圖片的路徑
			String defaultImagePath = "/public/images/front-end/picture.png";
			try {
				byte[] defaultImage = getServletContext().getResourceAsStream(defaultImagePath).readAllBytes();
				imageBase64 = Base64.getEncoder().encodeToString(defaultImage);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return imageBase64;
	}
}
