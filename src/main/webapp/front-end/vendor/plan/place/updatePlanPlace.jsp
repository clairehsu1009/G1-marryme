<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="place" scope="request" class="com.marryme.plan.vo.Place" />
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
				<i class="fa fa-edit"></i>修改方案場地
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-place"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-place"><a href="<%=request.getContextPath()%>/plan-place?vendorId=${vendorId}">方案場地管理</a></li>
		</ul>
	</div>
	<!-- 之後這邊要改取得登入廠商的ID 才是正確的 -->
	<c:if test="${vendorId == place.vendorId}">
		<div class="row">
			<div class="col-md-12 productsAdd">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/plan-place">
					<div class="form-group">
						<label for="placePicture" class="col-sm-2 col-form-label">場地主圖片</label>
						<div class="col-sm-10">
							<input class="custom-select form-control" id="placePicture" name="placePicture" placeholder="請輸入場地主圖片"  type="">
						</div>
					</div>
					<div class="form-group">
						<label for="placeTitle" class="col-sm-2 col-form-label">場地標題</label>
						<c:if test="${responseMsgMap.containsKey('placeTitle')}">
							<span class="errorMsg">${responseMsgMap['placeTitle']}</span>
						</c:if>
						<div class="col-sm-10">
							<input class="form-control" id="placeTitle" name="placeTitle" type="text" placeholder="請輸入場地標題" value="${Place.placeTitle}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="numbeOfTables" class="col-sm-2 col-form-label">建議桌數區間</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="numbeOfTables" name="numbeOfTables" placeholder="請輸入建議桌數區間" value="${place.numbeOfTables}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="placeIntroduction" class="col-sm-2 col-form-label">場地介紹</label>
						<c:if test="${responseMsgMap.containsKey('placeIntroduction')}">
							<span class="errorMsg">${responseMsgMap['placeIntroduction']}</span>
						</c:if>
						<div class="col-sm-10">
							<input class="form-control" id="placeIntroduction" name="placeIntroduction" type="text" placeholder="請輸入場地介紹" value="${place.placeIntroduction}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="placePictures2" class="col-sm-2 col-form-label">圖片</label>
						<div class="col-sm-10">
							<input class="form-control" id="placePictures2" name="placePictures2" type="text" placeholder="請上傳圖片" value="${place.placePictures2}">
						</div>
					</div>
					<div class="form-group">
						<label for="placePictures3" class="col-sm-2 col-form-label">圖片</label>
						<div class="col-sm-10">
							<input class="form-control" id="placePictures3" name="placePictures3" type="text" placeholder="請上傳圖片" value="${place.placePictures3}">
						</div>
					</div>
					<div class="form-group">
						<label for="placePictures4" class="col-sm-2 col-form-label">圖片</label>
						<div class="col-sm-10">
							<input class="form-control" id="placePictures4" name="placePictures4" type="text" placeholder="請上傳圖片" value="${place.placePictures4}">
						</div>
					</div>
					<div class="form-group">
						<label for="placePictures5" class="col-sm-2 col-form-label">圖片</label>
						<div class="col-sm-10">
							<input class="form-control" id="placePictures5" name="placePictures5" type="text" placeholder="請上傳圖片" value="${place.placePictures5}">
						</div>
					</div>
					<div class="col-sm-10 productAddBtn">
						<input type="hidden" name="placeId" value="${place.place_id}">
						<input type="hidden" name="vendorId" value="${place.vendorId}">
						<a href="<%=request.getContextPath()%>/plan-item?vendorId=${vendorId}"><button type="button" class="btn btn-danger">取消</button></a>
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