package com.marryme.weddingVenue.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.service.impl.WeddingVenueServiceImpl;

@WebServlet("/weddingVenuePicAll")
public class FindPicAllVenueController extends HttpServlet {
    private static final long serialVersionUID = 12L;

    private final WeddingVenueService service = new WeddingVenueServiceImpl();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("image/jpeg");

        
        String placeIdStr = req.getParameter("id");
        
       

        String imageIndexStr = req.getParameter("imageIndex"); // 從請求中獲取圖片索引
 
        byte[] objectData = null;

        if (placeIdStr != null) {
            try {
                int placeId = Integer.parseInt(placeIdStr);
                int imageIndex = Integer.parseInt(imageIndexStr);  // 將索引轉為整數

                Optional<List<byte[]>> optionalImages = service.findWeddingVenuePlacePicById(placeId);
                if (optionalImages.isPresent()) {
                    List<byte[]> images = optionalImages.get();
                    
//                    int size = images.size();
//                    resp.setContentType("text/plain");
//                    resp.getWriter().write(String.valueOf(size));

                    
                    if (imageIndex >= 0 && imageIndex < images.size()) {
                        objectData = images.get(imageIndex);  // 根據索引獲取圖片
                    }
                }

            } catch (NumberFormatException e) {
                // Ignore exception, we will use default image
            }
        }

        // 如果圖片數據為空，使用預設圖片
        if (objectData == null || objectData.length == 0) {
        	resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        	return;
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
