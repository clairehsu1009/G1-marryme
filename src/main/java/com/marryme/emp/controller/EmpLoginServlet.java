package com.marryme.emp.controller;

import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.emp.util.Constants.EMP_MATERIAL_PAGE;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.marryme.emp.service.EmpService;
import com.marryme.emp.service.Impl.EmpServiceImpl;
import com.marryme.emp.vo.Emp;

@WebServlet("/emp/empLogin")
public class EmpLoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private final EmpService service = new EmpServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String> errorMsgMap = new HashMap<>();
		String account = request.getParameter("empAccount");
		String pwd = request.getParameter("empPwd");
		HttpSession session = request.getSession();
		 // 如果已有使用者登入，先執行登出操作
	    if (session.getAttribute("vendor") != null || session.getAttribute("member") != null
	    	|| 	session.getAttribute("emp") != null) {
	        session.invalidate(); // 執行登出操作，使原使用者登出並清除資料
	        session = request.getSession(); //重新獲取新的session
	    }
		
		Emp emp = new Emp();
		emp.setEmpEmail(account);
		emp.setEmpPassword(pwd);
		Emp loggedInEmp = service.login(emp);
		if (loggedInEmp != null) {
//		    HttpSession session = request.getSession();
		    session.setAttribute("emp", loggedInEmp);
			response.sendRedirect("../emp/empMaterial"); // 登入成功轉預覽首頁 待處理
		} else {
			request.setAttribute("errorMsgMap", errorMsgMap);
			errorMsgMap.put(EXCEPTION, "平台登入失敗，請確認帳號密碼無誤");
			request.getRequestDispatcher("../back-end/emp/empLogin.jsp").forward(request, response);
		}
	}
	
	
}
