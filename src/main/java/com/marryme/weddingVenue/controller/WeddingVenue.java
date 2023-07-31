package com.marryme.weddingVenue.controller;

import static com.marryme.common.CommonString.ACTIVE;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.service.impl.WeddingVenueServiceImpl;


/**
 * 取出活動圖片
 * 
 * @author Lily Huang
 * @version 2023/07/27
 */
@WebServlet("/object-storage/image")
public class WeddingVenue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final Gson gson = new Gson();

	private final WeddingVenueService service = new WeddingVenueServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/jpeg");
		String id = request.getParameter("id");
		var weddingVenuesList = service.findAllAndStatus(ACTIVE);
//		weddingVenuesList.forEach(System.out::println);
		byte[] objectData = weddingVenuesList.get(Integer.parseInt(id) - 1).getPlacePicture();
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(objectData);
		outputStream.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
