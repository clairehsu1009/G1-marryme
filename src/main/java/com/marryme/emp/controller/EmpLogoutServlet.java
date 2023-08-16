package com.marryme.emp.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/emp/empLogout")
public class EmpLogoutServlet extends HttpServlet{


	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();
		
		 HttpSession session = request.getSession();
	     session.removeAttribute("emp");

		
		response.sendRedirect("../emp/empLogin.jsp"); // 登入成功轉預覽首頁 待處理
	}



}
