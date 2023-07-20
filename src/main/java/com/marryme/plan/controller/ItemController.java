package com.marryme.plan.controller;

import com.marryme.plan.service.ItemService;
import com.marryme.plan.service.impl.ItemServiceImpl;
import com.marryme.plan.vo.Item;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.marryme.plan.common.PlanPages.*;
import static com.marryme.common.CommonString.*;
import static com.marryme.common.ControllerUtils.*;

@WebServlet("/plan-item")
public class ItemController extends HttpServlet {
    private ItemService service;

    @Override
    public void init() throws ServletException {
        service = new ItemServiceImpl();
    }

    /** 要檢核的欄位與錯誤訊息 */
    private Map<String, String> getInValidFieldsMsg() {
        Map<String, String> inValidFieldsMsg = new HashMap<>();
        inValidFieldsMsg.put("itemType", "請選擇加購項目種類");
        inValidFieldsMsg.put("itemSelect", "請填寫加購項目名稱");
        inValidFieldsMsg.put("itemDeposit", "請填寫訂金金額，若不需訂金請填寫0");
        inValidFieldsMsg.put("itemTotal", "請填寫加購項目金額");
        return inValidFieldsMsg;
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vendorId = req.getParameter("vendorId");
        List<Item> itemList = service.findAllByVendorIdAndStatus(vendorId, ACTIVE);
        req.setAttribute("itemList", itemList);
        req.getRequestDispatcher(LIST_PLAN_ITEM_PAGE).forward(req, resp);
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
                case INSERT:insert(req, resp, responseMsgMap);
                    break;
                case GET_ONE_FOR_UPDATE:
                case GET_ONE:
                    getOne(req, resp, responseMsgMap);
                    break;
                case UPDATE:update(req, resp, responseMsgMap);
                    break;
                case "changeStatusToInactive":changeStatusToInactive(req, resp, responseMsgMap);
                    break;
                case "getPlanItemInactiveList":getPlanItemInactiveList(req, resp);
                    break;
                default:
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
        Map<String, String[]> reqMap = req.getParameterMap();
        validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), responseMsgMap);
        Item vo = parameterMapToVo(reqMap, Item.class);

        if (!responseMsgMap.isEmpty()) {
            req.setAttribute("item", vo);
            req.getRequestDispatcher(ADD_PLAN_ITEM_PAGE).forward(req, resp);
            return;
        }

        Integer id = service.insert(vo);
        if (id == null) {
            responseMsgMap.put(EXCEPTION, INSERT_ERROR);
            doGet(req, resp);
            return;
        }
        responseMsgMap.put(SUCCESS, INSERT_SUCCESS);
        Item item = service.getOne(id);
        req.setAttribute("item", item);
        req.getRequestDispatcher(ONE_PLAN_ITEM_PAGE).forward(req, resp);
    }

    /**
     * 編輯前要先查出單筆資料 || 一般取得單筆資料顯示 （跳轉不同頁面）
     */
    private void getOne(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws Exception {

        Integer planItemId = Integer.valueOf(req.getParameter("planItemId"));
        Item item = service.getOne(planItemId);
        if (item == null) {
            responseMsgMap.put(EXCEPTION, GET_ERROR);
            doGet(req, resp);
            return;
        }
        req.setAttribute("item", item);

        String action = req.getParameter(ACTION);
        String url = StringUtils.equals(GET_ONE_FOR_UPDATE, action) ? UPDATE_PLAN_ITEM_PAGE : ONE_PLAN_ITEM_PAGE;
        req.getRequestDispatcher(url).forward(req, resp);
    }

    private void update(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        Map<String, String[]> reqMap = req.getParameterMap();
        validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), responseMsgMap);
        Item item = parameterMapToVo(reqMap, Item.class);

        if (!responseMsgMap.isEmpty()) {
            req.setAttribute("item", item);
            req.getRequestDispatcher(UPDATE_PLAN_ITEM_PAGE).forward(req, resp);
            return;
        }
        Integer planItemId = item.getPlanItemId();
        boolean result = service.update(planItemId, item);

        // 更新成功
        if(result) {
            Item itemResult = service.getOne(planItemId);
            req.setAttribute("item", itemResult);
            req.getRequestDispatcher(ONE_PLAN_ITEM_PAGE).forward(req, resp);
        } else {
            responseMsgMap.put(EXCEPTION, UPDATE_ERROR);
            doGet(req, resp);
        }
    }

    /** 修改狀態為下架 */
    private void changeStatusToInactive(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        String planItemIdStr = req.getParameter("planItemId");
        boolean result = false;
        if(StringUtils.isNotBlank(planItemIdStr)) {
            result = service.changeStatusToInactive(Integer.valueOf(planItemIdStr));
        }
        // 如果更新失敗，紀錄錯誤訊息
        if(result) {
            responseMsgMap.put(SUCCESS, "加購項目下架成功");
        } else {
            responseMsgMap.put(EXCEPTION, "下架加購項目失敗");
        }
        // 回到list清單頁
        doGet(req, resp);
    }
    /** 取得狀態為下架的加購項目清單 */
    private void getPlanItemInactiveList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vendorId = req.getParameter("vendorId");
        List<Item> itemInactiveList = service.findAllByVendorIdAndStatus(vendorId, INACTIVE);
        req.setAttribute("itemInactiveList", itemInactiveList);
        req.getRequestDispatcher(OFF_LIST_PLAN_ITEM_PAGE).forward(req, resp);
    }
}
