/**
 * @Author Jeanny
 * @Create 2023/7/19 21:31
 * @Version 2.0
 */

package com.marryme.activity.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.activity.entity.Activity;
import com.marryme.activity.service.impl.ActivityServiceImpl;

@WebServlet("/activity/getOneForUpdate")
public class GetOneForUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);

		/*************************** 1.接收請求參數 ****************************************/
		String discountCode = req.getParameter("discountCode");

		/*************************** 2.開始查詢資料 ****************************************/
		ActivityServiceImpl service = new ActivityServiceImpl();
		Activity activity = service.getOne(discountCode);

		/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
		req.setAttribute("activity", activity); // 資料庫取出的activity物件,存入req
		String url = "/back-end/activity/updateActivity.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 updateActivity.jsp
		successView.forward(req, res);
	}
}
