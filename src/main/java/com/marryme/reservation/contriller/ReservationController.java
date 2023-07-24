package com.marryme.reservation.contriller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.marryme.plan.vo.Item;
import com.marryme.reservation.service.impl.ReservationServiceImpl;
import com.marryme.reservation.vo.Reservation;
import org.apache.commons.lang3.StringUtils;


import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.marryme.reservation.common.ReservationPages.*;
import static com.marryme.common.CommonString.*;
import static com.marryme.common.ControllerUtils.*;
import static com.marryme.plan.common.PlanPages.OFF_LIST_PLAN_ITEM_PAGE;
import static com.marryme.plan.common.PlanPages.ONE_PLAN_ITEM_PAGE;
import static com.marryme.plan.common.PlanPages.UPDATE_PLAN_ITEM_PAGE;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet {
	private ReservationServiceImpl service;

	@Override
	public void init() throws ServletException {
		service = new ReservationServiceImpl();
	}

	/* 要檢核的欄位與錯誤訊息 */
	private Map<String, String> getInValidFieldsMsg() {
		Map<String, String> inValidFieldsMsgMap = new HashMap<>();
		inValidFieldsMsgMap.put("contactName", "請填寫名稱");
		inValidFieldsMsgMap.put("contactNumber", "請填寫聯繫電話");
		inValidFieldsMsgMap.put("contactReservation", "請填寫預約日期");
		return inValidFieldsMsgMap;
	}

	/* 錯誤顯示 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String vendorId = req.getParameter("vendorId");
		List<Reservation> reservationList = service.findAllByVendorIdAndStatus(vendorId, ACTIVE);
		req.setAttribute("reservationList", reservationList);
		req.getRequestDispatcher(RESERVATION_ITEM_PAGE).forward(req, resp);

	}

	/* 錯誤處理 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(UTF_8);
		Map<String, String> responseMsgMap = new HashMap<>();
		req.setAttribute(RESPONSE_MSG_MAP, responseMsgMap);

		try {
			String action = req.getParameter(ACTION);
			if (StringUtils.isBlank(action)) {
				responseMsgMap.put(EXCEPTION, ERROR_MSG);
				doGet(req, resp);
				return;
			}
			// action 事件請求控制
			switch (action) {
//			case INSERT:insert(req, resp, responseMsgMap);
//				break;
			case GET_ONE_FOR_UPDATE:
			case GET_ONE:getOne(req, resp, responseMsgMap);
				break;
			case UPDATE:update(req, resp, responseMsgMap);
				break;					  //修改狀態為下架
			case "changeStatusToCancel":changeStatusToCancel(req, resp, responseMsgMap);
				break;					 //取得狀態為下架的加購項目清單
			case "getPlanItemInactiveList":getCancelReservationList(req, resp);
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
	
	/*編輯先取出資料*/
	private void getOne(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws Exception {

        Integer reservationId = Integer.valueOf(req.getParameter("reservationId"));
        Reservation reservation = service.getOne(reservationId);
        if (reservation == null) {
            responseMsgMap.put(EXCEPTION, GET_ERROR);
            doGet(req, resp);
            return;
        }
        req.setAttribute("reservation", reservation);

        String action = req.getParameter(ACTION);
        String url = StringUtils.equals(GET_ONE_FOR_UPDATE, action) ? UPDATE_RESERVATION_ITEM_PAGE : ONE_RESERVATION_PAGE;
        req.getRequestDispatcher(url).forward(req, resp);
    }
	
	
	
	
	
	/*更新預約日期*/
	private void update(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        Map<String, String[]> reqMap = req.getParameterMap();
        validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), responseMsgMap);
        Reservation reservation = parameterMapToVo(reqMap, Reservation.class);

        if (!responseMsgMap.isEmpty()) {
            req.setAttribute("reservation", reservation);
            req.getRequestDispatcher(UPDATE_RESERVATION_ITEM_PAGE).forward(req, resp);
            return;
        }
        // 取得前端傳遞的日期時間字串
        String eventDateStr = req.getParameter("eventDate");
        String reservationDateStr = req.getParameter("reservationDate");
                                 
        
     // 在此直接使用 eventDateTime 和 reservationDateTime
        Timestamp eventDate = Timestamp.valueOf(eventDateStr);
        Timestamp reservationDate = Timestamp.valueOf(reservationDateStr);
        reservation.setEventDate(eventDate);
        reservation.setReservationDate(reservationDate);

        
        Integer reservationId = reservation.getReservationId();
        boolean result = service.update(reservationId, reservation);

        // 更新成功
        if(result) {
            Reservation reservationResult = service.getOne(reservationId);
            req.setAttribute("reservation", reservationResult);
            req.getRequestDispatcher(ONE_RESERVATION_PAGE).forward(req, resp);
        } else {
            responseMsgMap.put(EXCEPTION, UPDATE_ERROR);
            doGet(req, resp);
        }
    }
	
	
	
	/** 修改狀態為取消 */
    private void changeStatusToCancel(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        String reservationIdStr = req.getParameter("reservationId");
        boolean result = false;
        if(StringUtils.isNotBlank(reservationIdStr)) {
            result = service.changeStatusToCancel(Integer.valueOf(reservationIdStr));
        }
        // 如果更新失敗，紀錄錯誤訊息
        if(result) {
            responseMsgMap.put(SUCCESS, "預約時間已取消");
        } else {
            responseMsgMap.put(EXCEPTION, "取消失敗");
        }
        // 回到list清單頁
        doGet(req, resp);
    }
	
    /** 取得狀態為取消的預約時間清單 */
    private void getCancelReservationList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String vendorId = req.getParameter("vendorId");
        List<Reservation> cancelReservationList = service.findAllByVendorIdAndStatus(vendorId, INACTIVE);
        req.setAttribute("cancelReservationList", cancelReservationList);
        req.getRequestDispatcher(OFF_RESERVATION_PAGE).forward(req, resp);
    }
	
		
	
	
	
}
