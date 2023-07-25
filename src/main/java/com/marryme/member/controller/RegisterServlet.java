package com.marryme.member.controller;

import static com.marryme.member.util.MemberConstants.SERVICE;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.member.service.MemberService;
import com.marryme.member.vo.Member;

@WebServlet("/user/userRegister")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String account = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		String againpwd = request.getParameter("againpwd");
		if (Objects.equals(pwd, againpwd)) {
			Member member = new Member();
			member.setMemberId(account);
			member.setMemberPassword(pwd);
			member = SERVICE.register(member);
			response.sendRedirect("userMaterial.jsp");// 註冊成功轉預覽首頁
		} else {
			request.getRequestDispatcher("userRegister.jsp").forward(request, response);// 如果註冊失敗就在原畫面
		}
	}
}
