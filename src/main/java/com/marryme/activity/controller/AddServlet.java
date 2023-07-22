/**
 * @Author Jeanny
 * @Create 2023/7/20 01:01
 * @Version 3.0
 */

package com.marryme.activity.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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

@WebServlet("/activity/add")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);

		// 接收請求參數 - 輸入格式的錯誤處理
		String discountCode = req.getParameter("discountCode");
		String vendorId = req.getParameter("vendorId");
		String activityName = req.getParameter("activityName");
		BigDecimal discount = new BigDecimal(req.getParameter("discount"));
		Timestamp activityStartTime = null;
		Timestamp activityEndTime = null;
		try {
			String activityStartTimeString = req.getParameter("activityStartTime").trim();
			String activityEndTimeString = req.getParameter("activityEndTime").trim();
			activityStartTimeString = activityStartTimeString.replace("T", " "); // 將 "T" 替換為空格
			activityEndTimeString = activityEndTimeString.replace("T", " ");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			activityStartTime = new Timestamp(dateFormat.parse(activityStartTimeString).getTime());
			activityEndTime = new Timestamp(dateFormat.parse(activityEndTimeString).getTime());
		} catch (Exception e) {
			e.printStackTrace();
			activityStartTime = new Timestamp(System.currentTimeMillis());
			activityEndTime = new Timestamp(System.currentTimeMillis());
		}
		String activityDetail = req.getParameter("activityDetail");

		Activity vo = new Activity();
		vo.setDiscountCode(discountCode);
		vo.setVendorId(vendorId);
		vo.setActivityName(activityName);
		vo.setDiscount(discount);
		vo.setActivityStartTime(activityStartTime);
		vo.setActivityEndTime(activityEndTime);
		vo.setActivityDetail(activityDetail);

		// Send the use back to the form, if there were errors
		if (!errorMsgs.isEmpty()) {
			req.setAttribute("activity", vo); // 含有輸入格式錯誤的activity物件,也存入req
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/activity/addActivity.jsp");
			failureView.forward(req, res);
			return;
		}

		/*************************** 2.開始新增資料 ***************************************/
		ActivityServiceImpl service = new ActivityServiceImpl();
		Activity activity = service.add(vo);
//		Activity activity = service.getOne(discountCode);
		req.setAttribute("activity", activity);

		/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
		req.getRequestDispatcher("/front-end/vendor/activity/listOneActivity.jsp").forward(req, res);
	}
}
