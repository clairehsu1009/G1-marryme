<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="activityList" scope="request"
	class="java.util.ArrayList" />


<html>
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
	<%@include file="/front-end/header.jsp"%>
	<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>

	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-archive">&nbsp;</i>優惠券管理
				</h1>
			</div>
			<form method="post"
				action="<%=request.getContextPath()%>/activity/findAll"
				style="margin-bottom: 0px;">
				<input type="hidden" name="vendorId" value="${vendorId}" />
				<ul class="app-breadcrumb breadcrumb">
					<li><button type="submit" class="btn btn-Success mr-5" name="action" value="getPlanItemInactiveList">查看已下架方案加購項目</button></li>
					<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
					<li class="breadcrumb-item">
					<a href="<%=request.getContextPath()%>/activity/findAll?vendorId=${vendorId}">優惠券管理</a></li>
				</ul>
			</form>
		</div>
		<div class="row productList" id="productList">
			<div class="product-tab col-lg-12 col-12">
				<div class="tab-item">
					<ul class="nav" role="tablist">
						<li><a class="active" data-toggle="tab" href="#tab-0"
							role="tab">全部</a></li>
						<li><a data-toggle="tab" href="#tab-1" role="tab">進行中的活動</a></li>
						<li><a data-toggle="tab" href="#tab-2" role="tab">接下來的活動</a></li>
						<li><a data-toggle="tab" href="#tab-3" role="tab">已結束</a></li>
					</ul>
				</div>
				<div class="tab-item-content">
					<div class="tab-content">
						<c:forEach begin="0" end="3" varStatus="loop">
							<c:set var="activeClass"
								value="${loop.index == 0 ? 'active' : ''}" />
							<div class="tab-pane fade-in ${activeClass}"
								id="tab-${loop.index}" role="tabpanel">
								<table class="table">
									<thead class="thead">
										<tr>
											<th scope="col">優惠代碼</th>
											<th scope="col">優惠活動名稱</th>
											<th scope="col">折扣額度</th>
											<th scope="col">活動開始時間</th>
											<th scope="col">活動結束時間</th>
											<th scope="col">活動內容</th>
											<th scope="col">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="activity" items="${activityList}" begin="0"
											end="${activityList.size()}">
											<tr>
												<td>${activity.discountCode}</td>
												<td>${activity.activityName}</td>
												<td>${activity.discount}</td>
												<td>${activity.activityStartTime}</td>
												<td>${activity.activityEndTime}</td>
												<td>${activity.activityDetail}</td>
												<td>
													<form method="post" action="<%=request.getContextPath()%>/activity/findAll" style="margin-bottom: 0px;">
														 <input type="hidden" name="discountCode" value="${activity.discountCode}">
														 <c:if test="${activity.editStatus == 0}">
															<button type="submit" class="btn btn-info" 
																formaction="<%=request.getContextPath()%>/marryme/activity/getOneForUpdate">編輯</button>
														</c:if>
														<button type="submit" class="btn btn-warning"
															formaction="<%=request.getContextPath()%>/marryme/activity/delete">下架</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

	</main>
	<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>


</body>
</html>