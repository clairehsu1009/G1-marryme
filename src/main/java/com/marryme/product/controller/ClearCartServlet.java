package com.marryme.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.product.entity.Cart;
import com.marryme.product.service.impl.ProductServiceImpl;

@WebServlet("/product/clearCart")
public class ClearCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 //取得使用者對應的購物車
        Cart cart = (Cart) req.getSession().getAttribute("cart");

        //呼叫對應的ProductServiceImpl方法
        ProductServiceImpl productSvc = new ProductServiceImpl();

        try {

            //清空購物車【實際上就是清空購物車的Map集合中的元素】
        	productSvc.clearCart(cart);

            //返回給購物車顯示頁面
            req.getRequestDispatcher("/front-end/product/shoppingCart.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
