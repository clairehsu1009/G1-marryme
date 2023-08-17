package com.marryme.weddingVenue.controller;

import static com.marryme.common.CommonString.ACTIVE;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.service.impl.WeddingVenueServiceImpl;
import com.marryme.weddingVenue.vo.WeddingVenue;
import com.marryme.plan.service.PlanService;
import com.marryme.plan.service.impl.PlanServiceImpl;
import com.marryme.plan.vo.Plan;
import com.marryme.product.entity.Product;
import com.marryme.product.service.ProductService;
import com.marryme.product.service.impl.ProductServiceImpl;
import com.marryme.vendor.vo.Vendor;



@WebServlet("/index")
public class IndexListController extends HttpServlet{
	
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
         
            List<Plan> planList = service.findPlanAllAndStatus(ACTIVE);
            req.setAttribute("planList", planList);
            int totalPlanAlls = planList.size();
            req.setAttribute("totalPlanAlls", totalPlanAlls);
            
            
            List<Product> productAllList = service.findProductAllAndStatus(ACTIVE);
            req.setAttribute("productAllList", productAllList);
            int totalProductAlls = productAllList.size();
            req.setAttribute("totalProductAlls", totalProductAlls);
            
  
    	 List<WeddingVenue> currentWeddingVenuesList = weddingVenuesList.subList(0, 4);
    	 
         Map<WeddingVenue, String> venueToVendorName = new HashMap<>();
         Map<WeddingVenue, String> venueToLocation = new HashMap<>();
         Map<WeddingVenue, Integer> venueToTotalPlansMap = new HashMap<>();
         Map<Product, String> productToVendorName = new HashMap<>();
         
         
         for (Product product : productAllList) {
        	    Vendor vendor = product.getVendor();
        	    if (vendor != null) {  
        	        String vendorName = vendor.getVendorName();
        	        productToVendorName.put(product, vendorName);
        	    }
        	}

         req.setAttribute("productToVendorName", productToVendorName);

           
            
            for (WeddingVenue venue : currentWeddingVenuesList) {
                int placeId = venue.getPlaceId();

                String vendorId = service.findVendorIdByPlaceId(placeId); 
                String location = service.findVendorLocationByPlaceId(vendorId);
                String vendorName = venue.getVendor().getVendorName();
                
              List<Plan> planListByVendor = planservice.findAllByVendorIdAndStatus(vendorId, ACTIVE);
              
            
              int totalPlansForCurrentVenue = planListByVendor.size();
              System.out.println(totalPlansForCurrentVenue);
              venueToTotalPlansMap.put(venue, totalPlansForCurrentVenue);
    
              
              venueToVendorName.put(venue, vendorName);
              venueToLocation.put(venue, location);
              
              req.setAttribute("venueToVendorName", venueToVendorName);
              req.setAttribute("venueToLocation", venueToLocation);
              req.setAttribute("venueToTotalPlansMap", venueToTotalPlansMap);

                if (location == null) {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "未找到該供應商ID的位置");
                    return;
                }

              

            }
        req.getRequestDispatcher("/front-end/index.jsp").forward(req, resp);
	            
	 }   
	 
    	   
	 
	 
	 
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		    doGet(req, resp); // 重用doGet方法的邏輯
		}

}
