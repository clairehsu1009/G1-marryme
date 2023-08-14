package com.marryme.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.Product;
import com.marryme.product.service.ProductService;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/searchProduct")
public class SearchProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductServiceImpl();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {    
        String vendorId = req.getParameter("vendorId");
        Integer productStatus = Integer.valueOf(req.getParameter("productStatus"));
        List<Product> productList = productService.getProductByStatusAndVendorId(productStatus, vendorId);
        req.setAttribute("productList", productList);
        req.setAttribute("productStatus", productStatus);
        req.setAttribute("vendorId", vendorId);
        req.getRequestDispatcher("/back-end/product/listAllProduct.jsp").forward(req, res);

    }
}
