package com.marryme.plan.controller;

import com.marryme.plan.service.PlaceService;
import com.marryme.plan.service.impl.PlaceServiceImpl;
import com.marryme.plan.vo.Place;
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

import static com.marryme.common.CommonString.*;
import static com.marryme.common.ControllerUtils.parameterMapToVo;
import static com.marryme.common.ControllerUtils.validErrorForParameterMap;
import static com.marryme.plan.common.PlanPages.*;

/**
 * ClassName: PlaceController
 * Package: marryme.plan.controller
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/17 下午 03:39
 * @Version 1.0
 */
@WebServlet("/plan-place")
public class PlaceController extends HttpServlet {
    private PlaceService service;
    @Override
    public void init() throws ServletException {
        service = new PlaceServiceImpl();;
    }
    /** 要檢核的欄位與錯誤訊息 */
    private Map<String, String> getInValidFieldsMsg() {
        Map<String, String> inValidFieldsMsg = new HashMap<>();
        inValidFieldsMsg.put("placeTitle", "請填寫場地標題");
        inValidFieldsMsg.put("numbeOfTables", "請填寫建議桌數區間");
        inValidFieldsMsg.put("placeIntroduction", "請填寫場地介紹");
        return inValidFieldsMsg;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vendorId = req.getParameter("vendorId");
        List<Place> placeList = service.findAllByVendorIdAndStatus(vendorId, ACTIVE);
        req.setAttribute("placeList", placeList);
        req.getRequestDispatcher(LIST_PLAN_PLACE_PAGE).forward(req,resp);
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
        Place vo = parameterMapToVo(reqMap, Place.class);

        if (!responseMsgMap.isEmpty()) {
            req.setAttribute("place", vo);
            req.getRequestDispatcher(ADD_PLAN_PLACE_PAGE).forward(req, resp);
            return;
        }

        Integer id = service.insert(vo);
        if (id == null) {
            responseMsgMap.put(EXCEPTION, INSERT_ERROR);
            doGet(req, resp);
            return;
        }
        responseMsgMap.put(SUCCESS, INSERT_SUCCESS);
        Place place = service.getOne(id);
        req.setAttribute("place", place);
        req.getRequestDispatcher(ONE_PLAN_PLACE_PAGE).forward(req, resp);
    }

    /**
     * 編輯前要先查出單筆資料 || 一般取得單筆資料顯示 （跳轉不同頁面）
     */
    private void getOne(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws Exception {

        Integer planPlaceId = Integer.valueOf(req.getParameter("planPlaceId"));
        Place place = service.getOne(planPlaceId);
        if (place == null) {
            responseMsgMap.put(EXCEPTION, GET_ERROR);
            doGet(req, resp);
            return;
        }
        req.setAttribute("place", place);

        String action = req.getParameter(ACTION);
        String url = StringUtils.equals(GET_ONE_FOR_UPDATE, action) ? UPDATE_PLAN_PLACE_PAGE : ONE_PLAN_PLACE_PAGE;
        req.getRequestDispatcher(url).forward(req, resp);
    }

    private void update(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        Map<String, String[]> reqMap = req.getParameterMap();
        validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), responseMsgMap);
        Place place = parameterMapToVo(reqMap, Place.class);

        if (!responseMsgMap.isEmpty()) {
            req.setAttribute("place", place);
            req.getRequestDispatcher(UPDATE_PLAN_PLACE_PAGE).forward(req, resp);
            return;
        }
        Integer planPlaceId = place.getPlaceId();
        boolean result = service.update(planPlaceId, place);

        // 更新成功
        if(result) {
            Place placeResult = service.getOne(planPlaceId);
            req.setAttribute("place", placeResult);
            // TODO 待補JSP檔
            req.getRequestDispatcher(ONE_PLAN_PLACE_PAGE).forward(req, resp);
        } else {
            responseMsgMap.put(EXCEPTION, UPDATE_ERROR);
            doGet(req, resp);
        }
    }

    /** 修改狀態為下架 */
    private void changeStatusToInactive(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        String planPlaceIdStr = req.getParameter("planPlaceId");
        boolean result = false;
        if(StringUtils.isNotBlank(planPlaceIdStr)) {
            result = service.changeStatusToInactive(Integer.valueOf(planPlaceIdStr));
        }
        // 如果更新失敗，紀錄錯誤訊息
        if(result) {
            responseMsgMap.put(SUCCESS, "場地下架成功");
        } else {
            responseMsgMap.put(EXCEPTION, "下架場地失敗");
        }
        // 回到list清單頁
        doGet(req, resp);
    }
}
