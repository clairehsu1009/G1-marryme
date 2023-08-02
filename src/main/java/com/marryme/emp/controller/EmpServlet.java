package com.marryme.emp.controller;

import static com.marryme.emp.util.Constants.EMP_MATERIAL_PAGE;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.emp.service.EmpService;
import com.marryme.emp.service.Impl.EmpServiceImpl;
import com.marryme.emp.vo.*;


@WebServlet("/emp/empMaterial")
public class EmpServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private final EmpService service = new EmpServiceImpl(); 
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Emp> empList = service.findAll();
		request.setAttribute("empList", empList);
		request.getRequestDispatcher(EMP_MATERIAL_PAGE).forward(request, response);
	}
	

	
}
