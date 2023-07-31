package com.marryme.vendor.controller;

import static com.marryme.vendor.util.Constants.VENDOR_MATERIAL_PAGE;
import static com.marryme.vendor.util.VendorConstants.SERVICE;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.vendor.vo.Vendor;

@WebServlet("/vendor/vendorMaterial")
public class VendorServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Vendor> vendorList = SERVICE.findAll();
		request.setAttribute("vendorList", vendorList);
		request.getRequestDispatcher(VENDOR_MATERIAL_PAGE).forward(request, response);
	}
	

}
