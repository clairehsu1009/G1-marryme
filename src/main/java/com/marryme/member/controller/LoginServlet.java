package com.marryme.member.controller;
import static com.marryme.emp.util.Constants.EMP_MATERIAL_PAGE;
import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.member.util.Constants.USER_LOGIN_PAGE;
import static com.marryme.member.util.MemberConstants.SERVICE;
import static com.marryme.member.util.MemberConstants.SERVICE2;
import static com.marryme.member.util.MemberConstants.SERVICE3;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.marryme.emp.vo.Emp;
import com.marryme.member.vo.Member;
import com.marryme.vendor.vo.Vendor;

@WebServlet("/user/userLogin")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Map<String, String> responseMsgMap = new HashMap<>();
	Map<String, String> errorMap = new HashMap<>();
	Map<String, String> errorMsgMap = new HashMap<>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equals("memberLogin")) {
			String account = request.getParameter("memberAccount");
			String pwd = request.getParameter("memberPwd");
			Member member = new Member();
			member.setMemberId(account);
			member.setMemberPassword(pwd);
			boolean isLoginSuccessful = SERVICE.login(member);
			if (isLoginSuccessful) {
				HttpSession session = request.getSession();
				session.setAttribute("member", member);
				response.sendRedirect("../user/userMaterial"); // 登入成功轉預覽首頁 待處理
			} else {
				request.setAttribute("responseMsgMap", responseMsgMap);
				responseMsgMap.put(EXCEPTION, "會員登入失敗，請確認帳號密碼無誤");
				request.getRequestDispatcher(USER_LOGIN_PAGE + "#tab-1").forward(request, response);
			}
		} else if (action.equals("vendorLogin")) {
			String account = request.getParameter("vendorAccount");
			String pwd = request.getParameter("vendorPwd");
			Vendor vendor = new Vendor();
			vendor.setVendorId(account);
			vendor.setVendorPassword(pwd);
			boolean isLoginSuccessful = SERVICE2.login(vendor);
			if (isLoginSuccessful) {
				HttpSession session = request.getSession();
				session.setAttribute("vendor", vendor);
				response.sendRedirect("https://google.com"); // 登入成功轉預覽首頁 待處理
			} else {
				request.setAttribute("errorMap", errorMap);
				errorMap.put(EXCEPTION, "廠商登入失敗，請確認帳號密碼無誤");
				request.getRequestDispatcher(USER_LOGIN_PAGE + "#tab-2").forward(request, response);
			}
		} else if (action.equals("empLogin")) {
			String account = request.getParameter("empAccount");
			String pwd = request.getParameter("empPwd");
			Emp emp = new Emp();
			emp.setEmpEmail(account);
			emp.setEmpPassword(pwd);
			boolean isLoginSuccessful = SERVICE3.login(emp);
			if (isLoginSuccessful) {
				HttpSession session = request.getSession();
				session.setAttribute("emp", emp);
				response.sendRedirect("../emp/empMaterial"); // 登入成功轉預覽首頁 待處理
			} else {
				request.setAttribute("errorMsgMap", errorMsgMap);
				errorMsgMap.put(EXCEPTION, "平台登入失敗，請確認帳號密碼無誤");
				request.getRequestDispatcher(USER_LOGIN_PAGE + "#tab-3").forward(request, response);
			}
		}
	}
}
