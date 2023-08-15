package com.marryme.vendor.controller;

import static com.marryme.common.CommonString.SUCCESS;
import static com.marryme.common.CommonString.UTF_8;
import static com.marryme.vendor.util.Constants.VENDOR_BASICINFORMATION_PAGE;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.marryme.vendor.service.VendorService;
import com.marryme.vendor.service.Impl.VendorServiceImpl;
import com.marryme.vendor.vo.Vendor;

@WebServlet("/vendor/vendorBasicinformation")
public class VendorBasicinformationServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private final VendorService service = new VendorServiceImpl();
	Map<String, String> responseMsgMap = new HashMap<>();

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	     request.setCharacterEncoding(UTF_8);
	     HttpSession session = request.getSession();
	     Vendor vendor = (Vendor) session.getAttribute("vendor");
	    if (vendor != null) {	    	
	        String pwd = request.getParameter("pwd");
	        String name = request.getParameter("name");
	        String phone = request.getParameter("phone");
	        String category = request.getParameter("category");
	        String address = request.getParameter("address");
	        String location = request.getParameter("location"); // 取得選擇的性別值
	        String companyid = request.getParameter("companyid");
	        String person = request.getParameter("person");
	        String website = request.getParameter("website");
	        String facebook = request.getParameter("facebook");
	        String ig = request.getParameter("ig"); // 取得選擇的性別值
	        String googlemap = request.getParameter("googlemap");
	        String basicIntroduction = request.getParameter("basicIntroduction");
	     
	     

	        // 創建一個新的Member物件，並設定其屬性
	        Vendor newVendor = new Vendor();
	        newVendor.setVendorId(vendor.getVendorId());
	        newVendor.setVendorPassword(pwd);
	        newVendor.setVendorName(name);
	        newVendor.setVendorPhone(phone);
	        newVendor.setVendorAddress(address);
	        newVendor.setVendorLocation(location);
	        newVendor.setVendorWebsite(website);
	        newVendor.setVendorFb(facebook);
	        newVendor.setVendorIg(ig);
	        newVendor.setCompanyId(companyid);
	        newVendor.setContactPerson(person);
	        newVendor.setGooglemap(googlemap);
	        newVendor.setBasicIntroduction(basicIntroduction);
	       
	        
	        if (category != null && (category.equals("0") || category.equals("1"))) {
	        	newVendor.setManufacturerCategory(Integer.parseInt(category));
	        }
	        
//	        Vendor updatedVendor = service.edit(newVendor);
	        vendor = service.edit(newVendor);
//            if (updatedVendor != null) {
                session.setAttribute("vendor", newVendor);
                request.setAttribute("responseMsgMap", responseMsgMap);
    	        responseMsgMap.put(SUCCESS, "資料已更新成功");
    	        RequestDispatcher dispatcher = request.getRequestDispatcher("/front-end/vendor/vendorBasicinformation.jsp");
    	        dispatcher.forward(request, response);
//                response.sendRedirect("../index"); // 更新成功，重定向到供应商主页
//                request.getRequestDispatcher(VENDOR_BASICINFORMATION_PAGE).forward(request, response);
//            } else {
                // 更新失败，可以添加相应的处理，例如显示错误消息
//                response.sendRedirect("https://www.google.com/"); // 重定向到之前的页面
//            }
 
	          

	    }
	    }

}
