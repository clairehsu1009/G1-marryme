package com.marryme.plan.controller;

import com.marryme.plan.service.ItemService;
import com.marryme.plan.service.OrderService;
import com.marryme.plan.service.impl.ItemServiceImpl;
import com.marryme.plan.service.impl.OrderServiceImpl;
import com.marryme.plan.vo.Item;
import com.marryme.plan.vo.PlanOrder;
import com.marryme.plan.vo.PlanOrderDetail;
import com.marryme.plan.vo.UnavailableDates;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static com.marryme.plan.common.PlanPages.MEMBER_OWN_ORDER_PAGE;
import static com.marryme.plan.common.PlanPages.VENDOR_OWN_ORDER_PAGE;

/**
 * ClassName: OrderController
 * Package: com.marryme.plan.controller
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/16 下午 01:00
 * @Version 1.0
 */
@WebServlet("/plan-order")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 10 * 1024 * 1024)
public class OrderController extends HttpServlet {

    private OrderService service;
    private ItemService itemService;

    @Override
    public void init() throws ServletException {
        service = new OrderServiceImpl();
        itemService = new ItemServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vendorId = req.getParameter("vendorId");
        String memberId = req.getParameter("memberId");
        if(vendorId == null){
            List<PlanOrder> orderList = service.findAllByMemberId(memberId);
            PlanOrder planOrder = new PlanOrder();
            for(PlanOrder orderId : orderList){
                planOrder = service.getOne(orderId.getPlanOrderId());
            }
            UnavailableDates unavailableDate = service.getUnavailableDate(planOrder.getPlanOrderId());

            List<PlanOrderDetail> planOrderDetailList = service.findAllByOrderId(planOrder.getPlanOrderId());
            List<Item> items = new ArrayList<>();
            for(PlanOrderDetail item : planOrderDetailList){
                Item one = itemService.getOne(item.getPlanItemId());
                items.add(one);
            }
            req.setAttribute("items", items);
            req.setAttribute("unavailableDate", unavailableDate);
            req.setAttribute("planOrder", planOrder);
            req.setAttribute("orderList", orderList);
            req.getRequestDispatcher(MEMBER_OWN_ORDER_PAGE).forward(req, resp);

        } else if (vendorId != null) {
            List<PlanOrder> orderList = service.findAllByVendorId(vendorId);
            req.setAttribute("orderList", orderList);
            req.getRequestDispatcher(VENDOR_OWN_ORDER_PAGE).forward(req, resp);
        }

    }
}
