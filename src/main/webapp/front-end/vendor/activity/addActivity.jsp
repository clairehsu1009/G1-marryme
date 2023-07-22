<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="item" scope="request"
	class="com.marryme.activity.entity.Activity" />

<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
	<%@include file="/front-end/header.jsp"%>
	<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-plus">&nbsp;</i>新增優惠券
				</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/activity/findAll?vendorId=${vendorId}">優惠券管理</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col-md-12 productsAdd">
				<form method="post"
					action="<%=request.getContextPath()%>/activity/add">
					<div class="form-group">
						<label for="discountCode" class="col-sm-2 col-form-label">優惠代碼</label>
						<%-- 					<c:if test="${errorMsgMap.containsKey('itemType')}"> --%>
						<%-- 						<span class="errorMsg">${errorMsgMap['itemType']}</span> --%>
						<%-- 					</c:if> --%>
						<div class="col-sm-10">
							<input class="form-control" id="discountCode" name="discountCode"
								placeholder="請輸入優惠代碼" type="text" pattern="[0-9a-zA-Z]+"
								maxlength="10"
								value="${activity == null ? "" : activity.discountCode}"
								required>
						</div>
					</div>
					<div class="form-group">
						<label for="activityName" class="col-sm-2 col-form-label">優惠活動名稱</label>
						<%-- 					<c:if test="${errorMsgMap.containsKey('itemSelect')}"> --%>
						<%-- 						<span class="errorMsg">${errorMsgMap['itemSelect']}</span> --%>
						<%-- 					</c:if> --%>
						<div class="col-sm-10">
							<input class="form-control" id="activityName" name="activityName"
								placeholder="請輸入優惠活動名稱" type="text" maxlength="50"
								value="${activity == null ? "" : activity.activityName}"
								required>
						</div>
					</div>
					<div class="form-group">
						<label for="discount" class="col-sm-2 col-form-label">折扣額度</label>
						<%-- 					<c:if test="${errorMsgMap.containsKey('itemDeposit')}"> --%>
						<%-- 						<span class="errorMsg">${errorMsgMap['itemDeposit']}</span> --%>
						<%-- 					</c:if> --%>
						<div class="col-sm-10">
							<input class="form-control" id="discount" name="discount"
								placeholder="請輸入折扣額度" type="number" step="0.01"
								value="${activity == null ? "" : activity.discount}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="activityStartTime" class="col-sm-2 col-form-label">活動開始時間</label>
						<div class="col-sm-10">
							<input class="form-control" id="activityStartTime"
								name="activityStartTime" placeholder="請選擇活動開始時間"
								type="datetime-local"
								value="${activity == null ? "" : activity.activityStartTime}"
								required>
						</div>
					</div>
					<div class="form-group">
						<label for="activityEndTime" class="col-sm-2 col-form-label">活動結束時間</label>
						<div class="col-sm-10">
							<input class="form-control" id="activityEndTime"
								name="activityEndTime" placeholder="請選擇活動結束時間"
								type="datetime-local"
								value="${activity == null ? "" : activity.activityEndTime}"
								required>
						</div>
					</div>
					<div class="form-group">
						<label for="activityDetail" class="col-sm-2 col-form-label">活動內容</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="activityDetail"
								name="activityDetail" placeholder="請輸入活動內容">${activity == null ? "" : activity.activityDetail}</textarea>
						</div>
					</div>

					<div class="col-sm-10 productAddBtn">
						<input type="hidden" name="vendorId" value="${vendorId}">
						<a href="<%=request.getContextPath()%>/activity/findAll?vendorId=${vendorId}"><button
								type="button" class="btn btn-danger">取消</button></a>
						<button type="submit" class="btn btn-info">儲存</button>
					</div>
				</form>
			</div>
		</div>

	</main>
	<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

	<script type="text/javascript">
		
	</script>
</body>
</html>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>

<!-- <html> -->
<!-- <head> -->
<!--     <meta charset="UTF-8"> -->
<!--     <title>新增優惠碼 - 廠商後台 - MarryMe</title> -->
<%--     <link href="<%=request.getContextPath()%>/public/css/style.css" rel="stylesheet" type="text/css"> --%>
<%--     <link href="<%=request.getContextPath()%>/back-end/activity/css/add.css" rel="stylesheet" type="text/css"> --%>
<!-- </head> -->

<!-- <body class="app sidebar-mini rtl"> -->
<%-- <%@include file="/front-end/vendor/common/vendorHead.jsp"%> --%>
<%-- <%@include file="/front-end/header.jsp"%> --%>
<%-- <%@include file="/front-end/vendor/common/vendorSidebar.jsp"%> --%>
<!--     <div class="col lg_9 md_12 sm_12 page_container"> -->
<!--         <h1 class="page_title">新增優惠碼</h1> -->
<!--         <form method="post" action="/marryme/activity/add" name="edit_form"> -->
<!--             <div class="page_content"> -->
<!--                 <div class="content_border"> -->
<!--                     <h3 class="title">優惠碼資料</h3> -->
<!--                     <ul> -->
<!--                         <li class="form_item"> -->
<!--                             <span class="item_name"><i>*</i>優惠代碼</span> -->
<!--                             <input type="text" pattern="[0-9a-zA-Z]+" size="10" maxlength="10" value="" -->
<!--                                 id="discountCode" name="discountCode" -->
<!--                                 class="basic_input input_code title_count_input_js" required> -->
<!--                             <span class="status" style="display:none"><i></i></span> -->
<!--                         </li> -->
<!-- <!--                         <li class="form_item"> -->
<!-- <!--                             <span class="item_name">廠商帳號</span> -->
<!-- <!--                             <input type="text" value="" id="vendorId" name="vendorId" -->
<!-- <!--                                 class="basic_input input_code title_count_input_js"> -->
<!-- <!--                         </li> -->
<!--                         <li class="form_item"> -->
<!--                             <span class="item_name"><i>*</i>優惠活動名稱</span> -->
<!--                             <input type="text" size="10" maxlength="50" value="" id="activityName" name="activityName" -->
<!--                                 class="basic_input input_code title_count_input_js" required> -->
<!--                         </li> -->
<!--                         <li class="form_item"> -->
<!--                             <span class="item_name"><i>*</i>折扣額度</span> -->
<!--                             <input type="number" size="10" value="" id="discount" name="discount" -->
<!--                                 class="basic_input input_code title_count_input_js" step="0.01" required> -->
<!--                         </li> -->
<!--                         <li class="form_item"> -->
<!--                             <span class="item_name"><i>*</i>活動開始時間</span> -->
<!--                             <input type="datetime-local" size="20" value="" id="activityStartTime" name="activityStartTime" -->
<!--                                 placeholder="" class="basic_input input_code" required> -->
<!--                         </li> -->
<!--                         <li class="form_item"> -->
<!--                             <span class="item_name"><i>*</i>活動結束時間</span> -->
<!--                             <input type="datetime-local" size="20" value="" id="activityEndTime" name="activityEndTime" placeholder="" -->
<!--                                 class="basic_input input_code" required> -->
<!--                         </li> -->
<!--                         <li class="form_item"> -->
<!--                             <span class="item_name"><i>*</i>活動內容</span> -->
<!--                             <div class="item_content"> -->
<!--                                 <textarea id="activityDetail" name="activityDetail" rows="" cols="" -->
<!--                                     class="basic_input input_code story_count_input_js" placeholder="" -->
<!--                                     style="overflow-y: scroll;height: 180px;"></textarea> -->
<!--                             </div> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->

<!--                 <div class="form_btn"> -->
<!--                     <a class="btn_common btn_primary" href="javascript:void(0);" title="取消" -->
<!--                         onclick="confirmCancel()">取消</a> -->
<!--                 </div> -->
<!--                 <div class="form_btn"> -->
<!--                     <button type="submit" class="btn_common btn_primary" title="儲存">儲存</button> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </form> -->
<!--     </div> -->

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/back-end/activity/js/add.js"></script> --%>
<!-- </body> -->

<!-- </html> -->