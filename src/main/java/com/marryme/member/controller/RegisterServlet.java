package com.marryme.member.controller;

import static com.marryme.member.util.CommonUtil.json2Pojo;
import static com.marryme.member.util.CommonUtil.writePojo2Json;
import static com.marryme.member.util.MemberConstants.SERVICE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.common.ControllerUtils;
import com.marryme.member.service.MemberService;
import com.marryme.member.util.CommonUtil;
import com.marryme.member.vo.Member;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet{
	
	private MemberService service;
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		Member member = json2Pojo(request, Member.class);
		if (member == null) {
			member = new Member();
			member.setMessage("無會員資訊");
			member.setSuccessful(false);
			writePojo2Json(response, member);
			return;
		}
		
		member = SERVICE.register(member);
		writePojo2Json(response, member);
	}
	

}
