/**
 * @Author Jeanny
 * @Create 2023/7/21 23:30
 * @Version 3.0
 */

package com.marryme.activity.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.marryme.common.CommonString.ACTIVE;

import java.io.IOException;
import java.util.List;

import com.marryme.activity.entity.Activity;
import com.marryme.activity.service.ActivityService;
import com.marryme.activity.service.impl.ActivityServiceImpl;
import com.marryme.plan.vo.Item;

@WebServlet("/activity/findAll")
public class FindAllServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ActivityService service;

	@Override
	public void init() throws ServletException {
		service = new ActivityServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String vendorId = req.getParameter("vendorId");
		List<Activity> activityList = service.findAllByVendorIdAndStatus(vendorId, ACTIVE);
		req.setAttribute("activityList", activityList);
		req.getRequestDispatcher("/front-end/vendor/activity/listAllActivity.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
