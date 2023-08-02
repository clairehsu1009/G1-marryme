package com.marryme.reservation.contriller;

import static com.marryme.common.CommonString.*;

import static com.marryme.common.ControllerUtils.parameterMapToVo;
import static com.marryme.common.ControllerUtils.validErrorForParameterMap;
import static com.marryme.plan.common.PlanPages.ONE_PLAN_PLACE_PAGE;
import static com.marryme.reservation.common.ReservationPages.*;


import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.checkerframework.checker.signature.qual.BinaryNameWithoutPackage;

import com.marryme.reservation.service.impl.ReservationServiceImpl;
import com.marryme.reservation.vo.Reservation;


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
			case INSERT:insert(req, resp, responseMsgMap);
				break;
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
	
	/*新增*/
	private void insert(HttpServletRequest req, HttpServletResponse resp, Map<String, String> responseMsgMap) throws ServletException, IOException {
        Map<String, String[]> reqMap = req.getParameterMap();
        validErrorForParameterMap(reqMap, this.getInValidFieldsMsg(), responseMsgMap);
        
//        Reservation vo = parameterMapToVo(reqMap, Reservation.class);
        Reservation vo = new Reservation();
        if(StringUtils.isNotBlank(reqMap.get("vendorId")[0])) {
        	vo.setVendorId(reqMap.get("vendorId")[0]);
        }   
        if(StringUtils.isNotBlank(reqMap.get("memberId")[0])) {
        	vo.setMemberId(reqMap.get("memberId")[0]);
        }        	    
        if(StringUtils.isNotBlank(reqMap.get("contactName")[0])) {
	        	vo.setContactName(reqMap.get("contactName")[0]);	        	
	        } else {	            
	            responseMsgMap.put(EXCEPTION, "請輸入聯繫名稱");
	            doGet(req, resp);
	            return; // 阻止程式繼續執行
	        };
         if (StringUtils.isNotBlank(reqMap.get("contactNumber")[0])&& reqMap.get("contactNumber")[0].length() == 10) {
        	    vo.setContactNumber(reqMap.get("contactNumber")[0]);
        	}  else {
        	    // 如果聯絡電話為空或長度不為10，拋出自訂的例外，並回應錯誤訊息給前端
        	    responseMsgMap.put(EXCEPTION, "請輸入正確的10位數聯絡電話");
        	    doGet(req, resp);
        	    return; // 阻止程式繼續執行
        	};
           
        if(StringUtils.isNotBlank(reqMap.get("eventDate")[0]) && StringUtils.isNotBlank(reqMap.get("eventTime")[0])) {
        	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	String[] eventTime = reqMap.get("eventTime") ;
        	String[] eventDate = reqMap.get("eventDate") ;
        	String eventString = eventDate[0]+" "+eventTime[0];//2023-07-11 12:00:00
        	try {
        		// 將前端傳遞的日期時間字串轉換為 Date 物件
        		Date date = sdf2.parse(eventString);

        		// 將 Date 物件轉換為 Timestamp 物件
        		Timestamp timestamp = new Timestamp(date.getTime());

        		// 設定 Timestamp 物件到 vo 物件的 eventDate 屬性
        		vo.setEventDate(timestamp);

			} catch (ParseException e) {
				e.printStackTrace();
			}
        }   else {
    	    // 拋出自訂的例外，並回應錯誤訊息給前端
    	    responseMsgMap.put(EXCEPTION, "請輸入宴客日期");
    	    doGet(req, resp);
    	    return; // 阻止程式繼續執行
    	};
        if(StringUtils.isNotBlank(reqMap.get("reservationDate")[0]) && StringUtils.isNotBlank(reqMap.get("reservationTime")[0])) {
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	String[] reservationDate = reqMap.get("reservationDate") ;
	    	String[] reservationTime = reqMap.get("reservationTime") ;
	    	String eventString = reservationDate[0]+" "+reservationTime[0];//2023-07-11 12:00:00
	    	try {
        		// 將前端傳遞的日期時間字串轉換為 Date 物件
        		Date date = sdf.parse(eventString);

        		// 將 Date 物件轉換為 Timestamp 物件
        		Timestamp timestamp = new Timestamp(date.getTime());

        		// 設定 Timestamp 物件到 vo 物件的 eventDate 屬性
        		vo.setReservationDate(timestamp);	    	
			} catch (ParseException e) { 
				e.printStackTrace();
			}
        }  else {
    	    // 拋出自訂的例外，並回應錯誤訊息給前端
    	    responseMsgMap.put(EXCEPTION, "請輸入預約日期");
    	    doGet(req, resp);
    	    return; // 阻止程式繼續執行
    	};
       
	    vo.setStatus(1);
        
        if (!responseMsgMap.isEmpty()) {
            req.setAttribute("reservation", vo);
            req.getRequestDispatcher(ADD_RESERVATION_STRING).forward(req, resp);
            return;
        }
        
        Integer id = service.insert(vo);
        if (id == null) {
            responseMsgMap.put(EXCEPTION, INSERT_ERROR);
            doGet(req, resp);
            return;
        }
        responseMsgMap.put(SUCCESS, INSERT_SUCCESS);
        Reservation reservation = service.getOne(id);
        req.setAttribute("reservation", reservation);
        req.getRequestDispatcher(ONE_RESERVATION_CONFIRM).forward(req, resp);
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
       
        Reservation reservation = new Reservation();
        
        if (!responseMsgMap.isEmpty()) {
            req.setAttribute("reservation", reservation);
            req.getRequestDispatcher(UPDATE_RESERVATION_ITEM_PAGE).forward(req, resp);
            return;
        }
             
       
        String reservationIdStr = req.getParameter("reservationId");
        Integer reservationId = Integer.parseInt(reservationIdStr);
        reservation.setReservationId(reservationId);

        
   
        if(StringUtils.isNotBlank(reqMap.get("vendorId")[0])) {
        	reservation.setVendorId(reqMap.get("vendorId")[0]);
        }   
        if(StringUtils.isNotBlank(reqMap.get("memberId")[0])) {
        	reservation.setMemberId(reqMap.get("memberId")[0]);
        }        	    
        if(StringUtils.isNotBlank(reqMap.get("contactName")[0])) {
        	reservation.setContactName(reqMap.get("contactName")[0]);	        	
	        } else {	            
	            responseMsgMap.put(EXCEPTION, "請輸入聯繫名稱");
	            doGet(req, resp);
	            return; // 阻止程式繼續執行
	        };
         if (StringUtils.isNotBlank(reqMap.get("contactNumber")[0])&& reqMap.get("contactNumber")[0].length() == 10) {
        	 reservation.setContactNumber(reqMap.get("contactNumber")[0]);
        	}  else {
        	    // 如果聯絡電話為空或長度不為10，拋出自訂的例外，並回應錯誤訊息給前端
        	    responseMsgMap.put(EXCEPTION, "請輸入正確的10位數聯絡電話");
        	    doGet(req, resp);
        	    return; // 阻止程式繼續執行
        	};
           
        if(StringUtils.isNotBlank(reqMap.get("eventDate")[0]) && StringUtils.isNotBlank(reqMap.get("eventTime")[0])) {
        	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	String[] eventTime = reqMap.get("eventTime") ;
        	String[] eventDate = reqMap.get("eventDate") ;
        	String eventString = eventDate[0]+" "+eventTime[0];//2023-07-11 12:00:00
        	try {
        		// 將前端傳遞的日期時間字串轉換為 Date 物件
        		Date date = sdf2.parse(eventString);

        		// 將 Date 物件轉換為 Timestamp 物件
        		Timestamp timestamp = new Timestamp(date.getTime());

        		// 設定 Timestamp 物件到 vo 物件的 eventDate 屬性
        		reservation.setEventDate(timestamp);

			} catch (ParseException e) {
				e.printStackTrace();
			}
        }   else {
    	    // 拋出自訂的例外，並回應錯誤訊息給前端
    	    responseMsgMap.put(EXCEPTION, "請輸入宴客日期");
    	    doGet(req, resp);
    	    return; // 阻止程式繼續執行
    	};
        if(StringUtils.isNotBlank(reqMap.get("reservationDate")[0]) && StringUtils.isNotBlank(reqMap.get("reservationTime")[0])) {
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	String[] reservationDate = reqMap.get("reservationDate") ;
	    	String[] reservationTime = reqMap.get("reservationTime") ;
	    	String eventString = reservationDate[0]+" "+reservationTime[0];//2023-07-11 12:00:00
	    	try {
        		// 將前端傳遞的日期時間字串轉換為 Date 物件
        		Date date = sdf.parse(eventString);

        		// 將 Date 物件轉換為 Timestamp 物件
        		Timestamp timestamp = new Timestamp(date.getTime());

        		// 設定 Timestamp 物件到 vo 物件的 eventDate 屬性
        		reservation.setReservationDate(timestamp);	    	
			} catch (ParseException e) { 
				e.printStackTrace();
			}
        }  else {
    	    // 拋出自訂的例外，並回應錯誤訊息給前端
    	    responseMsgMap.put(EXCEPTION, "請輸入預約日期");
    	    doGet(req, resp);
    	    return; // 阻止程式繼續執行
    	};
       
    	
    	reservation.setStatus(1);
       

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
