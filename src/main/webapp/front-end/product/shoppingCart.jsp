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
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/innerpage.css" />
    <link rel="icon" href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico" type="image/x-icon">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/client-index.css" />

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/themify-icons.css" type="text/css" />
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
                <span itemprop="name">購物車</span> 
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
          	 <c:if test="${empty sessionScope.cart}">
				  <tr class="empty-cart">
					  <td colspan="5">您的購物車是空的</td>
				  </tr>
			  </c:if>
           <c:if test="${not empty sessionScope.cart}">
            <div class="cart-table">
              <table>
                <thead>
                  <tr>
                    <th>商品圖片</th>
                    <th class="p-name">商品名稱</th>
                    <th>價格</th>
                    <th>數量</th>
                    <th>總計</th>
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
	                    <td class="p-price first-row"><fmt:formatNumber value="${me.value.product.platformPrice}" type="number" pattern="$#,###" /></td>
	                    <td class="qua-col first-row">
	                      <div class="quantity">
	                        <div class="qty-btn-group">
								<button type="button" class="down" data-unit-price="${me.value.product.platformPrice }" data-id="${me.key}" data-product-id="${me.key}">
									<i class="iconfont-caret-down inline-middle"></i>
								</button>
								<input type="text" value="${me.value.quantity}" data-id="${me.key}" data-type="number">
								<button type="button" class="up" data-unit-price="${me.value.product.platformPrice }" data-id="${me.key}" data-product-id="${me.key}">
									<i class="iconfont-caret-up inline-middle"></i>
								</button>
	                        </div>
	                      </div>
	                    </td>
	                    <td class="total-price first-row">$<span data-type="row-total" data-id="${me.key}"><fmt:formatNumber value="${me.value.price}" type="number" pattern="#,###" /></span></td>
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
	                    <li class="cart-total">合計(不含運費) <span style="color: #e7ab3c;font-size: 16px;font-weight: 700">$<em data-type="total"><fmt:formatNumber value="${cart.price}" type="number" pattern="#,###" /></em></span></li>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/shoppingCart.js" ></script>
<script>  
	function addThousandsSeparator(num) {
	    // 將數字轉為字串
	    let numStr = num.toString();
	    // 使用正則表達式在數字中添加千分位逗號
	    numStr = numStr.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	    return numStr;
	}
	
	function removeThousandsSeparator(str) {
	    // 去除字符串中的千分位逗號
	    const numStr = str.toString().replace(/,/g, "");
	
	    // 將去除千分位逗號後的字串轉換為數字
	    const num = parseFloat(numStr);
	
	    return num;
	}
	$(function() {
	    // .up class = up 向上按鈕 增加數量
	    $(".up").click(function() {
	        var id = $(this).attr("data-id"); // 獲取 data-id 標籤的值 
	        var productid = $(this).attr("data-product-id"); // 獲取 data-product-id 標籤的值
	        
	        // 數量
	        var number = parseInt($("[data-type=number][data-id=" + id + "]").val()); // 獲取 text 的 number 值取整數
	        $("[data-type=number][data-id=" + id + "]").val(++number); // 數量 + 1
	
	        // 商品小計
	        // html() 方法返回或設置被選元素的內容
	        var price = parseInt($(this).attr("data-unit-price")); // 獲取商品價格取整數
	        var rowtotal = removeThousandsSeparator($("[data-type=row-total][data-id=" + id + "]").html()); // 商品小計
	        $("[data-type=row-total][data-id=" + id + "]").html(addThousandsSeparator(rowtotal+price)); // 點擊添加數量按鈕 商品小計=當前商品價格+當前商品的小計
	        // 商品總價
	        var total = removeThousandsSeparator($("[data-type=total]").html()); // 全部商品的總價
	        $("[data-type=total]").html(addThousandsSeparator(total+ price)); // 點擊添加數量後 商品總價=商品價格+之前的商品總價
	
	        $.ajax({
	            url: '${pageContext.request.contextPath}/product/updateCartQuantity', 
	            type: "POST",
	            dataType: "json",
	            data: {
	                productId: productid,
	                quantity: number,
	            },
	            success: function(response) {
	                location.reload();
	            }
	        });
	    });
	    // .down class = down 向下 減少數量
	    $(".down").click(function() { 
	        var id = $(this).attr("data-id"); // 獲取 data-id 標籤的值
	        var productid = $(this).attr("data-product-id"); // 獲取 data-product-id 標籤的值
	        var number = parseInt($("[data-type=number][data-id=" + id + "]").val()); // 獲取 text 的 number 值取整數
	        if (number <= 0) { // 數量小於等於0
	            return false;
	        }
	        $("[data-type=number][data-id=" + id + "]").val(--number); // 數量 - 1
	
	        var price = parseInt($(this).attr("data-unit-price")); // 獲取商品價格取整數
	        var rowtotal = removeThousandsSeparator($("[data-type=row-total][data-id=" + id + "]").html()); // 商品小計
	        $("[data-type=row-total][data-id=" + id + "]").html(addThousandsSeparator(rowtotal-price)); // 點擊減少數量按鈕 商品小計=當前商品的小計-當前商品價格
	
	        var total = removeThousandsSeparator($("[data-type=total]").html()); // 全部商品的總價
	        $("[data-type=total]").html(addThousandsSeparator(total - price)); // 點擊減少數量後 商品總價=之前的商品總價-商品價格
	
	        $.ajax({
	            url: '${pageContext.request.contextPath}/product/updateCartQuantity', 
	            type: "POST",
	            dataType: "json",
	            data: {
	                productId: productid,
	                quantity: number,
	            },
	            success: function(data) {
	                location.reload();
	            }
	        });
	    });
	});

</script>

</body>
</html>