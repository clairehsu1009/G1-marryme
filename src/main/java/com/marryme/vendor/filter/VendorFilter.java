package com.marryme.vendor.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.vendor.vo.Vendor;

@WebFilter({
	"/front-end/vendor/vendorBasicinformation.jsp"
})
public class VendorFilter extends HttpFilter{
	
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		final Vendor vendor = (Vendor) request.getSession().getAttribute("vendor");
		if (vendor != null) {
			// 通過
			chain.doFilter(request, response);
		} else {
			// 跳至登入頁
			request.getRequestDispatcher("/front-end/user/userLogin.jsp").forward(request, response);
		}
	}

}
