<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.marryme.product.entity.Cart" %>
<%@ page import="com.marryme.product.entity.CartItem" %>
<%@ page import="com.marryme.product.entity.JspFunction" %>



<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Marry Me</title>
    <link rel="icon" href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico" type="image/x-icon">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet" />

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/themify-icons.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/style.css" type="text/css" />

</head>

<body>
	<!-- Header Section Begin -->
	<%@include file="/front-end/header.jsp"%>
	<!-- Header End -->
	<!-- Breadcrumb Section Begin -->
	<div class="rwd_wrap group">
	    <div class="col lg_12 md_6 sm_12">
	        <ol itemscope itemtype="http://schema.org/BreadcrumbList" class="bread_list">
	            <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
	                <a itemprop="item" href="${pageContext.request.contextPath}/index" title="Marryme首頁">
	                    <span itemprop="name">首頁</span></a>
	                <meta itemprop="position" content="1">
	            </li>
	            <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
	                <span itemprop="name">商品</span> 
	                <meta itemprop="position" content="2">
	            </li>
	            <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
	                <span itemprop="name">結帳</span>
	                <meta itemprop="position" content="3">
	            </li>
	        </ol>
	    </div>
	</div>
	    <section class="checkout-section spad">
	      <div class="container">
	      <c:if test="${not empty sessionScope.cart}">
	        <form action="${pageContext.request.contextPath}/order/create" method="post" class="checkout-form" id="ff1"> 
	          <div class="row">
	            <div class="col-lg-6">
	              <h4>收貨資訊</h4> 
	              <div class="row">
	                <div class="col-lg-12">
	                  <label for="memberName">收件人姓名<span>*</span></label>
	                  <input type="text" id="memberName" name="recipientName" required/>
	                </div>
	                <div class="col-lg-12">
	                  <label for="memberAddress">收件人地址<span>*</span></label>
	                  <input type="text" id="memberAddress" name="recipientAddress" required/>
	                </div>
	                <div class="col-lg-12">
	                  <label for="memberPhone">收件人電話<span>*</span></label>
	                  <input type="text" id="memberPhone" name="recipientPhone" required/>
	                </div>
	              </div>
	            </div>
	            <div class="col-lg-6">
	              <div class="place-order">
	                <h4>你的訂單</h4>
	                <div class="order-total">
	                  <ul class="order-table">
	                    <li>商品 <span>小計</span></li>
	                    
	                    <c:forEach items="${cart.productMap}" var="me">
	                    <li class="fw-normal">
	                      ${me.value.product.productName} x ${me.value.quantity} <span><fmt:formatNumber type="number" value="${me.value.price}" pattern="$#,###" /></span>
	                    </li>
	                    </c:forEach>
	                    <li class="fw-normal">小計(不含運費)<span><fmt:formatNumber type="number" value="${sessionScope.cart.price}" pattern="$#,###" /></span></li>
						<!-- 設置 productMap 到 sessionScope -->
						<c:set var="productMap" value="${sessionScope.cart.productMap}" />
						    
						<!-- 使用自訂 Function 來實例化 vendorCounts -->
	    				<c:set var="vendorCounts" value="<%= JspFunction.createVendorCounts() %>" />
						<c:forEach items="${productMap}" var="item">
							<c:set target="${vendorCounts}" property="${item.value.vendorId}" value="${vendorCounts[item.value.vendorId] + 1}" />
						</c:forEach>
						    
						<!-- 計算總運費 -->
						<c:set var="totalShippingCost" value="0" />
						<c:forEach items="${vendorCounts}" var="entry">
							<!-- 獲取廠商的運費數量和廠商數量 -->
							<c:set var="shippingCount" value="${entry.value}" />
						    <c:set var="vendorCount" value="${entry.key}" />
							        
							<!-- 計算該廠商的運費總額 -->
						    <c:set var="shippingCostForVendor" value="${shippingCount * 120}" />
							        
							<!-- 累加到總運費中 -->
							<c:set var="totalShippingCost" value="${totalShippingCost + shippingCostForVendor}" />
						</c:forEach>
	                    
	                    <li class="fw-normal">運費<span><fmt:formatNumber type="number" value="${totalShippingCost}" pattern="$#,###" /></span></li>
	                    <li class="total-price">總金額 <span><fmt:formatNumber type="number" value="${sessionScope.cart.price + totalShippingCost}" pattern="$#,###" /></span></li>
	                  </ul>
	                  <div class="payment-check">
	                    <div class="pc-item">
	                      <label for="pc-check">
	                        轉帳
	                        <input type="radio" id="pc-check" value="0" name="paymentMethod" checked/>
	                        <span class="checkmark"></span>
	                      </label>
	                    </div>
	                    <div class="pc-item">
	                      <label for="pc-paypal">
	                        刷卡
	                        <input type="radio" id="pc-paypal" value="1" name="paymentMethod"/>
	                        <span class="checkmark"></span>
	                      </label>
	                    </div>
	                  </div>
	                  <div class="order-btn">
	                  <input type="hidden" id="memberId" name="memberId" value="${member.memberId}">
	                    <button type="submit" class="site-btn place-btn" id="submit">
	                      結帳
	                    </button>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </form>
	        </c:if>
	      </div>
	    </section>
	
		<!-- Footer Section Begin -->
		<%@include file="/front-end/footer.jsp"%>
		<!-- Footer Section End -->

		<!-- Js Plugins -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery.form.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.bundle.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/marryme.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/jquery.countdown.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/jquery.nice-select.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/jquery.zoom.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/jquery.dd.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/jquery.slicknav.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/owl.carousel.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/main.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/products-search.js" ></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.all.min.js"></script>
		<script>
			$(document).ready(function() {
			  $("#submit").on("click", function() {
				event.preventDefault(); // 阻止表單預設提交行為
			    // 獲取收貨人資訊
			    var recipientName = $("#memberName").val();
			    var recipientAddress = $("#memberAddress").val();
			    var recipientPhone = $("#memberPhone").val();
			    
			    // 獲取支付方式
			    var paymentMethod = $("input[name='paymentMethod']:checked").val();
			    var memberId = $("#memberId").val();
			
			    if (recipientName === "" || recipientAddress === "" || recipientPhone === "") {
			        Swal.fire({
			          icon: 'error',
			          title: '請填寫完整的收件人資訊',
			          text: '請確保收件人姓名、地址和電話都填寫完整。',
			        });
			        return; // 阻止表單送出
			    }
			    // 構建傳送的數據
			    var formData = {
			      recipientName: recipientName,
			      recipientAddress: recipientAddress,
			      recipientPhone: recipientPhone,
			      paymentMethod: paymentMethod,
			      memberId: memberId
			    };
				
			    var paymentMethod = $("input[name='paymentMethod']:checked").val();
			    if (paymentMethod == "1"){
			    	window.location.href = '${pageContext.request.contextPath}/order/create?recipientName=' + recipientName + '&recipientAddress=' + recipientAddress + '&recipientPhone=' + recipientPhone + '&paymentMethod=1&memberId=' + memberId;
			    } else {
			    	 $("#ff1").ajaxSubmit({  //綁定form表單 ajax提交表單
			    	      success: function(response) {
			    	          // 顯示 Swal 成功消息
			    	          Swal.fire({
			    	            icon: 'success',
			    	            title: '訂單已成立',
			    	            text: '您的訂單已成功成立！',
			    	            confirmButtonText: '查看訂單',
			    	          }).then((result) => {
			    	            if (result.isConfirmed) {
			    	              // 導向會員中心的查看訂單畫面，替換成實際的 URL
			    	              window.location.href = '${pageContext.request.contextPath}/order/findOrderByMemberId?orderStatus=1&memberId=' + memberId;
			    	            }
			    	          });
			    	        },
			    	        error: function(xhr, status, error) {
			    	          // 顯示 Swal 錯誤消息
			    	          Swal.fire({
			    	            icon: 'error',
			    	            title: '訂單成立失敗',
			    	            text: '訂單成立過程中發生錯誤，請稍後再試。',
			    	          });
			    	        }
			    	 });
			    }
			  });
			});
		</script>

</body>
</html>
