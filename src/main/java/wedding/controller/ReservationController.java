package wedding.controller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import wedding.service.ReservationService;
import wedding.service.impl.ReservationServiceImpl;
import wedding.vo.Reservation;


import static com.marryme.core.util.CommonUtil.*;

import java.io.IOException;
import java.util.List;


//@WebServlet("/reservation")
public class ReservationController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private ReservationService reservationService;
	
	 @Override
	    public void init() throws ServletException {
		 reservationService = new ReservationServiceImpl();
	    }
	
	public ReservationController() {
        this.reservationService = new ReservationServiceImpl();
    }
	
	
	public ReservationService getReservationService() {
		return reservationService;
	}

	public void setReservationService(ReservationService reservationService) {
		this.reservationService = reservationService;
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
	    final Reservation reservation = json2Pojo(request,Reservation.class);
		String funcName = reservation.getFuncName();
		
	    if("insertR".equals(funcName)) {
	    	this.reservationService.addReservation(reservation);
	    	writePojo2Json(response, reservation);
	    }

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		final var list = reservationService.findAll();
		request.setAttribute("reservationlist", list);
		request.getRequestDispatcher("/front-end/reservationList.jsp").forward(request, response);
		
	}


	
}
