package com.marryme.vendor.controller;

import static com.marryme.common.CommonString.UTF_8;

import java.io.IOException;

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
	        newVendor.setVendorLocation(null);
	        newVendor.setVendorWebsite(website);
	        newVendor.setVendorFb(facebook);
	        newVendor.setVendorIg(ig);
	        newVendor.setCompanyId(companyid);
	        newVendor.setContactPerson(person);
	        newVendor.setGooglemap(googlemap);
	        newVendor.setBasicIntroduction(basicIntroduction);
	       
	        
	        if (category != null && (category.equals("0") || category.equals("1"))) {
	        	newVendor.setManufacturerCategory(Integer.parseInt(category));
//	        } else {
	            // 若性別值無效，可以根據需求做相應處理，這裡假設性別值為 0 代表未選擇
//	        	newVendor.setManufacturerCategory(0);
	        }
	        
//	        if (location != null && (location.equals("10") || location.equals("11") || location.equals("12") || location.equals("13")
//	        		||location.equals("14")||location.equals("15")||location.equals("16")||location.equals("17")||location.equals("18")
//	        		||location.equals("19")||location.equals("20")||location.equals("21")||location.equals("22")||location.equals("23")
//	        		||location.equals("24")||location.equals("25")||location.equals("26")||location.equals("27")||location.equals("28")
//	        		||location.equals("29")||location.equals("30")||location.equals("31")||location.equals("32")||location.equals("33"))) {
//	            newVendor.setVendorLocation(Integer.parseInt(location));
//	        } else {
//	            newVendor.setVendorLocation(10); // 设置默认值为 10
//	        }

	        if (location != null && !location.isEmpty()) {
//	            int locationCode = Integer.parseInt(location);
	            newVendor.setVendorLocation(Integer.parseInt(location));
//	            VendorLocation vendorLocation = new VendorLocation();
//	            vendorLocation.setLocationCode(locationCode); // 设置数据库中的代号
//	            newVendor.setVendorLocation(vendorLocation);
	        }
//	        	vendor = service.edit(newVendor);
//	          session.setAttribute("vendor", newVendor);
//	            response.sendRedirect("../vendor/vendorMaterial"); 
	        Vendor updatedVendor = service.edit(newVendor);
            if (updatedVendor != null) {
                session.setAttribute("vendor", updatedVendor);
                response.sendRedirect("../vendor/vendorMaterial"); // 更新成功，重定向到供应商主页
            } else {
                // 更新失败，可以添加相应的处理，例如显示错误消息
                response.sendRedirect("https://www.google.com/"); // 重定向到之前的页面
            }
 
	          

	    }
	    }
}
