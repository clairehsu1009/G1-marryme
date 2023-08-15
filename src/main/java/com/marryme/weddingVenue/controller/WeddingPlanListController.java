package com.marryme.weddingVenue.controller;

import static com.marryme.common.CommonString.ACTIVE;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.weddingVenue.service.WeddingPlanService;
import com.marryme.weddingVenue.service.impl.WeddingPlanServiceImpl;
import com.marryme.plan.vo.Plan;


@WebServlet("/weddingPlanList")
public class WeddingPlanListController extends HttpServlet{

	private static final long serialVersionUID = 13L;
	private WeddingPlanService service;
	
	@Override
	public void init() throws ServletException {
		service = new WeddingPlanServiceImpl();
	}
	

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Plan> weddingPlanList = service.findAllAndStatus(ACTIVE);
        req.setAttribute("weddingPlanList", weddingPlanList);
        int totalPlans = weddingPlanList.size();
        req.setAttribute("totalPlans", totalPlans);
        req.getRequestDispatcher("/front-end/weddingVenue/weddingVenuePlan.jsp").forward(req, resp);
    }
}
