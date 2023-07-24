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
	<c:if test="${vendorId == reservation.vendorId}">
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
							<input type="text" class="form-control" id="eventDate" name="eventDate" placeholder="請輸入宴客日期" value="${reservation.eventDate}">
						</div>
					</div>
					
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">預約日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="reservationDate" name="reservationDate" placeholder="請輸入預約日期" value="${reservation.reservationDate}">
						</div>
					</div>
					
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">備註</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="reservationNotes" name="reservationNotes" placeholder="請輸入備註資訊" value="${reservation.reservationNotes}">
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
						<button type="submit" class="btn btn-info" name="action" value="update">儲存</button>
					</div>
				</FORM>
			</div>
		</div>
	</c:if>
</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script type="text/javascript">

</script>
</body>
</html>