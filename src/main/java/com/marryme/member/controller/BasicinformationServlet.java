package com.marryme.member.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.marryme.member.service.MemberService;
import com.marryme.member.service.Impl.MemberServiceImpl;
import com.marryme.member.vo.Member;


@WebServlet("/user/userBasicinformation")
public class BasicinformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final MemberService service = new MemberServiceImpl();
	
	
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		Member member = (Member) session.getAttribute("member");
//
//		if (member != null) {
//			String pwd = request.getParameter("pwd");
//			String name = request.getParameter("name");
//			String phone = request.getParameter("phone");
//			String address = request.getParameter("address");
//
//			// 創建一個新的Member物件，並設定其屬性
//			Member newMember = new Member();
//			newMember.setMemberId(member.getMemberId());
//			newMember.setMemberPassword(pwd);
//			newMember.setMemberName(name);
//			newMember.setMemberPhone(phone);
//			newMember.setMemberAddress(address);
//
//			// 假設SERVICE提供了一個方法用於更新會員資料
//			boolean isUpdated = service.edit(newMember);
//
//			if (isUpdated) {
//				// 更新成功
//				response.sendRedirect("../user/userMaterial");// 更新成功後跳回會員中心
//			} else {
//				// 更新失敗，可以傳遞錯誤訊息到前端
//				response.getWriter().write("更新失敗，請重新嘗試。");
//			}
//		} else {
//			// 未登入，導向回會員中心頁面
//			response.sendRedirect("../user/userMaterial");
//		}
//	} 
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    HttpSession session = request.getSession();
//	    Member member = (Member) session.getAttribute("member");
//	
//	if (member != null) {
//        // 從資料庫中重新獲取該會員的資料
//        Member updatedMember = service.findById(updateMember);
//
//        // 將會員資料設定到表單的預設值中
//        request.setAttribute("member", updatedMember);
//
//        String pwd = request.getParameter("pwd");
//        String name = request.getParameter("name");
//        String phone = request.getParameter("phone");
//        String address = request.getParameter("address");
//        String gender = request.getParameter("sex"); // 取得選擇的性別值
//
//        // 假設SERVICE提供了一個方法用於更新會員資料
//        boolean isUpdated = false;
//
//        // 若會員修改了資料，才進行更新
//        if (pwd != null || name != null || phone != null || address != null || gender != null) {
//            // 創建一個新的Member物件，並設定其屬性
//            Member newMember = new Member();
//            newMember.setMemberId(member.getMemberId());
//            newMember.setMemberPassword(pwd);
//            newMember.setMemberName(name);
//            newMember.setMemberPhone(phone);
//            newMember.setMemberAddress(address);
//
//            // 設定性別到會員物件
//            if (gender != null && (gender.equals("1") || gender.equals("2"))) {
//                newMember.setMemberGender(Integer.parseInt(gender));
//            } else {
//                // 若性別值無效，可以根據需求做相應處理，這裡假設性別值為 0 代表未選擇
//                newMember.setMemberGender(0);
//            }
//
//            // 更新會員資料
//            isUpdated = service.edit(newMember);
//        }
//
//        // 更新成功後，再重新獲取一次更新後的會員資料，並設定到表單的預設值中
//        if (isUpdated) {
//            updatedMember = service.findById(member.getMemberId());
//            request.setAttribute("member", updatedMember);
//            request.getRequestDispatcher("../user/userMaterial").forward(request, response);
//        }
//
//        // 轉發到前端頁面
//        
//    }
//}
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//    HttpSession session = request.getSession();
//    Member member = (Member) session.getAttribute("member");
//
//        String pwd = request.getParameter("pwd");
//        String name = request.getParameter("name");
//        String phone = request.getParameter("phone");
//        String address = request.getParameter("address");
//        String gender = request.getParameter("sex"); // 取得選擇的性別值
//        
//        Member updatedMember = service.findById(member.getMemberId());
//
//        // 創建一個新的Member物件，並設定其屬性
//        Member newMember = new Member();
//        newMember.setMemberId(member.getMemberId());
//        newMember.setMemberPassword(pwd);
//        newMember.setMemberName(name);
//        newMember.setMemberPhone(phone);
//        newMember.setMemberAddress(address);
//
//        // 設定性別到會員物件
//        if (gender != null && (gender.equals("1") || gender.equals("2"))) {
//            newMember.setMemberGender(Integer.parseInt(gender));
//        } else {
//            // 若性別值無效，可以根據需求做相應處理，這裡假設性別值為 0 代表未選擇
//            newMember.setMemberGender(0);
//        }
//
//        // 假設SERVICE提供了一個方法用於更新會員資料
//        boolean isUpdated = service.edit(newMember);
//
//        if (isUpdated) {
//        	session.setAttribute("member", member);
//            response.sendRedirect("../user/userMaterial");// 更新成功後跳回會員中心
//        } else {
//            // 更新失敗，可以傳遞錯誤訊息到前端
//            response.getWriter().write("更新失敗，請重新嘗試。");
//        }
//    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    Member member = (Member) session.getAttribute("member");

	    if (member != null) {
	        // 從資料庫中重新獲取該會員的資料
	        boolean isUpdated = service.findById(member);

	        // 將會員資料設定到表單的預設值中
	        request.setAttribute("member", member);

	        String pwd = request.getParameter("pwd");
	        String name = request.getParameter("name");
	        String phone = request.getParameter("phone");
	        String address = request.getParameter("address");
	        String gender = request.getParameter("sex"); // 取得選擇的性別值

	        // 若會員修改了資料，才進行更新
	        if (isUpdated) {
	            // 創建一個新的Member物件，並設定其屬性
	            Member newMember = new Member();
	            newMember.setMemberId(member.getMemberId());
	            newMember.setMemberPassword(pwd);
	            newMember.setMemberName(name);
	            newMember.setMemberPhone(phone);
	            newMember.setMemberAddress(address);

	            // 設定性別到會員物件
	            if (gender != null && (gender.equals("1") || gender.equals("2"))) {
	                newMember.setMemberGender(Integer.parseInt(gender));
	            } else {
	                // 若性別值無效，可以根據需求做相應處理，這裡假設性別值為 0 代表未選擇
	                newMember.setMemberGender(0);
	            }

	            // 更新會員資料
	            service.edit(newMember);

	            // 更新成功後，再重新獲取一次更新後的會員資料，並設定到表單的預設值中
	            request.setAttribute("member", member);
	            request.getRequestDispatcher("../user/userMaterial").forward(request, response);
	        }

	        // 轉發到前端頁面
	        
	    }
	}
}	


