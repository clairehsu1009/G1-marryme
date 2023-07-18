package marryme.activity.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import marryme.activity.service.ActivityServiceImpl;
import marryme.activity.vo.Activity;

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
		String discount_code = req.getParameter("discount_code");

		/*************************** 2.開始查詢資料 ****************************************/
		ActivityServiceImpl service = new ActivityServiceImpl();
		Activity activity = service.getOneActivity(discount_code);

		/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
		req.setAttribute("activity", activity); // 資料庫取出的activity物件,存入req
		String url = "/back-end/activity/updateActivity.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 updateActivity.jsp
		successView.forward(req, res);
	}
}
