<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="item" scope="request" class="com.marryme.plan.vo.Item" />
<jsp:useBean id="responseMsgMap" scope="request" type="java.util.HashMap"/>

<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-edit"></i>修改預約日期
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/reservation?vendorId=${vendorId}">方案加購項目管理</a></li>
		</ul>
	</div>
	<!-- 之後這邊要改取得登入廠商的ID 才是正確的 -->
<%-- 	<c:if test="${vendorId == reservation.vendorId}"> --%>
		<div class="row">
			<div class="col-md-12 productsAdd">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation">
					<div class="form-group">
						<label for="itemType" class="col-sm-2 col-form-label">預約賞聽</label>
					</div>
					
					<div class="form-group">
						<label for="itemSelect" class="col-sm-2 col-form-label">客戶名稱</label>						
						<div class="col-sm-10">
							<input class="form-control" id="contactName" name="contactName" type="text" placeholder="請輸入名稱" value="${reservation.contactName}" required>
						</div>
					</div>
					
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">聯繫電話</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="contactNumer" name="contactNumber" placeholder="請輸入聯繫電話" value="${reservation.contactNumber}">
						</div>
					</div>
					
					
					
					
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">宴客日期</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="eventDate" name="eventDate" placeholder="請輸入宴客日期" value="${reservation.eventDate}" >
						</div>
					</div>
					
					
					
									
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">宴客時段</label>
						<span class="sattus" style="display: none;"></span> 
					
						<select
							class="form_select input_code" id="eventTime" name="eventTime">
							<option value="">選擇預約時段</option>
							<option value="12:00:00">中午</option>
							<option value="18:00:00">晚上</option>
						</select>
						
					</div>



					
					
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">預約日期</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="reservationDate" name="reservationDate" placeholder="請輸入預約日期" value="${reservation.reservationDate} ">
						</div>
						
						
					</div>
					
					
					<div class="form-group">						
						<label for="itemDescription" class="col-sm-2 col-form-label">預約時段</label>
						<span class="sattus" style="display: none;"></span> 
						<select
							class="form_select input_code" id="reservationTime" name="reservationTime">
							<option value="">選擇預約時段</option>
							<option value="12:00:00">12:00</option>
							<option value="12:30:00">12:30</option>
							<option value="13:00:00">13:00</option>
							<option value="13:30:00">13:30</option>
							<option value="14:00:00">14:00</option>
							<option value="14:30:00">14:30</option>
							<option value="15:00:00">15:00</option>
							<option value="15:30:00">15:30</option>
							<option value="16:00:00">16:00</option>
							<option value="16:30:00">16:30</option>
							<option value="17:00:00">17:00</option>
							<option value="17:30:00">17:30</option>
							<option value="18:00:00">18:00</option>
							<option value="18:30:00">18:30</option>
							<option value="19:00:00">19:00</option>
							<option value="19:30:00">19:30</option>
							<option value="20:00:00">20:00</option>
						</select>
					</div>
							
					
					
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">備註</label>
						<div class="col-sm-10">
<%-- 							<textarea type="text" class="form-control" id="reservationNotes" name="reservationNotes" placeholder="請輸入備註資訊" value="${reservation.reservationNotes}"> --%>
<!-- 							</textarea> -->
							<textarea type="text" class="form-control" id="reservationNotes" name="reservationNotes" placeholder="請輸入備註資訊">
							${reservation.reservationNotes}
							</textarea>

						</div>
					</div>
					
					
					
					
					<div class="col-sm-10 productAddBtn">
						<input type="hidden" name="reservationId" value="${reservation.reservationId}">
						<input type="hidden" name="vendorId" value="${reservation.vendorId}">
						<input type="hidden" name="memberId" value="${reservation.memberId}">
						<input type="hidden" name="status" value="${reservation.status}">
						
						<a href="<%=request.getContextPath()%>/reservation?vendorId=${vendorId}">
							<button type="button" class="btn btn-danger">取消</button>
						</a>

							<button type="submit" class="btn btn-info" name="action" value="update" 
							 id="update" onclick="assembleDateTime()">儲存</button>
							
							
							
					</div>
				</FORM>
			</div>
		</div>
<%-- 	</c:if> --%>
</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>


<script type="text/javascript">

		//獲取當前日期
		var currentDate = new Date().toISOString().split("T")[0];
		
		
		// 將當前日期設定為最小日期
		document.getElementById("eventDate").min = currentDate;
		document.getElementById("reservationDate").min = currentDate;


	//=========後端傳值前端接受===============================
		
		// 獲取後端傳來的宴客日期和宴客時段值
		var eventDateTimeValue = "${reservation.eventDate}";
		var reservationDateValue = "${reservation.reservationDate}";

		// 將後端傳來的日期時間值轉換為 JavaScript 的 Date 物件
		var eventDateTime = new Date(eventDateTimeValue);
		var reservationDateTime = new Date(reservationDateValue);

		// 將宴客日期設定為宴客日期的值
		document.getElementById("eventDate").value = formatDate(eventDateTime);
		document.getElementById("reservationDate").value = formatDate(reservationDateTime);

		// 獲取宴客時段的選擇框元素
		var eventTimeSelect = document.getElementById("eventTime");
		var reservationTimeSelect = document.getElementById("reservationTime");

		// 根據宴客日期的值選中對應的宴客時段選項
		if (eventDateTime.getHours() == 12) {
		    eventTimeSelect.value = "12:00:00";
		} else {
		    eventTimeSelect.value = "18:00:00";
		}
		
		
		//取得預約時段的時間	
		let hours = reservationDateTime.getHours();
		let minutes = reservationDateTime.getMinutes();

		let combinedTime = hours + ":" + (minutes < 10 ? "0" : "") + minutes;

		if (combinedTime === "12:00") {
		    reservationTimeSelect.value = "12:00:00";
		} else if (combinedTime === "12:30") {
		    reservationTimeSelect.value = "12:30:00";
		} else if (combinedTime === "13:00") {
		    reservationTimeSelect.value = "13:00:00";
		} else if (combinedTime === "13:30") {
		    reservationTimeSelect.value = "13:30:00";
		} else if (combinedTime === "14:00") {
		    reservationTimeSelect.value = "14:00:00";
		} else if (combinedTime === "14:30") {
		    reservationTimeSelect.value = "14:30:00";
		} else if (combinedTime === "15:00") {
		    reservationTimeSelect.value = "15:00:00";
		} else if (combinedTime === "15:30") {
		    reservationTimeSelect.value = "15:30:00";
		} else if (combinedTime === "16:00") {
		    reservationTimeSelect.value = "16:00:00";
		} else if (combinedTime === "16:30") {
		    reservationTimeSelect.value = "16:30:00";
		} else if (combinedTime === "17:00") {
		    reservationTimeSelect.value = "17:00:00";
		} else if (combinedTime === "17:30") {
		    reservationTimeSelect.value = "17:30:00";
		} else if (combinedTime === "18:00") {
		    reservationTimeSelect.value = "18:00:00";
		} else if (combinedTime === "18:30") {
		    reservationTimeSelect.value = "18:30:00";
		} else if (combinedTime === "19:00") {
		    reservationTimeSelect.value = "19:00:00";
		} else if (combinedTime === "19:30") {
		    reservationTimeSelect.value = "19:30:00";
		} else if (combinedTime === "20:00") {
		    reservationTimeSelect.value = "20:00:00";
		} 			

		// 函數：格式化日期時間為 yyyy-mm-dd 格式
		function formatDate(date) {
		    var year = date.getFullYear();
		    var month = (date.getMonth() + 1).toString().padStart(2, '0');
		    var day = date.getDate().toString().padStart(2, '0');
		    return year + '-' + month + '-' + day;
		}


	    


</script>
</body>
</html>