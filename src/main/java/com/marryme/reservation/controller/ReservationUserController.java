package com.marryme.reservation.controller;

import static com.marryme.common.CommonString.ACTION;
import static com.marryme.common.CommonString.ERROR_MSG;
import static com.marryme.common.CommonString.EXCEPTION;
import static com.marryme.common.CommonString.GET_ERROR;
import static com.marryme.common.CommonString.RESPONSE_MSG_MAP;
import static com.marryme.common.CommonString.SUCCESS;
import static com.marryme.common.CommonString.UTF_8;
import static com.marryme.reservation.common.ReservationPages.RESERVATION_ITEM_USER_PAGE;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import com.marryme.reservation.service.impl.ReservationServiceImpl;
import com.marryme.member.vo.Member;

@WebServlet("/reservationUser")
public class ReservationUserController extends HttpServlet {
	private ReservationServiceImpl service;

	@Override
	public void init() throws ServletException {
		service = new ReservationServiceImpl();
	}

	/* 取member所有預約時段 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("member");
		String memberId = member.getMemberId();
		List<Object[]> currentVendorList = service.findVendorAllByMember(memberId);
		req.setAttribute("currentVendorList", currentVendorList);
		req.getRequestDispatcher(RESERVATION_ITEM_USER_PAGE).forward(req, resp);

	}

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
			case "changeStatusToCancel":
				changeStatusToCancel(req, resp, responseMsgMap);
				break;
			default:
				break;
			}		
		// 有exception 統一回到list清單頁
		}catch(Exception e) {
			e.printStackTrace();
			responseMsgMap.put(EXCEPTION, GET_ERROR);
			doGet(req, resp);
			return; // 阻止程式繼續執行
		}
	}
	
	/** 刪除 */
	private void changeStatusToCancel(HttpServletRequest req, HttpServletResponse resp,
			Map<String, String> responseMsgMap) throws ServletException, IOException {
		String reservationIdStr = req.getParameter("currentVendor[0]");
		boolean result = false;
		if (StringUtils.isNotBlank(reservationIdStr)) {
			result = service.changeStatusToCancel(Integer.valueOf(reservationIdStr));
		}
		// 如果更新失敗，紀錄錯誤訊息
		if (result) {
			responseMsgMap.put(SUCCESS, "預約時間已取消");
		} else {
			responseMsgMap.put(EXCEPTION, "取消失敗");
		}
		// 回到list清單頁
		doGet(req, resp);
	}

}
