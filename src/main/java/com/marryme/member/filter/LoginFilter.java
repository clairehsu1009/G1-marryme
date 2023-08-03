package com.marryme.member.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.member.vo.Member;

@WebFilter({
	"/front-end/user/userBasicinformation.jsp"
})
public class LoginFilter extends HttpFilter {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		final Member member = (Member) request.getSession().getAttribute("member");
		if (member != null) {
			// 通過
			chain.doFilter(request, response);
		} else {
			// 跳至登入頁
			request.getRequestDispatcher("/front-end/user/userLogin.jsp").forward(request, response);
		}
	}
}
