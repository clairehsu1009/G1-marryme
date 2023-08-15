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

import com.marryme.weddingVenue.service.WeddingPlanService;
import com.marryme.weddingVenue.service.impl.WeddingPlanServiceImpl;
import com.marryme.plan.vo.Plan;


@WebServlet("/weddingPlanPic")
public class WeddingPlanPicController extends HttpServlet{
	private static final long serialVersionUID = 12L;
	   
	   private final WeddingPlanService service = new WeddingPlanServiceImpl();
	   


	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
	   
		   resp.setContentType("image/jpeg");

		    String placeIdStr = req.getParameter("id");
		    byte[] objectData = null;

		    if (placeIdStr != null) {
		        try {
		            int planProductId = Integer.parseInt(placeIdStr);

		            List<Plan> weddingPlanList = service.findAllAndStatus(ACTIVE);

		            if (planProductId > 0 && planProductId <= weddingPlanList.size()) {
		                objectData = weddingPlanList.get(planProductId - 1).getPlanPicture();
		                
		            }
		        } catch (NumberFormatException e) {
		            // Ignore exception, we will use default image
		        }
		    }

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
