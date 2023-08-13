package com.marryme.member.controller;

import static com.marryme.common.CommonString.*;
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
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	     request.setCharacterEncoding(UTF_8);
	     HttpSession session = request.getSession();
	     Member member = (Member) session.getAttribute("member");
	    if (member != null) {
	        String pwd = request.getParameter("pwd");
	        String name = request.getParameter("name");
	        String phone = request.getParameter("phone");
	        String address = request.getParameter("address");
	        String gender = request.getParameter("sex"); // 取得選擇的性別值

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
	        // 假設SERVICE提供了一個方法用於更新會員資料
	        
	        member = service.edit(newMember);
 
//	        if (isUpdated) {
//	        if(member) {
	            // 更新成功後，從資料庫中重新查詢該會員的資料
//	            Member updatedMember = service.findById(member.getMemberId());
	        
	            session.setAttribute("member", newMember);
	            response.sendRedirect("../index"); 
//	            request.getRequestDispatcher("../user/userM").forward(request, response);// 更新成功後跳回會員中心
//	        }else {
//				
//			}
//	            } else {
//	            // 更新失敗，可以傳遞錯誤訊息到前端
//	            response.getWriter().write("更新失敗，請重新嘗試。");
//	        }
	    }
	}
	

}	

