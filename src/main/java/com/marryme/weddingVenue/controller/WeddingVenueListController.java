package com.marryme.weddingVenue.controller;

import static com.marryme.common.CommonString.ACTIVE;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.vendor.service.VendorService;
import com.marryme.vendor.service.Impl.VendorServiceImpl;
import com.marryme.vendor.vo.Vendor;
import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.service.impl.WeddingVenueServiceImpl;
import com.marryme.weddingVenue.vo.WeddingVenue;
import com.marryme.plan.service.PlanService;
import com.marryme.plan.service.impl.PlanServiceImpl;
import com.marryme.plan.vo.Plan;



@WebServlet("/weddingVenueList")
public class WeddingVenueListController extends HttpServlet{
	
	private static final long serialVersionUID = 13L;
	private WeddingVenueService service;
	private PlanService planservice;
	
	@Override
	public void init() throws ServletException {
		service = new WeddingVenueServiceImpl();
		planservice = new PlanServiceImpl();

	}
	
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        List<WeddingVenue> weddingVenuesList = service.findAllAndStatus(ACTIVE);
	        req.setAttribute("weddingVenuesList", weddingVenuesList);
	        int totalVenues = weddingVenuesList.size();
            req.setAttribute("totalVenues", totalVenues);
            
            
                             
	      
    	String pageStr = req.getParameter("page");
        int currentPage = 1; // 預設為第一頁
        if (pageStr != null) {
            try {
                currentPage = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                // 錯誤處理，例如設置為第一頁
                currentPage = 1;
            }
        }
        
        int itemsPerPage = 6;
        int startIndex = (currentPage - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, totalVenues);

        
        List<WeddingVenue> currentWeddingVenuesList = weddingVenuesList.subList(startIndex, endIndex);
        
        

        
        List<String> locations = new ArrayList<>();
        
        for (WeddingVenue venue : currentWeddingVenuesList) {
            int placeId = venue.getPlaceId();

            String vendorId = service.findVendorIdByPlaceId(placeId); 
            String location = service.findVendorLocationByPlaceId(vendorId);
            
            List<Plan> planList = planservice.findAllByVendorIdAndStatus(vendorId, ACTIVE);
    	      req.setAttribute("planList", planList);
    	      int totalPlans = planList.size();
            req.setAttribute("totalPlans", totalPlans);
            
            req.setAttribute("vendorName", venue.getVendor().getVendorName());


            if (location == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "未找到該供應商ID的位置");
                return;
            }

            
            req.setAttribute("location", location);

        }
        
        
        req.getRequestDispatcher("/front-end/weddingVenue/weddingVenue.jsp").forward(req, resp);
    }
	        
	    
    	   
	 
	 
	 
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		    doGet(req, resp); // 重用doGet方法的邏輯
		}

}
