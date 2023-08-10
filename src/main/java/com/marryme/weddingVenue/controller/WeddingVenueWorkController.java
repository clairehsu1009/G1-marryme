package com.marryme.weddingVenue.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.marryme.plan.vo.Plan;
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

        
    
   
        /*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
        req.setAttribute("weddingVenueWork", weddingVenueWork);
        req.setAttribute("planList", planList);
        req.setAttribute("vendorId", vendorId);
		String url = "/front-end/weddingVenue/weddingVenueWork.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 
		successView.forward(req, resp);
		
		
    }
	
	
}
