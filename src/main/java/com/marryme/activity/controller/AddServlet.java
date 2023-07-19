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

import com.marryme.activity.service.ActivityServiceImpl;
import com.marryme.activity.vo.Activity;


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
		String discount_code = req.getParameter("discount_code");
		String vendor_id = req.getParameter("vendor_id");
		String activity_name = req.getParameter("activity_name");
		BigDecimal discount = new BigDecimal(req.getParameter("discount"));
		Timestamp activity_start_time = null;
		Timestamp activity_end_time = null;
		try {
			String activity_start_time_string = req.getParameter("activity_start_time").trim();
			String activity_end_time_string = req.getParameter("activity_end_time").trim();
			activity_start_time_string = activity_start_time_string.replace("T", " ");  // 將 "T" 替換為空格
			activity_end_time_string = activity_end_time_string.replace("T", " ");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			activity_start_time = new Timestamp(dateFormat.parse(activity_start_time_string).getTime());
			activity_end_time = new Timestamp(dateFormat.parse(activity_end_time_string).getTime());
		} catch (Exception e) {
			activity_start_time = new Timestamp(System.currentTimeMillis());
			activity_end_time = new Timestamp(System.currentTimeMillis());
		}
		String activity_detail = req.getParameter("activity_detail");

		Activity activity = new Activity();
		activity.setDiscount_code(discount_code);
		activity.setVendor_id(vendor_id);
		activity.setActivity_name(activity_name);
		activity.setDiscount(discount);
		activity.setActivity_start_time(activity_start_time);
		activity.setActivity_end_time(activity_end_time);
		activity.setActivity_detail(activity_detail);
		
		// Send the use back to the form, if there were errors
		if (!errorMsgs.isEmpty()) {
			req.setAttribute("activity", activity); // 含有輸入格式錯誤的activity物件,也存入req
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/activity/addActivity.jsp");
			failureView.forward(req, res);
			return;
		}

		/*************************** 2.開始新增資料 ***************************************/
		ActivityServiceImpl service = new ActivityServiceImpl();
		activity = service.addActivity(discount_code, vendor_id, activity_name, discount, activity_start_time, activity_end_time, activity_detail);

		/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
		String url = "/back-end/activity/listAllActivity.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllActivity.jsp
		successView.forward(req, res);
	}
}
