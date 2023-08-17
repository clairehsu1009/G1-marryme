package com.marryme.weddingVenue.controller;

import static com.marryme.common.CommonString.ACTIVE;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.Product;
import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.service.impl.WeddingVenueServiceImpl;
import com.marryme.product.service.ProductService;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/weddingProduct")
public class WeddingProductController extends HttpServlet{
	
		private static final long serialVersionUID = 12L;
	   private final WeddingVenueService service = new WeddingVenueServiceImpl();
	   private final ProductService productservice = new ProductServiceImpl();
	   
	   
	   
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		   
		   resp.setContentType("image/jpeg");

		    String productIdStr = req.getParameter("id");		    
		    byte[] objectData = null;

		    if (productIdStr != null) {
	            try {
	            	Integer productStatus = Integer.valueOf(req.getParameter("productStatus"));
	        		
	            	
	                int productId = Integer.parseInt(productIdStr);
	                List<Product> products = productservice.getProductByStatus(productStatus);

	                for (Product product : products) {
	                    if (product.getProductId() == productId) {
	                        objectData = product.getImage();
	                        break;
	                    }
	                }

	            } catch (NumberFormatException e) {
	                // Ignore exception, we will use default image
	            }
	        }

		    // Check if objectData is null or empty, if so, use default image
		    if (objectData == null || objectData.length == 0) {
		        String defaultImagePath = "/public/images/front-end/picture.png";
		        File file = new File(getServletContext().getRealPath(defaultImagePath));
		        try (FileInputStream fis = new FileInputStream(file)) {
		            objectData = fis.readAllBytes();
		        }
		    }

		    ServletOutputStream out = resp.getOutputStream();
		    out.write(objectData);
		    out.flush();
		    out.close();
		}

	   
	   
	   
	   
	   
	   
	   


	/**
     * 取得圖片寫出去顯示於jsp中
     * 若該欄位無圖片則顯示預設圖片
     * @param photo
     * @param out
     * @throws IOException
     */
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
