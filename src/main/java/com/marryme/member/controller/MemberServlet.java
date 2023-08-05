package com.marryme.member.controller;

import static com.marryme.member.util.MemberConstants.SERVICE;
import static com.marryme.member.util.Constants.USER_MATERIAL_PAGE;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.member.vo.Member;

@WebServlet("/user/userMaterial")
public class MemberServlet extends HttpServlet{
	
private static final long serialVersionUID = 1L;

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Member> memberList = SERVICE.findAll();
		request.setAttribute("memberList", memberList);
		request.getRequestDispatcher(USER_MATERIAL_PAGE).forward(request, response);
	}

}
