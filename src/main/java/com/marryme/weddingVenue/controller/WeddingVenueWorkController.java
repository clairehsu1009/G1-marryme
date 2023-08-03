package com.marryme.weddingVenue.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.service.impl.WeddingVenueServiceImpl;
import com.marryme.weddingVenue.vo.WeddingVenue;



@WebServlet("/weddingVenueWork")
public class WeddingVenueWorkController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private WeddingVenueService service;
	
	@Override
	public void init() throws ServletException {
		service = new WeddingVenueServiceImpl();
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

   
        /*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
        req.setAttribute("weddingVenueWork", weddingVenueWork);
		String url = "/front-end/weddingVenue/weddingVenueWork.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 
		successView.forward(req, resp);
    }
	
	
}
