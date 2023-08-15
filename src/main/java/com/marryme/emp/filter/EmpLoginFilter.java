package com.marryme.emp.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.emp.vo.Emp;



@WebFilter({
	"/back-end/emp/empMaterial.jsp"
})

public class EmpLoginFilter extends HttpFilter {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		final Emp emp = (Emp) request.getSession().getAttribute("emp");
		if (emp != null) {
			// 通過
			chain.doFilter(request, response);
		} else {
			// 跳至登入頁
			request.getRequestDispatcher("/back-end/emp/empLogin.jsp").forward(request, response);
		}
	}

}
