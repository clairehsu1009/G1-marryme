<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>



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
	                <a itemprop="item" href="#" title="Marryme首頁">
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
	            <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
	                <span itemprop="name">刷卡</span> 
	                <meta itemprop="position" content="4">
	            </li>
	        </ol>
	    </div>
	</div>
    <section class="checkout-section spad">
      <div class="container">
        <form action="${pageContext.request.contextPath}/order/create" method="post" class="checkout-form" id="ff1"> 
          <div class="row">
            <div class="col-lg-6">
              <h4>買家保障</h4> 
              <div class="row">
                <div class="col-lg-3">
                 <img src="${pageContext.request.contextPath}/public/images/front-end/shield.png" width="100">
                </div>
                  <div class="col-lg-6">
                      <div class="place-order">
                          <div class="order-total" style="padding:5px">
                              <div class="payment-check">
                                  <div class="pc-item">
                                      <label for="pc-check">
                                          全額退款如果產品不符合説明
                                          <input type="radio" name="paytype3" id="pc-check" value="0" checked="checked"/>
                                          <span class="checkmark"></span>
                                      </label>
                                  </div>
                                  <div class="pc-item">
                                      <label for="pc-paypal">
                                          全額退款如果你沒有收到訂單
                                          <input type="radio" name="paytype1" id="pc-paypal" value="1" checked="checked"/>
                                          <span class="checkmark"></span>
                                      </label>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="place-order">
                <h4>刷卡資訊</h4>
                  <div class="row">
                      <div class="col-lg-6">
                          <label for="cardNumber">信用卡卡號<span>*</span></label>
                          <input type="text" id="cardNumber" name="cardNumber" required/>

                      </div>
                      <div class="col-lg-6">
                          <img src="${pageContext.request.contextPath}/public/images/front-end/icon-payment-methods-grid.png" width="140">
                      </div>
                      <input type="hidden" name="paymentMethod" value="1">

                      <div class="col-lg-6">
                          <label for="exp">信用卡有效期限<span>*</span></label>
                          <input type="text" id="exp" name="exp" required/>

                      </div>
                      <div class="col-lg-6">
                          <label for="cvv">信用卡背面末三碼(檢查碼)<span>*</span></label>
                          <input type="text" id="cvv" name="cvv" required/>

                      </div>
                      <div class="col-lg-6" style="margin-left: 150px">
                      <input type="hidden" id="memberId" name="memberId" value="${member.memberId}">
                          <button type="button" class="site-btn place-btn" id="submit">
                              確認付款
                          </button>
                      </div>
                  </div>
              </div>
            </div>
          </div>
        </form>
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
		$("#submit").click(function() { //綁定sumbit提交訂單按鈕，添加點擊事件
		    var num = /^\d*$/; //全數字
		    var title = $.trim($("#cardNumber").val()); 
		    var memberId = $("#memberId").val();
	
		    if(title == ""){  
		        Swal.fire({
		            icon: 'error',
		            title: '請輸入信用卡卡號！',
		            text: '請稍後再試。',
		        });
		        return false;
		    }
		    if(title.length != 16 || !num.exec(title)) {
		        Swal.fire({
		            icon: 'error',
		            title: '信用卡卡號長度必須為16位且為數字！',
		            text: '請稍後再試。',
		        });
		        return false;
		    }
	
		    var exp = $.trim($("#exp").val()); 
		    if(exp == ""){  //為空
		        Swal.fire({
		            icon: 'error',
		            title: '請輸入信用卡有效期限！',
		            text: '請稍後再試。',
		        });
		        return false;
		    }
		    var cvv = $.trim($("#cvv").val()); 
		    if(cvv==""){  //為空
		        Swal.fire({
		            icon: 'error',
		            title: '請輸入信用卡背面末三碼(檢查碼)！',
		            text: '請稍後再試。',
		        });
		        return false;
		    }
		    if(cvv.length != 3 || !num.exec(cvv)) {
		        Swal.fire({
		            icon: 'error',
		            title: '信用卡背面末三碼(檢查碼)長度必須為3位且為數字！',
		            text: '請稍後再試。',
		        });
		        return false;
		    }
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
		                    window.location.href = '${pageContext.request.contextPath}/order/findOrderByMemberId?orderStatus=1&memberId='+ memberId;
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
		});

	</script>

</body>
</html>
