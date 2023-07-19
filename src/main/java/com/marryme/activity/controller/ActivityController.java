/**
 * @Author Jeanny
 * @Create 2023/7/19 21:31
 * @Version 2.0
 */

package com.marryme.activity.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


import com.marryme.activity.service.ActivityService;
import com.marryme.activity.service.ActivityServiceImpl;


@WebServlet("/activity")
public class ActivityController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ActivityService service;

	@Override
	public void init() throws ServletException {
		service = new ActivityServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		final var list = service.findAll();
		req.setAttribute("activityList", list);
		req.getRequestDispatcher("listAllActivity.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);

		
	}
}
