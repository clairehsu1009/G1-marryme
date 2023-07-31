package com.marryme.product.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.Product;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/ProductShowPhoto")
public class ProductShowPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/*");
		Integer productId = Integer.parseInt(req.getParameter("productId"));

		if (productId != null) {
			ProductServiceImpl productSvc = new ProductServiceImpl();
			Optional<Product> productOpt = productSvc.getProductPic(productId);
			OutputStream out = res.getOutputStream();
			if (productOpt.isPresent() && productOpt.get().getImage() != null) {
				out.write(productOpt.get().getImage());
				out.flush();
				out.close();
			} else { 
				// 若該欄位無圖片則顯示預設圖片
				// 取得預設圖片的路徑
				String defaultImagePath = "/public/images/front-end/picture.png";
				byte[] defaultImage = null;
				File file = new File(getServletContext().getRealPath(defaultImagePath));
				FileInputStream fis = new FileInputStream(file);
				defaultImage = fis.readAllBytes();
				fis.close();
				if (defaultImage != null) {
					out.write(defaultImage);
					out.flush();
					out.close();
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
