<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="product" scope="request"
	class="com.marryme.product.entity.Product" />
	
<!DOCTYPE html>
<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
	<%@include file="/front-end/header.jsp"%>
	<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-edit"></i>我的商品
				</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/product/findAll?vendorId=${vendor.vendorId}">商品管理</a></li>
			</ul>
		</div>

		<c:if test="${vendor.vendorId == product.vendorId}">
			<div class="tab-item-content">
				<div class="tab-content">
					<table class="table">
						<tbody>
							<tr>
								<th scope="col">商品類別</th>
								<td>${product.productCategory.productCategoryName}</td>
							</tr>
							<tr>
								<th scope="col">商品名稱</th>
								<td>${product.productName}</td>
							</tr>
							<tr>
								<th scope="col">商品圖片</th>
								<td><img
									src="<%=request.getContextPath()%>/ProductShowPhoto?productId=${product.productId}"
									alt="Product Image" width="70px" height="70px"></td>
							</tr>
							<tr>
								<th scope="col">自售價</th>
								<td>${product.originalPrice}</td>
							</tr>
							<tr>
								<th scope="col">平台價</th>
								<td>${product.platformPrice}</td>
							</tr>
							<tr>
								<th scope="col">庫存量</th>
								<td>${product.stockQuantity}</td>
							</tr>
							<tr>
								<th scope="col">商品描述</th>
								<td>${product.productDescription}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
	</main>
	<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

	<script type="text/javascript">
		
	</script>
</body>
</html>