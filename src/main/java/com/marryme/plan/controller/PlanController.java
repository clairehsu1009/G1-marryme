package com.marryme.plan.controller;

import com.marryme.plan.service.PlanService;
import com.marryme.plan.service.impl.PlanServiceImpl;
import com.marryme.plan.vo.Place;
import com.marryme.plan.vo.Plan;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

import static com.marryme.common.CommonString.*;
import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.common.ControllerUtils.*;
import static com.marryme.plan.common.PlanPages.*;
import static com.marryme.plan.common.PlanPages.ONE_PLAN_PLACE_PAGE;

/**
 * ClassName: PlanController
 * Package: marryme.plan.controller
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/8 下午 02:02
 * @Version 1.0
 */

@WebServlet("/plan")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 10 * 1024 * 1024)
public class PlanController extends HttpServlet {
    private PlanService service;


    @Override
    public void init() throws ServletException {
        service = new PlanServiceImpl();
    }
    /** 要檢核的欄位與錯誤訊息 */
    private Map<String, String> getInValidFieldsMsg() {
        Map<String, String> inValidFieldsMsg = new HashMap<>();
        inValidFieldsMsg.put("planTitle", "請填寫方案標題");
        inValidFieldsMsg.put("planIntroduction", "請填寫方案介紹");
        return inValidFieldsMsg;
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vendorId = req.getParameter("vendorId");
        List<Plan> planList = service.findAllByVendorId(vendorId);
        req.setAttribute("planList", planList);
        req.getRequestDispatcher(LIST_PLAN_PRODUCT_PAGE).forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
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

        String vendorId = req.getParameter("vendorId");
        String planTitle = req.getParameter("planTitle");
        String planIntroduction = req.getParameter("planIntroduction");
        String planPictureIntro1 = req.getParameter("planPictureIntro1");
        String planPictureIntro2 = req.getParameter("planPictureIntro2");
        String planPictureIntro3 = req.getParameter("planPictureIntro3");
        String [] placesParam = req.getParameterValues("placeId");
        List<Integer> places = new ArrayList<>();

        if (placesParam != null && placesParam.length > 0) {
            for (String place : placesParam) {
                try {
                    int value = Integer.parseInt(place.trim());
                    places.add(value);
                } catch (NumberFormatException e) {
                    // 如果需要，處理無效的整數值
                }
            }
        }

        // 處理欄位檢核錯誤訊息
        Map<String, String> inValidFieldsMap = getInValidFieldsMsg();
        if(StringUtils.isBlank(vendorId)) {
            responseMsgMap.put(EXCEPTION, ERROR_MSG);
        }
        if(StringUtils.isBlank(planTitle)) {
            responseMsgMap.put("planTitle", inValidFieldsMap.get("planTitle"));
        }
        if(StringUtils.isBlank(planIntroduction)) {
            responseMsgMap.put("planIntroduction", inValidFieldsMap.get("planIntroduction"));
        }

        // 圖片處理
        Part part = req.getPart("planPicture");

        // 可選擇上傳1~5張照片，最少上傳一張，所以只檢核第一張有沒有圖片
        if (part == null || part.getSize() == 0) {
            responseMsgMap.put("planPicture", "請最少上傳一張圖片");
        }

        Part part2 = req.getPart("planPictures1");
        Part part3 = req.getPart("planPictures2");
        Part part4 = req.getPart("planPictures3");

        Plan planVo = new Plan();
        planVo.setVendorId(vendorId);
        planVo.setPlanPicture(readPhotoToParameter(part));
        planVo.setPlanTitle(planTitle);
        planVo.setPlanIntroduction(planIntroduction);
        // 後端處理更新時間
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        planVo.setUpdateTime(currentTimestamp);
        planVo.setPlanPictures1(readPhotoToParameter(part2));
        planVo.setPlanPictureIntro1(planPictureIntro1);
        planVo.setPlanPictures2(readPhotoToParameter(part3));
        planVo.setPlanPictureIntro2(planPictureIntro2);
        planVo.setPlanPictures3(readPhotoToParameter(part4));
        planVo.setPlanPictureIntro3(planPictureIntro3);


        if (!responseMsgMap.isEmpty()) {
            req.setAttribute("plan", planVo);
            req.getRequestDispatcher(ADD_PLAN_PRODUCT_PAGE).forward(req, resp);
            return;
        }

        Integer id = service.insertPlanWithDetails(planVo,places);
        if (id == null) {
            responseMsgMap.put(EXCEPTION, INSERT_ERROR);
            doGet(req, resp);
            return;
        }
        responseMsgMap.put(SUCCESS, INSERT_SUCCESS);
        Plan plan = service.getOne(id);
        req.setAttribute("plan", plan);
        req.getRequestDispatcher(ONE_PLAN_PRODUCT_PAGE).forward(req, resp);
    }

    /**
     * 編輯前要先查出單筆資料 || 一般取得單筆資料顯示 （跳轉不同頁面）
     */
    private void getOne(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws Exception {

        Integer planProductId = Integer.valueOf(req.getParameter("planProductId"));
        Plan plan = service.getOne(planProductId);
        if (plan == null) {
            responseMsgMap.put(EXCEPTION, GET_ERROR);
            doGet(req, resp);
            return;
        }
        req.setAttribute("plan", plan);

        String action = req.getParameter(ACTION);
        String url = StringUtils.equals(GET_ONE_FOR_UPDATE, action) ? UPDATE_PLAN_PRODUCT_PAGE : ONE_PLAN_PRODUCT_PAGE;
        req.getRequestDispatcher(url).forward(req, resp);
    }

    private void update(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        String vendorId = req.getParameter("vendorId");
        String planTitle = req.getParameter("planTitle");
        String planIntroduction = req.getParameter("planIntroduction");
        String planPictureIntro1 = req.getParameter("planPictureIntro1");
        String planPictureIntro2 = req.getParameter("planPictureIntro2");
        String planPictureIntro3 = req.getParameter("planPictureIntro3");


        Map<String, String[]> reqMap = req.getParameterMap();


        // 處理欄位檢核錯誤訊息
        Map<String, String> inValidFieldsMap = getInValidFieldsMsg();
        if(StringUtils.isBlank(vendorId)) {
            responseMsgMap.put(EXCEPTION, ERROR_MSG);
        }
        if(StringUtils.isBlank(planTitle)) {
            responseMsgMap.put("planTitle", inValidFieldsMap.get("planTitle"));
        }
        if(StringUtils.isBlank(planIntroduction)) {
            responseMsgMap.put("planIntroduction", inValidFieldsMap.get("planIntroduction"));
        }
        validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), responseMsgMap);

        // 圖片處理
        Part part = req.getPart("planPicture");

        // 可選擇上傳1~5張照片，最少上傳一張，所以只檢核第一張有沒有圖片
        if (part == null || part.getSize() == 0) {
            responseMsgMap.put("planPicture", "請最少上傳一張圖片");
        }

        Part part2 = req.getPart("planPictures1");
        Part part3 = req.getPart("planPictures2");
        Part part4 = req.getPart("planPictures3");

        Plan plan = parameterMapToVo(reqMap, Plan.class);
        plan.setVendorId(vendorId);
        plan.setPlanPicture(readPhotoToParameter(part));
        plan.setPlanTitle(planTitle);
        plan.setPlanIntroduction(planIntroduction);
        // 後端處理更新時間
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        plan.setUpdateTime(currentTimestamp);
        plan.setPlanPictures1(readPhotoToParameter(part2));
        plan.setPlanPictureIntro1(planPictureIntro1);
        plan.setPlanPictures2(readPhotoToParameter(part3));
        plan.setPlanPictureIntro2(planPictureIntro2);
        plan.setPlanPictures3(readPhotoToParameter(part4));
        plan.setPlanPictureIntro3(planPictureIntro3);

        if (!responseMsgMap.isEmpty()) {
            req.setAttribute("plan", plan);
            req.getRequestDispatcher(UPDATE_PLAN_PRODUCT_PAGE).forward(req, resp);
            return;
        }
        Integer planProductId = plan.getPlanProductId();
        boolean result = service.update(planProductId, plan);

        // 更新成功
        if(result) {
            Plan planResult = service.getOne(planProductId);
            req.setAttribute("plan", planResult);
            req.getRequestDispatcher(ONE_PLAN_PRODUCT_PAGE).forward(req, resp);
        } else {
            responseMsgMap.put(EXCEPTION, UPDATE_ERROR);
            doGet(req, resp);
        }
    }

    /** 修改狀態為下架 */
    private void changeStatusToInactive(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        String planProductIdStr = req.getParameter("planProductId");
        boolean result = false;
        if(StringUtils.isNotBlank(planProductIdStr)) {
            result = service.changeStatusToInactive(Integer.valueOf(planProductIdStr));
        }
        // 如果更新失敗，紀錄錯誤訊息
        if(result) {
            responseMsgMap.put(SUCCESS, "方案下架成功");
        } else {
            responseMsgMap.put(EXCEPTION, "下架方案失敗");
        }
        // 回到list清單頁
        doGet(req, resp);
    }
}