package marryme.activity.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import marryme.activity.service.ActivityService;
import marryme.activity.service.ActivityServiceImpl;

@WebServlet("/activity/findAll")
public class FindAllServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ActivityService service;

	@Override
	public void init() throws ServletException {
		service = new ActivityServiceImpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		final var activityList = service.findAll();
		req.setAttribute("activityList", activityList);
		req.getRequestDispatcher("/back-end/activity/listAllActivity.jsp").forward(req, resp);
	}
}
