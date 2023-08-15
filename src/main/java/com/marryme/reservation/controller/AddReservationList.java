package com.marryme.reservation.controller;

import static com.marryme.common.CommonString.ACTION;
import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.common.CommonString.GET_ERROR;
import static com.marryme.common.CommonString.GET_ONE_FOR_UPDATE;
import static com.marryme.plan.common.PlanPages.ONE_PLAN_PLACE_PAGE;
import static com.marryme.plan.common.PlanPages.UPDATE_PLAN_PLACE_PAGE;
import static com.marryme.reservation.common.ReservationPages.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.marryme.reservation.service.impl.ReservationServiceImpl;
import com.marryme.plan.service.impl.PlaceServiceImpl;
import com.marryme.plan.vo.Place;
import com.marryme.plan.vo.Plan;


@WebServlet("/addReservation")
public class AddReservationList extends HttpServlet{

private PlaceServiceImpl service;
@Override
public void init() throws ServletException {
	service = new PlaceServiceImpl();
}


protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
	
		
    Integer planPlaceId = Integer.valueOf(req.getParameter("placeId"));
    Place place = service.getOne(planPlaceId);  
    req.setAttribute("place", place);
    req.getRequestDispatcher(ADD_RESERVATION_STRING).forward(req, resp);
}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}


}
