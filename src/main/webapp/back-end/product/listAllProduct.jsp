<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="productList" scope="request"
	class="java.util.ArrayList" />

<!DOCTYPE html>
<html>
<html>
<%@include file="/back-end/common/backHead.jsp"%>

<body class="app sidebar-mini rtl">
    <%@include file="/back-end/common/backSidebar.jsp"%>

	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-archive">&nbsp;</i>商品總覽
				</h1>
			</div>
			<form method="post"
				action="<%=request.getContextPath()%>/product/findAll"
				style="margin-bottom: 0px;">
				<input type="hidden" name="empId" value="${Emp.empId}" />
				<ul class="app-breadcrumb breadcrumb">
					<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/product/getProductByStatus?&productStatus=0">商品管理</a></li>
				</ul>
			</form>
		</div>
		<div class="row productList" id="productList">
			<div class="product-tab col-lg-12 col-12">
				<div class="tab-item">
					<ul class="nav" role="tablist">
						<li><a class="${status == 0 ? 'active' : ''}" href="<%=request.getContextPath()%>/product/getProductByStatus?&productStatus=0">未上架</a></li>
						<li><a class="${status == 1 ? 'active' : ''}" href="<%=request.getContextPath()%>/product/getProductByStatus?&productStatus=1">已上架</a></li>
						<li>
							<div class="more_tools">
								<form action="${pageContext.request.contextPath}/product/searchProduct?productStatus=${status}" method="post">
								<div id="kwds_rs_bid" class="searchBar acResults">
									<input name="vendorId" id="kwds_bid" type="text" placeholder="廠商ID搜尋"
										   class="default">
									<input style="background: url(/marryme/public/images/front-end/search.svg) no-repeat;border:20px;width: 25px;height: 25px;position:absolute;right:10px;top:10px" class="sb-search-submit" type="submit" value="">
								</div>
								</form>
							</div>
						</li>
					</ul>
				</div>
				<div class="tab-item-content">
					<div class="tab-content">
						<c:forEach items="${productList}" var="p" varStatus="s1">
							<div class="strip <c:if test="${s1.index==0}">mt50</c:if>"> 
								<span style="display: inline-block; width: 20%;">商品ID：${p.productId}</span>
								<span style="display: inline-block; width: 20%;">廠商ID：${p.vendorId}</span>
								<span style="display: inline-block; width: 30%;">創建時間：${p.createdTime}</span>
							</div>
							<div class="tab-pane fade-in active"
								 role="tabpanel">
								<table class="table">
									<thead class="thead">
										<tr>
											<th scope="col">商品類別</th>
											<th scope="col">商品名稱</th>
											<th scope="col">商品圖片</th>
											<th scope="col">自售價</th>
											<th scope="col">平台售價</th>
											<th scope="col">庫存量</th>
											<th scope="col">商品描述</th>
										</tr>
									</thead>
									<tbody>
												<tr>
													<td>${p.productCategory.productCategoryName}</td>
													<td>${p.productName}</td>
													<td><img
														src="<%=request.getContextPath()%>/ProductShowPhoto?productId=${p.productId}"
														alt="Product Image" width="70px" height="70px"
														class="rounded mx-auto d-block"></td>
													<td><fmt:formatNumber value="${p.originalPrice}"
															type="number" pattern="$#,##0" /></td>
													<td><fmt:formatNumber value="${p.platformPrice}"
															type="number" pattern="$#,##0" /></td>

													<td>${p.stockQuantity}</td>
													<td>${p.productDescription}</td>
												</tr>
									</tbody>
								</table>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>


	</main>

	<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>
</body>
</html>