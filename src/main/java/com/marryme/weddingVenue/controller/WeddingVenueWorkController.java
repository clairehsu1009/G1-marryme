package com.marryme.weddingVenue.controller;

import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.marryme.plan.vo.Plan;
import com.marryme.vendor.service.VendorService;
import com.marryme.vendor.service.Impl.VendorServiceImpl;
import com.marryme.vendor.vo.Vendor;
import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.service.impl.WeddingVenueServiceImpl;
import com.marryme.weddingVenue.vo.WeddingVenue;
import com.marryme.plan.service.PlanService;
import com.marryme.plan.service.impl.PlanServiceImpl;



@WebServlet("/weddingVenueWork")
public class WeddingVenueWorkController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private WeddingVenueService service;
	private PlanService planService;
	
	
	@Override
	public void init() throws ServletException {
		service = new WeddingVenueServiceImpl();
		planService= new PlanServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer placeId = null;
	    

	    try {
	        placeId = Integer.valueOf(req.getParameter("id"));
	    } catch (NumberFormatException e) {
	    	placeId = 2;  // 設置預設值
	    }
	    
        WeddingVenue weddingVenueWork = service.getOne(placeId);
        
        String vendorId = service.findVendorIdByPlaceId(placeId);
        
        List<Plan> planList = planService.findAllByVendorId(vendorId);
        

        /******************************取得經緯度*****************************/
        
        List<Vendor> vendorList = service.findVendorAllByVendorId(vendorId);
        req.setAttribute("vendorList", vendorList);
        
        //  用 getGooglemap() 方法來取得 Google Maps 的 URL
        String googleMap = vendorList.get(0).getGooglemap();

        String latitude = "";
        String longitude = "";

        // 第一種模式：ll=
        Pattern pattern1 = Pattern.compile("ll=([-\\d.]+),([-\\d.]+)");
        Matcher matcher1 = pattern1.matcher(googleMap);

        // 第二種模式：/@
        Pattern pattern2 = Pattern.compile("/@([-\\d.]+),([-\\d.]+),");
        Matcher matcher2 = pattern2.matcher(googleMap);

        if (matcher1.find()) {
            latitude = matcher1.group(1);
            longitude = matcher1.group(2);
        } else if (matcher2.find()) {
            latitude = matcher2.group(1);
            longitude = matcher2.group(2);
        }

        req.setAttribute("latitude", latitude);
        req.setAttribute("longitude", longitude);
        
        req.setAttribute("googleMap", googleMap);
   
        /*************************** 3.查詢完成,準備轉交 ************/
        req.setAttribute("weddingVenueWork", weddingVenueWork);
        req.setAttribute("planList", planList);
        req.setAttribute("vendorId", vendorId);       
		String url = "/front-end/weddingVenue/weddingVenueWork.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 
		successView.forward(req, resp);
		
		
    }
	
	
}
