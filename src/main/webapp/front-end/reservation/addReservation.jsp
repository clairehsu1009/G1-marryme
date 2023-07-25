<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="zh-Hant">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>


	<head>
	
		<!-- 引入JQUERY -->
		<!-- <script src="js/reservation.js"></script> -->
		<link rel="stylesheet" type="text/css" href="css/addReservation.css">
	</head>
	
	
	<body>
		<main class="app-content">

			<div id="pop">
				<div class="pop-casemain radius_3">

					<form method="post" action="<%=request.getContextPath()%>/reservation">										
						<h3 class="title_center">
							預約賞廳 <a class="close" href="javascript:void('0');" onclick="destroyObj();tb_remove();">X</a>
						</h3>
						
						<div id="reserve_form" class="pop-casemain-inner">
							<div class="form_wrap">
								<div class="pop_accentArea_wrap">
						
								</div>

								<a class="venueInfo" target="_blank" href="跳轉到場商頁面"><span class="venueInfo_pic"> <img
											src="https://imgs.gvm.com.tw/upload/gallery/20221204/125075.jpg"></span>
									<span class="venueInfo_content"> <span class="venueVendor">貓咪怕怕會館</span>
									</span> <span class="showMore"> <img
											src="https://statics.marry.com.tw/img/icon/arrow_SolidGray55.png">
									</span> </a>

								<form id="venueReserve_form" class="venueReserve_form">

										
									<span class="textSize"><i class="ff6687">*</i>會員</span>
									<span class="sattus" style="display: none;"></span> 
									<input class="form_input input_code" type="text" value="member8@gmail.com" name="memberId" id="memberId" placeholder="會員ID" autocomplete="off">
										
									<span class="textSize"><i class="ff6687">*</i>預約大名</span>
									<span class="sattus" style="display: none;"></span> 
									<input class="form_input input_code" type="text" value="${reservation == null  ? "" : reservation.contactName}" name="contactName" id="contactName" placeholder="輸入名字" autocomplete="off">
										
									<span class="textSize"><i class="ff6687">*</i>聯絡電話</span> 
									<span class="sattus" style="display: none;"></span> 
									<input class="form_input input_code" type="text" value="${reservation == null  ? "" : reservation.contactNamber}" name="contactNumber" id="contactNumber" placeholder="輸入電話" autocomplete="off"
										maxlength="10">

									<div class="form_wrap_half">
										<span class="textSize"><i class="ff6687">*</i>宴客日期</span> 
										<span class="sattus" style="display: none;"></span>
										<input class="form_input input_code datepicker hasDatepicker" rel_status="2" type="date" value="${reservation == null  ? "" : reservation.contactDate} placeholder="預計婚期" id="eventDate" name="eventDate" autocomplete="off">
									</div>

									<div class="form_wrap_half">
										<span class="textSize"> <i class="ff6687">*</i>宴客時段 </span> 
										<span class="sattus" style="display: none;"></span> 
										<select class="form_select input_code" id="eventTime" name="eventTime">
											<option value="">選擇預約時段</option>
											<option value="12:00:00">中午</option>
											<option value="18:00:00">晚上</option>
										</select>
									</div>



									<div class="form_wrap_half">
										<span class="textSize"> <i class="ff6687">*</i>預約日期 </span> 
										<span class="sattus" style="display: none;"></span> 
										<input class="form_input m_r_8 input_code form_select datepicker hasDatepicker" type="date" value="${reservation == null  ? "" : reservation.reservationDate}" placeholder="選擇預約日期" id="reservationDate" name="reservationDate" autocomplete="off">
									</div>

									<div class="form_wrap_half">
										<span class="textSize"> <i class="ff6687">*</i>預約時段
										</span> <span class="sattus" style="display: none;"></span> <select
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

									<span class="textSize">備註</span>
									<textarea class="form_input input_note" type="text" value="${reservation == null  ? "" : reservation.reservationNotes}" name="reservationNotes" id="reservationNotes" placeholder="其他事項" autocomplete="off"></textarea>
							
								</form>
							</div>
							<div>
								<input type="hidden" name="vendorId" value="${vendorId}">
								<a href="<%=request.getContextPath()%>/reservation?vendorId=${vendorId}"  class="submitBtn">
									<button type="button" class="submitBtn">取消</button>
								</a>
						
								<a  class="submitBtn">
								<button type="submit" class="submitBtn" name="action" value="insert" id="insert">儲存</button>
								</a>
							</div>
							
							
							
							
						</div>
					</form>
				</div>
			</div>


		</main>	
		
		
		<script>
		  // 獲取當前日期
		  var currentDate = new Date().toISOString().split("T")[0];
		  
		
		  // 將當前日期設定為最小日期
		  document.getElementById("eventDate").min = currentDate;
		  document.getElementById("reservationDate").min = currentDate;
		  
		  
		  
		
		  
		  
		</script>		
	</body>
</html>