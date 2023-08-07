package com.marryme.weddingVenue.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.weddingVenue.service.WeddingVenueService;
import com.marryme.weddingVenue.service.impl.WeddingVenueServiceImpl;

//@WebServlet("/vendorLocation")
public class FindVendorLocationController extends HttpServlet {
    private static final long serialVersionUID = 13L;

    private WeddingVenueService service;

    @Override
    public void init() throws ServletException {
        service = new WeddingVenueServiceImpl();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String vendorId = req.getParameter("vendorId");
    	String vendorLocation = service.findVendorLocationbyId(vendorId);
        req.setAttribute("vendorLocation", vendorLocation);      

    }
}

