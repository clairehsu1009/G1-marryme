package com.marryme.plan.controller;

import com.marryme.plan.service.PlanService;
import com.marryme.plan.service.impl.PlanServiceImpl;
import com.marryme.plan.vo.Plan;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.marryme.plan.common.PlanPages.LIST_PLAN_DETAIL_PAGE;


/**
 * ClassName: PlanProductController
 * Package: com.marryme.plan.controller
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/31 下午 11:11
 * @Version 1.0
 */
@WebServlet("/plan/plan-product")
public class PlanProductController extends HttpServlet {
    private PlanService service;

    @Override
    public void init() throws ServletException {
        service = new PlanServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String planProductId = req.getParameter("planProductId");
        if(StringUtils.isNotBlank(planProductId)){
            Plan plan = service.getOne(Integer.valueOf(planProductId));
            req.setAttribute("plan", plan);
            req.getRequestDispatcher(LIST_PLAN_DETAIL_PAGE).forward(req, resp);
        }
    }

}
