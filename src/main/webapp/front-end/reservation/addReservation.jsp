<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Merry Me</title>


<link rel="icon"
	href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico"
	type="image/x-icon">


	

<%@include file="/front-end/vendor/common/vendorHead.jsp"%>
<%@include file="/front-end/header.jsp"%>
	
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/front-end/reservation/css/addReservation.css">

</head>

<body>
	<!-- Header Section Begin -->
	<%@include file="/front-end/header.jsp"%>
	<!-- Header End -->
				
	<!-- body Begin -->
	<div class="rwd_wrap group">
		<div class="col lg_12 md_6 sm_12">
			<ol itemscope itemtype="http://schema.org/BreadcrumbList"
				class="bread_list">
				<li itemprop="itemListElement" itemscope
					itemtype="https://schema.org/ListItem"><a itemprop="item"
					href="#" title="Marryme首頁"> <span itemprop="name">首頁</span></a>
					<meta itemprop="position" content="1"></li>
				<li itemprop="itemListElement" itemscope
					itemtype="https://schema.org/ListItem"><span itemprop="name">婚宴場地</span>
					<!--自己那頁的名稱-->
					<meta itemprop="position" content="2"></li>
			</ol>
		</div>
	</div>
	<div class="main_h1">
		<!--做服務or商品的才需要加-->
		<div class="rwd_wrap group">
			<div class="clearfix">
				<ul class="clearfix">
					<li><a href="#" class="">方案</a></li>
					<li><a href="#" class="onit">店家</a></li>
				</ul>
			</div>
		</div>
	</div>

<!-- 	<div class="filter_pc on_pc"> 做服務or商品的才需要加，這段先保留畫面位置因為有JS功能+還有功能選項尚待確認 -->
	

	<!--<div class="rwd_wrap group"> 這段做服務or商品才需要新增-->
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
<%
String placeId = request.getParameter("placeId");
// String vendorId = request.getParameter("vendorId");
%>
								<a class="venueInfo" target="_blank" href="跳轉到場商頁面"><span class="venueInfo_pic"> 
								<img src="<%=request.getContextPath()%>/weddingVenue?id=<%= placeId %>" />
								</span>
									<span class="venueInfo_content"> <span class="venueVendor">${place.placeTitle}</span>
									</span> <span class="showMore"> 
									<img
											src="https://statics.marry.com.tw/img/icon/arrow_SolidGray55.png">
									</span> 
								</a>


								

<!-- 										type="hidden" -->

									<input type="hidden" class="form_input input_code" type="text" value="<%= placeId %>" name="placeId" id="placeId" placeholder="placeId" autocomplete="off" required>					
									<input type="hidden" class="form_input input_code" type="text" value="${place.vendorId}" name="vendorId" id="vendorId" placeholder="廠商ID" autocomplete="off" required>
									<input type="hidden" class="form_input input_code" type="text" value="${member.memberId}" name="memberId" id="memberId" placeholder="會員ID" autocomplete="off" required>
										
									<span class="textSize"><i class="ff6687">*</i>預約大名</span>
									<span class="sattus" style="display: none;"></span> 
									<input class="form_input input_code" type="text" value="${reservation == null  ? "" : reservation.contactName}" name="contactName" id="contactName" placeholder="輸入名字" autocomplete="off" required>
										
									<span class="textSize"><i class="ff6687">*</i>聯絡電話</span> 
									<span class="sattus" style="display: none;"></span> 
									<input class="form_input input_code" type="text" value="${reservation == null  ? "" : reservation.contactNamber}" name="contactNumber" id="contactNumber" placeholder="輸入電話" autocomplete="off"
										maxlength="10" required>

									<div class="form_wrap_half">
										<span class="textSize"><i class="ff6687">*</i>宴客日期</span> 
										<span class="sattus" style="display: none;"></span>
										<input class="form_input input_code datepicker hasDatepicker" rel_status="2" type="date" value="${reservation == null  ? "" : reservation.contactDate} placeholder="預計婚期" id="eventDate" name="eventDate" autocomplete="off" required>
									</div>

									<div class="form_wrap_half">
										<span class="textSize"> <i class="ff6687">*</i>宴客時段 </span> 
										<span class="sattus" style="display: none;"></span> 
										<select class="form_select input_code" id="eventTime" name="eventTime" required>
											<option value="">選擇預約時段</option>
											<option value="12:00:00">中午</option>
											<option value="18:00:00">晚上</option>
										</select>
										<div class="invalid-feedback">
										    請選擇預約時段。
										</div>
									</div>



									<div class="form_wrap_half">
										<span class="textSize"> <i class="ff6687">*</i>預約日期 </span> 
										<span class="sattus" style="display: none;"></span> 
										<input class="form_input m_r_8 input_code form_select datepicker hasDatepicker" type="date" value="${reservation == null  ? "" : reservation.reservationDate}" placeholder="選擇預約日期" id="reservationDate" name="reservationDate" autocomplete="off" required>
									</div>

									<div class="form_wrap_half">
										<span class="textSize"> <i class="ff6687">*</i>預約時段
										</span> <span class="sattus" style="display: none;"></span> <select
											class="form_select input_code" id="reservationTime" name="reservationTime" required>
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
										<div class="invalid-feedback">
										    請選擇預約時段。
										</div>
									</div>

									<span class="textSize">備註</span>
									<textarea class="form_input input_note" type="text" value="${reservation == null  ? "" : reservation.reservationNotes}" name="reservationNotes" id="reservationNotes" placeholder="其他事項" autocomplete="off"></textarea>
							
								</form>
							</div>
							<div>
								<input type="hidden" name="vendorId" value="${vendorId}">
								<a href="${pageContext.request.contextPath}/front-end/reservation/addReservation.jsp"  class="submitBtn">
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
		  
		  <%=request.getContextPath()%>/weddingVenueWork?id=${weddingVenue.placeId}
		  var placeId = ${placeId};
		  alert(${placeId});
		  
		  
		</script>		

	<script>
	
	
	</script>	
	
	<!-- body End -->


	<!-- Footer Section Begin -->
	<%@include file="/front-end/footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
<!-- 	<script type="text/javascript" -->
<%-- 		src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script> --%>
<!-- 	<script type="text/javascript" -->
<%-- 		src="${pageContext.request.contextPath}/public/js/template/bootstrap.bundle.js"></script> --%>
<!-- 	<script type="text/javascript" -->
<%-- 		src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script> --%>
<!-- 	<script type="text/javascript" -->
<%-- 		src="${pageContext.request.contextPath}/public/js/marryme.js"></script> --%>



</body>
</html>