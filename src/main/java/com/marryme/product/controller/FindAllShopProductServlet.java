package com.marryme.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.marryme.product.entity.Product;
import com.marryme.product.service.impl.ProductCategoryServiceImpl;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/findAllShopProduct")
public class FindAllShopProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductServiceImpl service;
	private ProductCategoryServiceImpl categoryService;

	@Override
	public void init() throws ServletException {
		service = new ProductServiceImpl();
		categoryService = new ProductCategoryServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String productCategoryIdParam = req.getParameter("productCategoryId");
		Integer productCategoryId = null;
		if (productCategoryIdParam != null && !productCategoryIdParam.isEmpty()) {
			try {
				productCategoryId = Integer.valueOf(productCategoryIdParam);
			} catch (NumberFormatException e) {
				// 轉換失敗，設定預設的產品類別編號
				productCategoryId = 1; // 預設的產品類別編號
			}
		} else {
			// 如果productCategoryId為null或空字串，也設定預設的產品類別編號
			productCategoryId = 1; // 預設的產品類別編號
		}

		List<Product> products = service.findAllByProductCategoryId(productCategoryId);
		String productCategoryName = categoryService.getCategoryNameByCategoryId(productCategoryId);

		resp.setContentType("application/json; charset=utf-8");
		try (PrintWriter out = resp.getWriter()) {
			// 創建一個用於存放 JSON 物件的列表
			List<Object> jsonObjects = new ArrayList<>();

			for (Product product : products) {
				// 創建包含商品資料的 JSON 物件
				String imageBase64 = getImageBase64(product.getProductId());
				String formattedPrice = formatPrice(product.getPlatformPrice());

				// 創建商品 JSON 物件
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("id", product.getProductId());
				jsonObject.addProperty("image", imageBase64);
				jsonObject.addProperty("title", product.getProductName());
				jsonObject.addProperty("vendorName", product.getVendor().getVendorName());
				jsonObject.addProperty("price", formattedPrice); // 格式化後的價格
				jsonObject.addProperty("platformPrice", product.getPlatformPrice()); // 原始價格
				jsonObject.addProperty("productCategoryName", productCategoryName);

				// 將商品 JSON 物件添加到列表中
				jsonObjects.add(jsonObject);
			}

			// 使用 Gson 將列表轉換成 JSON 格式並輸出到 PrintWriter
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String jsonResponse = gson.toJson(jsonObjects);
			out.println(jsonResponse);
		}
	}

	// 格式化價格，加上千分位
	private String formatPrice(double price) {
		// 使用 NumberFormat 將價格轉換為帶有千分位的字串
		java.text.NumberFormat format = java.text.NumberFormat.getInstance(java.util.Locale.TAIWAN);
		return format.format(price);
	}

	// 將圖片資料轉換為Base64編碼的字符串
	private String getImageBase64(Integer productId) {
		String imageBase64 = "";
		try {
			Optional<Product> product = service.getProductPic(productId);
			if (product.isPresent()) {
				byte[] imageData = product.get().getImage();
				if (imageData != null) {
					imageBase64 = Base64.getEncoder().encodeToString(imageData);
				} else {
					// 若該欄位無圖片則顯示預設圖片
					// 取得預設圖片的路徑
					String defaultImagePath = "/public/images/front-end/picture.png";
					File file = new File(getServletContext().getRealPath(defaultImagePath));
					byte[] defaultImage = FileUtils.readFileToByteArray(file);
					imageBase64 = Base64.getEncoder().encodeToString(defaultImage);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imageBase64;
	}
}