/**
 * @Author Jeanny
 * @Create 2023/7/19 21:31
 * @Version 2.0
 */

package com.marryme.activity.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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

@WebServlet("/activity/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
	
	@Override
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
//		try {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
        String time = df.format(req.getParameter("activity_start_time").trim()); 
        activity_start_time = Timestamp.valueOf(time); 
        System.out.println(activity_start_time);
//			activity_start_time = Timestamp.valueOf(req.getParameter("activity_start_time").trim());
//			activity_end_time = Timestamp.valueOf(req.getParameter("activity_end_time").trim());
//		} catch (IllegalArgumentException e) {
//			activity_start_time = new Timestamp(System.currentTimeMillis());
//			activity_end_time = new Timestamp(System.currentTimeMillis());
//		}
//		
		System.out.println(activity_start_time);
		System.out.println(activity_end_time);
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
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/activity/updateActivity.jsp");
			failureView.forward(req, res);
			return;
		}

		/*************************** 2.開始修改資料 *****************************************/
		ActivityServiceImpl service = new ActivityServiceImpl();
		activity = service.updateActivity(discount_code, vendor_id, activity_name, discount, activity_start_time,
				activity_end_time, activity_detail);

		/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
		req.setAttribute("activity", activity); // 資料庫update成功後,正確的的activity物件,存入req
		String url = "/back-end/activity/listAllActivity.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneActivity.jsp
		successView.forward(req, res);
	}
}
