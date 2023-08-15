package com.marryme.weddingVenue.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/addReservation")
public class AddReservationController extends HttpServlet{
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // 檢查session中的"member"屬性是否為null
        if (session.getAttribute("member") == null) {
            // 如果"member"屬性不存在，重定向到登錄頁面
            resp.sendRedirect(req.getContextPath() + "/front-end/user/userLogin.jsp");
            return;
        }
     // 獲取vendorId
        String vendorId = req.getParameter("vendorId");

        // 在這裡處理預訂邏輯...

        // 成功轉交到預訂頁面
        RequestDispatcher successView = req.getRequestDispatcher("/front-end/reservation/addReservation.jsp");
        successView.forward(req, resp);
    }
}
