<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.marryme.product.service.impl.ProductCategoryServiceImpl"%>
<%@ page import="com.marryme.product.entity.ProductCategory"%>
<%@ page import="java.util.List"%>



<jsp:useBean id="product" scope="request"
	class="com.marryme.product.entity.Product" />

<%
// 創建 service 物件並獲取所需的資料
ProductCategoryServiceImpl productCategorySvc = new ProductCategoryServiceImpl();
List<ProductCategory> allProductCategories = productCategorySvc.findAll();
request.setAttribute("allProductCategories", allProductCategories);
%>


<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
	<%@include file="/front-end/header.jsp"%>
	<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-plus">&nbsp;</i>新增商品
				</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item"><a
					href="<%=request.getContextPath()%>/product/findAll?vendorId=${vendorId}">商品管理</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col-md-12 productsAdd">
				<form method="post"
					action="<%=request.getContextPath()%>/product/add"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="productCategoryId" class="col-sm-2 col-form-label">商品類別</label>
						<c:if test="${responseMsgMap.containsKey('productCategoryId')}">
							<span class="errorMsg">${responseMsgMap['productCategoryId']}</span>
						</c:if>
						<div class="col-sm-10">
							<select class="form-control" id="productCategoryId"
								name="productCategoryId" required>
								<c:forEach var="productCategory" items="${allProductCategories}">
									<option value="${productCategory.productCategoryId}"
										<c:if test="${(product.productCategoryId == productCategory.productCategoryId)}">selected</c:if>>
										${productCategory.productCategoryName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="productName" class="col-sm-2 col-form-label">商品名稱</label>
						<c:if test="${responseMsgMap.containsKey('productName')}">
							<span class="errorMsg">${responseMsgMap['productName']}</span>
						</c:if>
						<div class="col-sm-10">
							<input class="form-control" id="productName" name="productName"
								placeholder="請輸入商品名稱" type="text" maxlength="50"
								value="${product == null ? " " : product.productName}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="image" class="col-sm-2 col-form-label">圖片</label>
						<c:if test="${responseMsgMap.containsKey('image')}">
							<span class="errorMsg">${responseMsgMap['image']}</span>
						</c:if>
						<div class="col-sm-10">
							<input class="custom-select form-control" id="image" name="image"
								placeholder="請上傳圖片" type="file" value="${product == null ? "" :product.image}">
							<div id="preview" max-width="200px" max-height="200px"></div>
						</div>
					</div>
					<div class="form-group">
						<label for="originalPrice" class="col-sm-2 col-form-label">自售價</label>
						<div class="col-sm-10">
							<input class="form-control" id="originalPrice"
								name="originalPrice" placeholder="請輸入自售價" type="number" min="1"
								step="1" value="${product == null ? " " :
								product.originalPrice}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="platformPrice" class="col-sm-2 col-form-label">平台售價</label>
						<div class="col-sm-10">
							<input class="form-control" id="platformPrice"
								name="platformPrice" placeholder="請輸入平台售價" type="number" min="1"
								step="1" value="${product == null ? " " :
								product.platformPrice}" required>
						</div>
					</div>
					<div class="form-group">
						<label for=stockQuantity class="col-sm-2 col-form-label">庫存量</label>
						<c:if test="${responseMsgMap.containsKey('stockQuantity')}">
							<span class="errorMsg">${responseMsgMap['stockQuantity']}</span>
						</c:if>
						<div class="col-sm-10">
							<input class="form-control" id="stockQuantity"
								name="stockQuantity" placeholder="請輸入庫存量" type="number" min="0"
								step="1" value="${product == null ? " " :
								product.stockQuantity}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="productDescription" class="col-sm-2 col-form-label">商品描述</label>
						<c:if test="${responseMsgMap.containsKey('productDescription')}">
							<span class="errorMsg">${responseMsgMap['productDescription']}</span>
						</c:if>
						<div class="col-sm-10">
							<textarea class="form-control" id="productDescription"
								name="productDescription" placeholder="請輸入商品描述">${product == null ? "" : product.productDescription}</textarea>
						</div>
					</div>

					<div class="col-sm-10 productAddBtn">
						<input type="hidden" name="vendorId" value="${vendorId}">
						<a
							href="<%=request.getContextPath()%>/product/findAll?vendorId=${vendorId}"><button
								type="button" class="btn btn-danger">取消</button></a>
						<button type="submit" class="btn btn-info">儲存</button>
					</div>
				</form>
			</div>
		</div>

	</main>
	<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

	<script type="text/javascript">
		//實現上傳圖片可以預覽所上傳的圖片,若重新上傳其他圖片,可以移除舊的圖片預覽,只顯示最新的狀態

		let myFile = document.getElementById("image");
		let preview = document.getElementById('preview');

		function init() {
			myFile.addEventListener('change', function(e) {
				$("#preview").empty();
				let files = e.target.files;
				if (files !== null) {
					let file = files[0];
					if (file.type.indexOf('image') > -1) {
						let reader = new FileReader();
						reader.addEventListener('load', function(e) {
							let result = e.target.result;
							let img = document.createElement('img');
							img.src = result;
							img.style.maxWidth = '100%'; /* Ensure the image fits within the container */
							img.style.maxHeight = '100%';
							preview.append(img);
						});
						reader.readAsDataURL(file);
					} else {
						alert('請上傳圖片！');
					}
				}
			});
		}

		window.onload = init;
	</script>
</body>
</html>