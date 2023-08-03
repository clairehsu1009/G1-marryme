<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="productList" scope="request"
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
					<i class="fa fa-archive">&nbsp;</i>商品管理
				</h1>
			</div>
			<form method="post"
				action="<%=request.getContextPath()%>/product/findAll"
				style="margin-bottom: 0px;">
				<input type="hidden" name="vendorId" value="${vendorId}" />
				<ul class="app-breadcrumb breadcrumb">
					<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/product/findAll?vendorId=${vendorId}">商品管理</a></li>
				</ul>
			</form>
		</div>
		<div class="row productList" id="productList">
			<div class="product-tab col-lg-12 col-12">
				<div class="tab-item">
					<ul class="nav" role="tablist">
						<li><a class="active" data-toggle="tab" href="#tab-0"
							role="tab">未上架</a></li>
						<li><a data-toggle="tab" href="#tab-1" role="tab">上架中</a></li>
<!-- 						<li><a data-toggle="tab" href="#tab-2" role="tab">已售完</a></li> -->
<!-- 						<li><a data-toggle="tab" href="#tab-3" role="tab">已下架</a></li> -->
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
										<c:forEach var="product" items="${productList}" begin="0"
											end="${productList.size()}">
											<c:if test="${product.productStatus == loop.index}">
												<tr>
													<td>${product.productCategory.productCategoryName}</td>
													<td>${product.productName}</td>
													<td>
														<img src="<%=request.getContextPath()%>/ProductShowPhoto?productId=${product.productId}" alt="Product Image" width = "70px" height = "70px" class="rounded mx-auto d-block">
													</td>
													<td>${product.originalPrice}</td>
													<td>${product.platformPrice}</td>
													<td>${product.stockQuantity}</td>
													<td>${product.productDescription}</td>
													<td>
														<form method="post" action="<%=request.getContextPath()%>/product/findAll" style="margin-bottom: 0px;">
															<input type="hidden" name="productId" value="${product.productId}" />
															<input type="hidden" name="vendorId" value="${product.vendorId}" />
															<c:if test="${product.productStatus == 0 || product.productStatus == 1 || product.productStatus == 2}">
																<button type="submit" class="btn btn-info" formaction="<%=request.getContextPath()%>/product/getOneForUpdate">編輯</button>
															</c:if>
															<button type="submit" class="btn btn-warning"
															formaction="<%=request.getContextPath()%>/product/changeStatusToInactive">下架</button>
														</form>
													</td>
												</tr>
											</c:if>
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