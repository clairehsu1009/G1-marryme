package com.marryme.plan.controller;

import com.marryme.plan.pojo.PlanCheckOrder;
import com.marryme.plan.service.ItemService;
import com.marryme.plan.service.OrderService;
import com.marryme.plan.service.PlaceService;
import com.marryme.plan.service.PlanService;
import com.marryme.plan.service.impl.ItemServiceImpl;
import com.marryme.plan.service.impl.OrderServiceImpl;
import com.marryme.plan.service.impl.PlaceServiceImpl;
import com.marryme.plan.service.impl.PlanServiceImpl;
import com.marryme.plan.vo.*;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

import static com.marryme.common.CommonString.*;
import static com.marryme.common.ControllerUtils.parameterMapToVo;
import static com.marryme.common.ControllerUtils.validErrorForParameterMap;
import static com.marryme.plan.common.PlanPages.*;


/**
 * ClassName: PlanOrderController
 * Package: com.marryme.plan.controller
 * Description:
 *
 * @Author Claire
 * @Create 2023/8/2 下午 09:06
 * @Version 1.0
 */
@WebServlet("/plan/plan-order")
public class PlanOrderController extends HttpServlet {
    private OrderService service;
    private PlanService planService;
    private ItemService itemService;
    private PlaceService placeService;

    @Override
    public void init() throws ServletException {
        service = new OrderServiceImpl();
        planService = new PlanServiceImpl();
        itemService = new ItemServiceImpl();
        placeService = new PlaceServiceImpl();
    }
    /** 要檢核的欄位與錯誤訊息 */
    private Map<String, String> getInValidFieldsMsg() {
        Map<String, String> inValidFieldsMsg = new HashMap<>();
        inValidFieldsMsg.put("unavailableDate", "請選擇結婚日期");
        inValidFieldsMsg.put("unavailableTime", "請選擇結婚時段");
        return inValidFieldsMsg;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String planProductId = req.getParameter("planProductId");
        String unavailableDate = req.getParameter("unavailableDate");
        String unavailableTime = req.getParameter("unavailableTime");

        Map<String, String> responseMsgMap = new HashMap<>();
        req.setAttribute(RESPONSE_MSG_MAP, responseMsgMap);
        Map<String, String[]> reqMap = req.getParameterMap();
        validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), responseMsgMap);

        if(StringUtils.isNotBlank(planProductId) && StringUtils.isNotBlank(unavailableDate) && StringUtils.isNotBlank(unavailableTime)){
            Plan plan = planService.getOne(Integer.valueOf(planProductId));
            List<PlanDetail> planDetails = plan.getPlanDetail();
            List<Integer> placeIds = new ArrayList<>();
            for (PlanDetail planDetail : planDetails) {
                Integer placeId = planDetail.getPlaceId();
                placeIds.add(placeId);
            }
            Integer unavailableTimes = Integer.valueOf(unavailableTime);
            List<Integer> availablePlaceIds = planService.getOneForAvailableDates(placeIds, unavailableDate, unavailableTimes);

            req.setAttribute("plan", plan);
            req.setAttribute("placeId", availablePlaceIds);
            UnavailableDates datesVo = parameterMapToVo(reqMap, UnavailableDates.class);
            req.setAttribute("unavailableDate", unavailableDate);
            req.setAttribute("unavailableTime", unavailableTime);
            req.getRequestDispatcher(ADD_PLAN_DETAIL_PAGE).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding(UTF_8);
        Map<String, String> responseMsgMap = new HashMap<>();
                req.setAttribute(RESPONSE_MSG_MAP, responseMsgMap);
        try {
            String action = req.getParameter(ACTION);
            if(StringUtils.isBlank(action)) {
                responseMsgMap.put(EXCEPTION, ERROR_MSG);
                doGet(req, resp);
                return;
            }
            // action 事件請求控制
            switch (action) {
                case CHECK:check(req, resp, responseMsgMap);
                    break;
                case INSERT:insert(req, resp, responseMsgMap);
                    break;

            }
            // 有exception 統一回到list清單頁
        } catch (Exception e) {
            e.printStackTrace();
            responseMsgMap.put(EXCEPTION, GET_ERROR);
            doGet(req, resp);
        }
    }
    private void insert(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        String memberId = req.getParameter("memberId");
        String vendorId = req.getParameter("vendorId");
        Integer planProductId = Integer.valueOf(req.getParameter("planProductId"));
        Integer placeId = Integer.valueOf(req.getParameter("placeId"));
        String unavailableDate = req.getParameter("unavailableDate");
        Integer unavailableTime = Integer.valueOf(req.getParameter("unavailableTime"));
        Integer orderTables = Integer.valueOf(req.getParameter("orderTables"));
        String totalAmount = req.getParameter("total");
        totalAmount = totalAmount.replace(",", ""); // 移除千位符號逗號
        String [] planItemIds = req.getParameterValues("planItemId");

        List<Integer> planItemIdList = new ArrayList<>();
//        if(StringUtils.isNotBlank(planItemIds)){
//            String[] planItemIdsArr = planItemIds.split(",");
            for (String planItemId : planItemIds) {
                try {
                    Integer value = Integer.parseInt(planItemId.trim());
                    planItemIdList.add(value);
                } catch (NumberFormatException e) {
                    // 如果需要，處理無效的整數值
                }
            }
//        }

        // 不可預約table的insert
        UnavailableDates unavailableDates = new UnavailableDates();
        unavailableDates.setPlaceId(placeId);
        unavailableDates.setUnavailableDate(unavailableDate);
        unavailableDates.setUnavailableTime(unavailableTime);

        // 訂單主檔的service insert(連同子訂單一起insert)
        PlanOrder planOrderVo = new PlanOrder();
        planOrderVo.setMemberId(memberId);
        planOrderVo.setVendorId(vendorId);
        planOrderVo.setPlanProductId(planProductId);
        planOrderVo.setPlaceId(placeId);
        planOrderVo.setOrderTables(orderTables);
        planOrderVo.setTotalAmount(Integer.valueOf(totalAmount));
        Integer id = service.insertUnavailableDateAndOrder(unavailableDates, planOrderVo, planItemIdList);
        if (id == null) {
            responseMsgMap.put(EXCEPTION, INSERT_ERROR);
            doGet(req, resp);
            return;
        }
        responseMsgMap.put(SUCCESS, "訂單已成立");
        PlanOrder planOrder = service.getOne(id);
        req.setAttribute("planOrder", planOrder);
        req.setAttribute("memberId", memberId);
//        req.getRequestDispatcher(MEMBER_OWN_ORDER_PAGE).forward(req, resp);
        String redirectUrl = req.getContextPath() + "/plan-order?memberId=" + memberId;
        resp.sendRedirect(redirectUrl);

    }
    private void check(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {


//        String memberId = req.getParameter("memberId");
        Integer planProductId = Integer.parseInt(req.getParameter("planProductId"));
        Integer placeId = Integer.valueOf(req.getParameter("placeId"));
        String unavailableDate = req.getParameter("unavailableDate");
        String unavailableTime = req.getParameter("unavailableTime");
        Integer orderTables = Integer.parseInt(req.getParameter("tables"));
        Integer tablePrice = Integer.parseInt(req.getParameter("tablePrice"));
        String total = req.getParameter("total");
        String[] planItemIdArray = req.getParameterValues("planItemId");
        List<Integer> planItemIdList = new ArrayList<>();
        for (String itemId : planItemIdArray) {
            planItemIdList.add(Integer.parseInt(itemId));
        }

        PlanCheckOrder planCheckOrder = new PlanCheckOrder();
//        planCheckOrder.setMemberId(memberId);
        planCheckOrder.setPlanProductId(planProductId);
        planCheckOrder.setPlaceId(placeId);
        planCheckOrder.setUnavailableDate(unavailableDate);
        planCheckOrder.setUnavailableTime(unavailableTime);
        planCheckOrder.setOrderTables(orderTables);
        planCheckOrder.setTablePrice(tablePrice);
        planCheckOrder.setPlanItemId(planItemIdList);

        planCheckOrder.setTotal(total);
        // 現在 planCheckOrder 對象已經包含了從前端傳遞的所有值

        Plan plan = planService.getOne(planProductId);
        List<Item> items = itemService.getIds(planItemIdList);
        Place place = placeService.getOne(placeId);


        if (!responseMsgMap.isEmpty()) {
            responseMsgMap.put(EXCEPTION, GET_ERROR);
            doGet(req, resp);
        }else {
            req.setAttribute("plan", plan);
            req.setAttribute("itemList", items);
            req.setAttribute("place", place);
            req.setAttribute("planCheckOrder", planCheckOrder);
            req.getRequestDispatcher(CHECK_PLAN_ORDER_PAGE).forward(req, resp);
        }


//        responseMsgMap.put(SUCCESS, INSERT_SUCCESS);
//        Item item = service.getOne(id);
//        req.setAttribute("item", item);
//        req.getRequestDispatcher(ONE_PLAN_ITEM_PAGE).forward(req, resp);
    }
}
