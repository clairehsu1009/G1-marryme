<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Marry Me</title>
    <link rel="icon" href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico" type="image/x-icon">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css" type="text/css" />
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/front-template/css/bootstrap.min.css" type="text/css" /> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/front-template/css/font-awesome.min.css" type="text/css" /> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/themify-icons.css" type="text/css" />
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/elegant-icons.css" type="text/css" /> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/owl.carousel.min.css" type="text/css" /> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/nice-select.css" type="text/css" /> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/jquery-ui.min.css" type="text/css" /> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/style.css" type="text/css" />
</head>

<body>
<!-- Header Section Begin -->
<%@include file="/front-end/header.jsp"%>
<!-- Header End -->

<!-- body Begin -->
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
                <span itemprop="name">購物車</span> <!--自己那頁的名稱-->
                <meta itemprop="position" content="3">
            </li>
        </ol>
    </div>
</div>
 <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
           <c:if test="${not empty sessionScope.cart}">
            <div class="cart-table">
<%--              <form action="${pageContext.request.contextPath}/checkOut.jsp" method="post"> <!-- 修改表單的action，指向結帳頁面的URL --> --%>
              <table>
                <thead>
                  <tr>
                    <th>Image</th>
                    <th class="p-name">Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>操作</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${sessionScope.cart.productMap}" var="me">
	                  <tr>
	                    <td class="cart-pic first-row">
	                      <img src="${pageContext.request.contextPath}/ProductShowPhoto?productId=${me.key}" alt="${me.value.product.productName}" style="width: 170px;"/>
	                    </td>
	                    <td class="cart-title first-row">
	                      <h5>${me.value.product.productName}</h5>
	                    </td>
	                    <td class="p-price first-row">$${me.value.product.platformPrice}</td>
	                    <td class="qua-col first-row">
	                      <div class="quantity">
	                        <div class="pro-qty">
	                          <input type="text" name="quantity" value="${me.value.quantity}" onchange="update(this, ${me.key}, ${me.value.quantity})" />
	                        </div>
	                      </div>
	                    </td>
	                    <td class="total-price first-row">$${me.value.price}</td>
	                    <td class="close-td first-row"><a href="${pageContext.request.contextPath}/product/deleteCartProduct?productId=${me.key}" style="color: black;"><i class="fa-solid fa-xmark"></i></a></td>
	                  </tr>
	                </c:forEach>
	                </tbody>
	              </table>
	          </div>
	            <div class="row">
	              <div class="col-lg-4">
	                <div class="cart-buttons">
	                  <a href="/marryme/front-end/product/product.jsp" class="primary-btn continue-shop">繼續購物</a>
	                  <a href="${pageContext.request.contextPath}/product/clearCart" id="clearCartBtn" class="primary-btn up-cart">清空購物車</a>
	                </div>
	                <div class="discount-coupon">
	                  <h6>Discount Codes</h6>
	                  <form action="#" class="coupon-form">
	                    <input type="text" placeholder="Enter your codes" />
	                    <button type="submit" class="site-btn coupon-btn">
	                      Apply
	                    </button>
	                  </form>
	                </div>
	              </div>
	              <div class="col-lg-4 offset-lg-4">
	                <div class="proceed-checkout">
	                  <ul>
	                    <li class="subtotal">Subtotal <span>$240.00</span></li>
	                    <li class="cart-total">總金額 <span>$${cart.price}</span></li>
	                  </ul>
	                  <a href="${pageContext.request.contextPath}/front-end/product/checkOut.jsp" class="proceed-btn">前往結帳</a>
	                </div>
	              </div>
	            </div>
	          </c:if>
	          </div>
	        </div>
	      </div>
	    </section>
	    <!-- Shopping Cart Section End -->
<!-- body End -->


<!-- Footer Section Begin -->
<%@include file="/front-end/footer.jsp"%>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
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

<script type="text/javascript">  
        /* @input 將輸入框本身填入
           @id 將商品id傳遞進來，告訴伺服器是修改哪一個購物項目
           @oldValue 原本的值，如果使用者不想修改了，就修改為原本的值
        */
        function update(input, id, oldValue) {

        // 獲取得到輸入框的數據
        var quantity = input.value;

        // 詢問使用者是否真的修改
        var b = window.confirm("你確定修改嗎？");

        // 如果確定修改，就跳轉到修改的Servlet上
        if (b) {
        window.location.href = "${pageContext.request.contextPath}/product/updateCartQuantity?productId=" + id + "&quantity=" + quantity + "";
        } else {
        // 如果不確定修改，將輸入框的數據改成原來的值
        input.value = oldValue;
        }
        }
</script>
<!-- 在 JavaScript 中添加事件監聽器 -->
<script>
document.getElementById('clearCartBtn').addEventListener('click', function(event) {
  event.preventDefault(); // 阻止按鈕的默認行為，避免直接跳轉到連結

  // 使用 Swal.fire 顯示彈出提醒訊息
  Swal.fire({
    title: '確認清空購物車？',
    text: '您確定要清空購物車嗎？此操作無法恢復。',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: '確定',
    cancelButtonText: '取消',
  }).then((result) => {
    // 使用者按下確定後執行相應的動作
    if (result.isConfirmed) {
      // 使用者按下確定後，將連結送到後端清除
      window.location.href = event.target.href;
    }
  });
});
</script>


</body>
</html>