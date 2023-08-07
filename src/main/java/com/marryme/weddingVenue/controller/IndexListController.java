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
import com.marryme.product.entity.Product;
import com.marryme.product.service.ProductService;
import com.marryme.product.service.impl.ProductServiceImpl;



@WebServlet("/index")
public class IndexListController extends HttpServlet{
	
	private static final long serialVersionUID = 13L;
	private WeddingVenueService service;
	private PlanService planservice;
	private ProductService productservice;
	
	@Override
	public void init() throws ServletException {
		service = new WeddingVenueServiceImpl();
		planservice = new PlanServiceImpl();
		productservice = new ProductServiceImpl();

	}
	
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        List<WeddingVenue> weddingVenuesList = service.findAllAndStatus(ACTIVE);
	        req.setAttribute("weddingVenuesList", weddingVenuesList);
	        int totalVenues = weddingVenuesList.size();
            req.setAttribute("totalVenues", totalVenues);
         
            List<Plan> planAllList = service.findPlanAllAndStatus(ACTIVE);
            req.setAttribute("planAllList", planAllList);
            int totalPlanAlls = planAllList.size();
            req.setAttribute("totalPlanAlls", totalPlanAlls);
            
            
            List<Product> productAllList = service.findProductAllAndStatus(ACTIVE);
            req.setAttribute("productAllList", productAllList);
            int totalProductAlls = productAllList.size();
            req.setAttribute("totalProductAlls", totalProductAlls);
          
   
            
  
    	 List<WeddingVenue> currentWeddingVenuesList = weddingVenuesList.subList(0, 3);
           
            
            for (WeddingVenue venue : currentWeddingVenuesList) {
                int placeId = venue.getPlaceId();

                String vendorId = service.findVendorIdByPlaceId(placeId); 
                String location = service.findVendorLocationByPlaceId(vendorId);
                
                
              List<Plan> planList = planservice.findAllByVendorIdAndStatus(vendorId, ACTIVE);
      	      req.setAttribute("planList", planList);
      	      int totalPlans = planList.size();
              req.setAttribute("totalPlans", totalPlans);
              
              List<Product> productList = productservice.findAll();
              req.setAttribute("productList", productList);
              int totalProducts = productList.size();
              req.setAttribute("totalProducts", totalProducts);
                

                if (location == null) {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "未找到該供應商ID的位置");
                    return;
                }

              
                System.out.println("Location for vendor " + vendorId + ": " + location);
                req.setAttribute("location", location);

            }
        req.getRequestDispatcher("/front-end/weddingVenue/index.jsp").forward(req, resp);
	            
	 }   
	 
    	   
	 
	 
	 
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		    doGet(req, resp); // 重用doGet方法的邏輯
		}

}
