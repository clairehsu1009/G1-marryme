package com.marryme.member.controller;

import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.member.util.Constants.USER_LOGIN_PAGE;
import static com.marryme.member.util.MemberConstants.SERVICE;
import static com.marryme.member.util.MemberConstants.SERVICE2;
import static com.marryme.member.util.MemberConstants.SERVICE3;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.marryme.emp.vo.Emp;
import com.marryme.member.vo.Member;
import com.marryme.vendor.vo.Vendor;

@WebServlet("/user/userLogin")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Map<String, String> responseMsgMap = new HashMap<>();
	Map<String, String> errorMap = new HashMap<>();
	Map<String, String> errorMsgMap = new HashMap<>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equals("memberLogin")) {
			String account = request.getParameter("memberAccount");
			String pwd = request.getParameter("memberPwd");
			HttpSession session = request.getSession();
			 // 如果已有使用者登入，先執行登出操作
		    if (session.getAttribute("vendor") != null || session.getAttribute("member") != null) {
		        session.invalidate(); // 執行登出操作，使原使用者登出並清除資料
		        session = request.getSession(); //重新獲取新的session
		    }
//			String account = request.getParameter("memberAccount");
//			String pwd = request.getParameter("memberPwd");
//			// 對輸入的密碼進行 SHA-256 加密
//		    String encryptedPassword = encryptPassword(pwd);
			Member member = new Member();			
			member.setMemberId(account);
			String encryptedPassword = encryptPassword(pwd);
			// 對輸入的密碼進行 SHA-256 加密
//		    String encryptedPassword = encryptPassword(pwd);
			member.setMemberPassword(encryptedPassword);
			Member loggedInMember = SERVICE.login(member);
			if (loggedInMember != null && loggedInMember.getMemberPassword().equals(encryptedPassword)) {
//			if (loggedInMember != null) {
			    session.setAttribute("member", loggedInMember);
			    response.sendRedirect("../index"); // 登入成功轉預覽首頁 待處理
			} else  {
				 member.setMemberPassword(pwd);
			     loggedInMember = SERVICE.login(member);
			     if (loggedInMember != null) {
					    session.setAttribute("member", loggedInMember);
					    response.sendRedirect("../index"); // 登入成功轉預覽首頁 待處理  
			     } else  {
				request.setAttribute("responseMsgMap", responseMsgMap);
				responseMsgMap.put(EXCEPTION, "會員登入失敗，請確認帳號密碼無誤");
				request.getRequestDispatcher(USER_LOGIN_PAGE + "#tab-1").forward(request, response);
			}
			}
		} else if (action.equals("vendorLogin")) {
			String account = request.getParameter("vendorAccount");
			String pwd = request.getParameter("vendorPwd");
			HttpSession session = request.getSession();
			 // 如果已有使用者登入，先執行登出操作
		    if (session.getAttribute("vendor") != null || session.getAttribute("member") != null) {
		        session.invalidate(); // 執行登出操作，使原使用者登出並清除資料
		        session = request.getSession(); //重新獲取新的session
		    }
		    Vendor vendor = new Vendor();
		    vendor.setVendorId(account);
			// 對輸入的密碼進行 SHA-256 加密
		    String encryptedPassword = encryptPassword(pwd);
			vendor.setVendorPassword(encryptedPassword);
			Vendor loggedInVendor = SERVICE2.login(vendor);
			if (loggedInVendor != null && loggedInVendor.getVendorPassword().equals(encryptedPassword)) {
//			if (loggedInVendor != null) {
			    session.setAttribute("vendor", loggedInVendor);
				response.sendRedirect("../index"); // 登入成功轉預覽首頁 待處理
			} else {
				 vendor.setVendorPassword(pwd);
				 loggedInVendor = SERVICE2.login(vendor);
				 if (loggedInVendor != null) {
					    session.setAttribute("vendor", loggedInVendor);
					    response.sendRedirect("../index"); // 登入成功轉預覽首頁 待處理  
				 } else {
				request.setAttribute("errorMap", errorMap);
				errorMap.put(EXCEPTION, "廠商登入失敗，請確認帳號密碼無誤");
				request.getRequestDispatcher(USER_LOGIN_PAGE + "#tab-2").forward(request, response);
			}
			}			 
//			 Integer manufacturerCategory = loggedInVendor.getManufacturerCategory();
//		        
//		        if (manufacturerCategory != null) {
//		            if (manufacturerCategory == 0) {
//		                response.sendRedirect("../vendor/vendorMaterial"); // 商品頁面
//		            } else if (manufacturerCategory == 1) {
//		                response.sendRedirect("https://www.google.com/"); // 服務頁面
//		            } else {
//		                // 若 manufacturerCategory 值不是 0 或 1，可以根據需求進行處理
//		            }
//		        } else {
//		            // 若 manufacturerCategory 為 null，可以根據需求進行處理
//		        }
//		    } else {
//		        request.setAttribute("errorMap", errorMap);
//		        errorMap.put(EXCEPTION, "廠商登入失敗，請確認帳號密碼無誤");
//		        request.getRequestDispatcher(USER_LOGIN_PAGE + "#tab-2").forward(request, response);
//		    }
		} else if (action.equals("empLogin")) {
			String account = request.getParameter("empAccount");
			String pwd = request.getParameter("empPwd");
			Emp emp = new Emp();
			emp.setEmpEmail(account);
			emp.setEmpPassword(pwd);
			Emp loggedInEmp = SERVICE3.login(emp);
			if (loggedInEmp != null) {
			    HttpSession session = request.getSession();
			    session.setAttribute("emp", loggedInEmp);
				response.sendRedirect("../emp/empMaterial"); // 登入成功轉預覽首頁 待處理
			} else {
				request.setAttribute("errorMsgMap", errorMsgMap);
				errorMsgMap.put(EXCEPTION, "平台登入失敗，請確認帳號密碼無誤");
				request.getRequestDispatcher(USER_LOGIN_PAGE + "#tab-3").forward(request, response);
			}
		}
	}
	// SHA-256 加密方法
	private String encryptPassword(String password) {
	    try {
	        MessageDigest digest = MessageDigest.getInstance("SHA-256");
	        byte[] encodedHash = digest.digest(password.getBytes(StandardCharsets.UTF_8));

	        StringBuilder hexString = new StringBuilder();
	        for (byte b : encodedHash) {
	            String hex = Integer.toHexString(0xff & b);
	            if (hex.length() == 1) hexString.append('0');
	            hexString.append(hex);
	        }

	        return hexString.toString();
	    } catch (NoSuchAlgorithmException e) {
	        e.printStackTrace();
	        // 處理例外...
	    }

	    return null;
	}
	
}
