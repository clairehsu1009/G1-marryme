package com.marryme.plan.controller;

import lombok.extern.slf4j.Slf4j;
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

    //TODO 字串重複使用的部分改放在 CommonString
    //TODO POST 方法中的內容 可以再重構，移出重複的程式碼

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding(UTF_8);
        String action = "";
        Map<String, String[]> reqMap = req.getParameterMap();
        if (reqMap != null && reqMap.containsKey(ACTION) && reqMap.get(ACTION).length != 0) {
            action = reqMap.get(ACTION)[0];
        } else {
            Map<String, String> errorMsgMap = new HashMap<>();
            errorMsgMap.put(EXCEPTION, ERROR_MSG);
            req.setAttribute(ERROR_MSG_MAP, errorMsgMap);
            doGet(req, resp);
            return;
        }

        if (INSERT.equals(action)) {
            Map<String, String> errorMsgMap = new HashMap<>();
            req.setAttribute(ERROR_MSG_MAP, errorMsgMap);

            try {
                validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), errorMsgMap);
                Item vo = parameterMapToVo(reqMap, Item.class);

                if (!errorMsgMap.isEmpty()) {
                    req.setAttribute("item", vo);
                    req.getRequestDispatcher(ADD_PLAN_ITEM_PAGE).forward(req, resp);
                    return;
                }

                Integer id = service.insert(vo);
                if(id == null) {
                    errorMsgMap.put(EXCEPTION, INSERT_ERROR);
                    doGet(req, resp);
                    return;
                }
                Item item = service.getOne(id);
                req.setAttribute("item", item);
                req.getRequestDispatcher(ONE_PLAN_ITEM_PAGE).forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
                errorMsgMap.put(EXCEPTION, INSERT_ERROR);
                req.getRequestDispatcher(ADD_PLAN_ITEM_PAGE).forward(req, resp);
            }
        }

        // 編輯前要先查出單筆資料 || 一般取得單筆資料顯示 （跳轉不同頁面）
        if (GET_ONE_FOR_UPDATE.equals(action) || GET_ONE.equals(action)) {
            Map<String, String> errorMsgMap = new HashMap<>();
            req.setAttribute(ERROR_MSG_MAP, errorMsgMap);

            try {
                Integer planItemId = Integer.valueOf(req.getParameter("planItemId"));
                Item item = service.getOne(planItemId);
                req.setAttribute("item", item);

                String url = StringUtils.equals(GET_ONE_FOR_UPDATE, action) ? UPDATE_PLAN_ITEM_PAGE : ONE_PLAN_ITEM_PAGE;
                req.getRequestDispatcher(url).forward(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
                errorMsgMap.put(EXCEPTION, GET_ERROR);
                doGet(req, resp);
            }
        }

        // 修改資料 -> 成功跳轉回顯示單筆資料頁面 / 失敗 -> 跳轉回List清單頁面，並put errorMsg 前端可以再取得錯誤處理後續
        if (UPDATE.equals(action)) {
            Map<String, String> errorMsgMap = new HashMap<>();
            req.setAttribute(ERROR_MSG_MAP, errorMsgMap);

            try {
                validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), errorMsgMap);
                Item item = parameterMapToVo(reqMap, Item.class);

                if (!errorMsgMap.isEmpty()) {
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
                    errorMsgMap.put(EXCEPTION, UPDATE_ERROR);
                    doGet(req, resp);
                    return;
                }

            } catch (Exception e) {
                e.printStackTrace();
                errorMsgMap.put(EXCEPTION, UPDATE_ERROR);
                doGet(req, resp);
            }
        }

        // 修改狀態為下架
        if ("changeStatusToInactive".equals(action)) {
            Map<String, String> errorMsgMap = new HashMap<>();
            req.setAttribute(ERROR_MSG_MAP, errorMsgMap);

            try {
                Integer planItemId = Integer.valueOf(reqMap.get("planItemId")[0]);
                boolean result = service.changeStatusToInactive(planItemId);

                // 如果更新失敗，紀錄錯誤訊息
                if(!result) {
                    errorMsgMap.put(EXCEPTION, "下架加購項目失敗");
                }
            } catch (Exception e) {
                e.printStackTrace();
                errorMsgMap.put(EXCEPTION, "下架加購項目失敗");
            }
            // 回到list清單頁
            doGet(req, resp);
        }

        // TODO 需移除 此功能無刪除功能
        if (DELETE.equals(action)) {
            Map<String, String> errorMsgMap = new HashMap<>();
            req.setAttribute(ERROR_MSG_MAP, errorMsgMap);

            try {
                Integer planItemId = Integer.valueOf(req.getParameter("planItemId"));
                boolean result = service.deleteById(planItemId);

                // 如果刪除失敗，紀錄錯誤訊息
                if(!result) {
                    errorMsgMap.put(EXCEPTION, DELETE_ERROR);
                }
            } catch (Exception e) {
                e.printStackTrace();
                errorMsgMap.put(EXCEPTION, DELETE_ERROR);
            }
            doGet(req, resp);
        }

        if("getPlanItemInactiveList".equals(action)) {
            Map<String, String> errorMsgMap = new HashMap<>();
            req.setAttribute(ERROR_MSG_MAP, errorMsgMap);

            try {
                String vendorId = req.getParameter("vendorId");
                List<Item> itemInactiveList = service.findAllByVendorIdAndStatus(vendorId, INACTIVE);
                req.setAttribute("itemInactiveList", itemInactiveList);
                req.getRequestDispatcher(OFF_LIST_PLAN_ITEM_PAGE).forward(req, resp);

            } catch (Exception e) {
                e.printStackTrace();
                errorMsgMap.put(EXCEPTION, GET_ERROR);
                doGet(req, resp);
            }
        }
    }
}
