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

import com.marryme.activity.service.ActivityServiceImpl;

@WebServlet("/activity/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);

			/***************************1.接收請求參數***************************************/
			String discount_code = req.getParameter("discount_code");
			
			/***************************2.開始刪除資料***************************************/
			ActivityServiceImpl service = new ActivityServiceImpl();
			service.deleteActivity(discount_code);
			
			/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
			String url = "/back-end/activity/listAllActivity.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
	}

}
