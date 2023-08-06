package com.marryme.vendor.controller;

import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.common.CommonString.UTF_8;
import static com.marryme.vendor.util.Constants.VENDOR_REGISTER_PAGE;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.marryme.vendor.service.VendorService;
import com.marryme.vendor.service.Impl.VendorServiceImpl;
import com.marryme.vendor.vo.Vendor;



@WebServlet("/vendor/vendorRegister")
public class VendorRegisterServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	private final VendorService service = new VendorServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(UTF_8);
		Map<String, String> responseMsgMap = new HashMap<>();
		String account = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		String againpwd = request.getParameter("againpwd");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String phone = request.getParameter("phone");
		String location = request.getParameter("location");
		String companyid = request.getParameter("companyid");
		String contactperson = request.getParameter("contactperson");
		String basicintroduction = request.getParameter("basicintroduction");
		
		// 使用正規表達式來檢查帳號是否符合信箱格式
				String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
				if (!account.matches(emailRegex)) {
					// 帳號不符合信箱格式，你可以處理錯誤訊息或導向錯誤頁面
					// 這裡我們暫時將錯誤訊息寫到 responseMsgMap 中，你可以再做其他處理

					request.setAttribute("responseMsgMap", responseMsgMap);
					responseMsgMap.put(EXCEPTION, "帳號格式不正確，應為信箱格式");
					request.getRequestDispatcher(VENDOR_REGISTER_PAGE).forward(request, response);
			        return; // 終止處理
				}
		
				
				
				
				if (Objects.equals(pwd, againpwd)) {
					Vendor vendor = new Vendor();
					vendor.setVendorId(account);
					vendor.setVendorPassword(pwd);
					vendor.setVendorName(name);
//					vendor.setManufacturerCategory(null);
					vendor.setVendorPhone(phone);
//					vendor.setVendorLocation(null);
					vendor.setCompanyId(companyid);
					vendor.setContactPerson(contactperson);
					vendor.setBasicIntroduction(basicintroduction);
					vendor.setVendorRegistrationTime(LocalDate.now());
					
					
					if (category != null && (category.equals("1") || category.equals("2"))) {
					    vendor.setManufacturerCategory(Integer.parseInt(category));
					} else {
					    vendor.setManufacturerCategory(0); // 设置默认值为 0
					}
					
					   if (location != null && !location.isEmpty()) {
//				            int locationCode = Integer.parseInt(location);
				            vendor.setVendorLocation(Integer.parseInt(location));
//				            VendorLocation vendorLocation = new VendorLocation();
//				            vendorLocation.setLocationCode(locationCode); // 设置数据库中的代号
//				            newVendor.setVendorLocation(vendorLocation);
				        }
					
					
					

					Vendor registeredVendor = service.register(vendor); // 調用 register 方法進行註冊
					
					
					

					if (registeredVendor!= null) {
					    // 註冊成功
					    HttpSession session = request.getSession();
					    session.setAttribute("vendor", registeredVendor);
					    response.sendRedirect("../vendor/vendorMaterial"); // 註冊成功轉首頁
					} else {
					    // 註冊失敗，可以從 member 中取得錯誤訊息並進行相應處理
					    request.setAttribute("responseMsgMap", responseMsgMap);
					    responseMsgMap.put(EXCEPTION, "帳號已存在，註冊失敗");
					    request.getRequestDispatcher(VENDOR_REGISTER_PAGE).forward(request, response);
					}
				}		
		
		
	}
}