<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="productList" scope="request"
	class="java.util.ArrayList" />

<!DOCTYPE html>
<html>
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
	<%@include file="/front-end/header.jsp"%>
	<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>

	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-archive">&nbsp;</i>商品訂單管理
				</h1>
			</div>
			<form method="post"
				action="<%=request.getContextPath()%>/order/getOrderByStatus?vendorId=${vendor.vendorId}&orderStatus=1"
				style="margin-bottom: 0px;">
				<input type="hidden" name="vendorId" value="${vendor.vendorId}" />
				<ul class="app-breadcrumb breadcrumb">
					<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/order/getOrderByStatus?vendorId=${vendor.vendorId}&orderStatus=1">商品訂單管理</a></li>
				</ul>
			</form>
		</div>
		<div class="row productList" id="orderList">
			<div class="product-tab col-lg-12 col-12">
				<div class="tab-item">
					<ul class="nav" role="tablist">
						<li><a class="${status == 1 ? 'active' : ''}"   href="<%=request.getContextPath()%>/order/getOrderByStatus?vendorId=${vendor.vendorId}&orderStatus=1"
							>未出貨</a></li>
						<li><a class="${status == 2 ? 'active' : ''}" href="<%=request.getContextPath()%>/order/getOrderByStatus?vendorId=${vendor.vendorId}&orderStatus=2" >已出貨</a></li>
						<li><a class="${status == 4 ? 'active' : ''}" href="<%=request.getContextPath()%>/order/getOrderByStatus?vendorId=${vendor.vendorId}&orderStatus=4" >已取消</a></li>
					</ul>
				</div>
				<div class="tab-item-content">
					<div class="tab-content">
						<c:forEach items="${orderList}" var="o" varStatus="s1">
							<div class="strip <c:if test="${s1.index==0}">mt50</c:if>"> 
								<span style="display: inline-block; width: 20%;">訂單ID：${o.orderId}</span> 
								<span style="display: inline-block; width: 20%;">會員ID：${o.memberId}</span> 
								<span style="display: inline-block; width: 30%;">下單時間：${o.orderDate}</span>
								<span style="float: right; padding-right: 20px;color: #f55c4b;" data-type="openorder">共${o.orderDetails.size()}件商品</span>
							</div>
							<div class="tab-pane fade-in active"
								 role="tabpanel">
								<table class="table">
									<thead class="thead">
										<tr>
											<th scope="col">商品圖片</th>
											<th scope="col">商品名稱</th>
											<th scope="col">平台售價</th>
											<th scope="col">數量</th>
											<th scope="col">小計</th>
											<th scope="col">運費</th>
											<th scope="col">總計</th>
											<th scope="col">訂單狀態</th>
											<c:if test="${o.orderStatus == 2} or ${o.orderStatus == 3} or ${o.orderStatus == 4}">
												<th scope="col">操作</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="orderDetails" items="${o.orderDetails}"
												   varStatus="status">
												<tr>
													<td>
														<img src="<%=request.getContextPath()%>/ProductShowPhoto?productId=${orderDetails.product.productId}" alt="Product Image" width = "70px" height = "70px" class="rounded mx-auto d-block">
													</td>
													<td>${orderDetails.product.productName}</td>
													<td><fmt:formatNumber type="number"
														value="${orderDetails.product.platformPrice}"
														pattern="$#,###" /></td>
													<td>${orderDetails.quantity}</td>
													<td><fmt:formatNumber type="number"
														value="${orderDetails.amount}" pattern="$#,###" /></td>
													<c:if test="${status.index == 0}">
														<td rowspan=${o.orderDetails.size() }>
															$${o.shippingFee}
														</td>
													</c:if>
													<c:if test="${status.index == 0}">
														<td rowspan=${o.orderDetails.size() }><fmt:formatNumber
																type="number" value="${o.totalAmount}" pattern="$#,###" />
														</td>
													</c:if>
													<c:if test="${status.index == 0}">
													<td rowspan=${o.orderDetails.size() }>
														<c:if test="${o.orderStatus == 1}">
															待出貨
														</c:if>
														<c:if test="${o.orderStatus == 2}">
															待收貨
														</c:if>
														<c:if test="${o.orderStatus == 0}">
															待付款
														</c:if>
														<c:if test="${o.orderStatus == 3}">
															已完成
														</c:if>
														<c:if test="${o.orderStatus == 4}">
															已取消
														</c:if>
												    </td>
													</c:if>

													<c:if test="${status.index == 0}">
														<td rowspan=${o.orderDetails.size() }>
															<form method="post" action="/product/findAll" style="margin-bottom: 0px;">
																<input type="hidden" name="productId" value="${orderdetails.productId}" />
																<c:if test="${o.orderStatus == 1 }">
																	<button type="button" class="btn btn-danger" id="ship" data-type="ship" data-order-id="${o.orderId}">出貨</button>
																</c:if>
															</form>
														</td>
													</c:if>
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


	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.all.min.js"></script>
	<script>
		$(document).ready(function () {
				$("#ship").on("click", (function(){
					var id = $(this).attr("data-order-id"); 
	
					$.ajax({
						url: '${pageContext.request.contextPath}/order/updateOrderStatus', 
						type: "POST",
						dataType: "json",
						data: {
							orderId: id,
							orderStatus: 2
						},
						success:function(response) { 
							 if (response.code == 200) {
							 	Swal.fire({
							 		icon: 'success',
							 		title: '出貨成功',
							 		// 在Swal的確認按鈕點擊後執行
			                        onClose: function () {
			                            // 刷新頁面
			                            location.reload();
			                        }
							 	});
							 } else {
				                    Swal.fire("出貨失敗!", "請稍後再試。", "error");
				                }
				            },
				            error: function (xhr, status, error) {
				            	 console.log(xhr);
				            	    console.log(status);
				            	    console.log(error);
				                Swal.fire("出貨失敗!", "請稍後再試。", "error");
				            }
						});
					}));
				});
	</script>
</body>
</html>