<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="item" scope="request" class="com.marryme.plan.vo.Item" />

<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


<main class="app-content">
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-plus">&nbsp;</i>新增加購項目
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/plan-item?vendorId=${vendorId}">方案加購項目管理</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12 productsAdd">
			<form method="post" action="<%=request.getContextPath()%>/plan-item">
				<div class="form-group">
					<label for="itemType" class="col-sm-2 col-form-label">項目種類</label>
					<c:if test="${responseMsgMap.containsKey('itemType')}">
						<span class="errorMsg">${responseMsgMap['itemType']}</span>
					</c:if>
					<div class="col-sm-10">
						<select class="custom-select form-control" id="itemType" name="itemType" required>
							<option selected value="">請選擇項目種類</option>
							<option value="0"  ${item != null && (item.itemType==0)? 'selected': ''}>試菜</option>
							<option value="1"  ${item != null && (item.itemType==1)? 'selected': ''}>菜價</option>
							<option value="2"  ${item != null && (item.itemType==2)? 'selected': ''}>婚禮企劃團隊服務</option>
							<option value="3"  ${item != null && (item.itemType==3)? 'selected': ''}>婚禮佈置</option>
							<option value="4"  ${item != null && (item.itemType==4)? 'selected': ''}>婚禮主持人</option>
							<option value="5"  ${item != null && (item.itemType==5)? 'selected': ''}>婚禮小物</option>
							<option value="6"  ${item != null && (item.itemType==6)? 'selected': ''}>其他</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="itemSelect" class="col-sm-2 col-form-label">項目名稱</label>
					<c:if test="${responseMsgMap.containsKey('itemSelect')}">
						<span class="errorMsg">${responseMsgMap['itemSelect']}</span>
					</c:if>
					<div class="col-sm-10">
						<input class="form-control" id="itemSelect" name="itemSelect" placeholder="請輸入項目名稱"  type="text" value="${item == null  ? "" : item.itemSelect}" required>
					</div>
				</div>
				<div class="form-group">
					<label for="itemDescription" class="col-sm-2 col-form-label">項目說明</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="itemDescription" name="itemDescription" placeholder="請輸入項目說明" value="${item == null  ? "" : item.itemDescription}">
					</div>
				</div>
				<div class="form-group">
					<label for="itemDeposit" class="col-sm-2 col-form-label">訂金</label>
					<c:if test="${responseMsgMap.containsKey('itemDeposit')}">
						<span class="errorMsg">${responseMsgMap['itemDeposit']}</span>
					</c:if>
					<div class="col-sm-10">
						<input class="form-control" id="itemDeposit" name="itemDeposit" type="text" placeholder="請輸入項目訂金" value="${item == null  ? "" : item.itemDeposit}" required>
					</div>
				</div>
				<div class="form-group">
					<label for="itemTotal" class="col-sm-2 col-form-label">金額</label>
					<c:if test="${responseMsgMap.containsKey('itemTotal')}">
						<span class="errorMsg">${responseMsgMap['itemTotal']}</span>
					</c:if>
					<div class="col-sm-10">
						<input class="form-control" id="itemTotal" name="itemTotal" type="text" placeholder="請輸入項目金額" value="${item == null  ? "" : item.itemTotal}" required>
					</div>
				</div>
				<div class="col-sm-10 productAddBtn">
					<input type="hidden" name="vendorId" value="${vendorId}">
					<a href="<%=request.getContextPath()%>/plan-item?vendorId=${vendorId}"><button type="button" class="btn btn-danger">取消</button></a>
					<button type="submit" class="btn btn-info" name="action" value="insert">儲存</button>
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