package com.marryme.weddingVenue.controller;

import static com.marryme.common.CommonString.ACTIVE;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.service.impl.WeddingVenueServiceImpl;
import com.marryme.weddingVenue.vo.WeddingVenue;



@WebServlet("/weddingVenueList")
public class WeddingVenueListController extends HttpServlet{
	
	private static final long serialVersionUID = 13L;
	private WeddingVenueService service;
	@Override
	public void init() throws ServletException {
		service = new WeddingVenueServiceImpl();
	}
	

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<WeddingVenue> weddingVenuesList = service.findAllAndStatus(ACTIVE);
        req.setAttribute("weddingVenuesList", weddingVenuesList);
        req.getRequestDispatcher("/front-end/weddingVenue/weddingVenue.jsp").forward(req, resp);
    }
}
