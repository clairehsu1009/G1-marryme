<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="product" scope="request" class="com.marryme.product.entity.Product" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Marry Me</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico"
	type="image/x-icon">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/style.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front-end/product/css/product_detail.css"
	type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.min.css">
</head>

<body>
	<!-- Header Section Begin -->
	<%@include file="/front-end/header.jsp"%>
	<!-- Header End -->

	<!-- body Begin -->
	<div class="rwd_wrap group">
		<div class="col lg_12 md_6 sm_12">
			<ol itemscope itemtype="http://schema.org/BreadcrumbList"
				class="bread_list">
				<li itemprop="itemListElement" itemscope
					itemtype="https://schema.org/ListItem"><a itemprop="item"
					href="#" title="Marryme首頁"> <span itemprop="name">首頁</span></a>
					<meta itemprop="position" content="1"></li>
				<li itemprop="itemListElement" itemscope
					itemtype="https://schema.org/ListItem"><span itemprop="name">${product.vendor.vendorName}</span></a>
					<meta itemprop="position" content="2" /></li>
				<li><span itemprop="name">${product.productName}</span>
					<meta itemprop="position" content="3" /></li>
			</ol>
		</div>
	</div>
	<section class="rwd_wrap profile_detail">
		<div class="info">
			<div class="detail">
				<div class="name">
					<h2>
						${product.vendor.vendorName}
					</h2>
				</div>
				<div>
					<a class="evaluate"
						href="#"> 
						<span class="bg_star">
						</span> 5.0&nbsp;
						<span class="counts" id="evaluate_counts_basic">(39)</span></a>
				</div>
			</div>
		</div>
		<div class="toolbar">
			<a class="ask btn_common btn_primary add_ask" href="javascript:;"
				rel_m_id="MktGdnBZVk82L2U0THMwOGZB" rel_s_id="17411" rel_a_id="760">
				立即詢問 </a>
		</div>
	</section>

	<section class="rwd_wrap group">
		<div class="favor_content">
			<div class="content_left">
				<a href="javascript:;" class="album lightbox"> 
					<img src="<%=request.getContextPath()%>/ProductShowPhoto?productId=${param.productId}" class="album_img">
				</a>
			</div>
			<div class="content_right">
				<h1 class="title">${product.productName}</h1>
				<p class="price">
					平台價 NT$ <span id="platformPrice">${product.platformPrice}</span>
				</p>
				<p class="price_original">
					原價 NT$ <span id="originalPrice">${product.originalPrice}</span>
				</p>
				<button class="product_report" data-bs-toggle="modal"
					data-bs-target="#reportModal">匿名檢舉商品</button>
				<div class="d_line"></div>
				<ul class="good_info clearfix" style="padding-left: 0px">
					<li><span>優惠券</span>
						<div class="d-grid gap-2 d-md-flex justify-content-md-start">
							<button class="btn btn-outline-danger me-md-2" type="button">現打8折</button>
							<button class="btn btn-outline-danger" type="button">-10%OFF</button>
						</div></li>
					<li><span>銷量</span>
						<p>30</p></li>
					<li><span>庫存量</span>
						<p>${product.stockQuantity}</p></li>
					<li><span>評價</span>
						<p>
							<img src="<%=request.getContextPath()%>/public/images/front-end/selected.svg"> 5.0&nbsp;
						</p></li>
					<li><span>數量</span>
						<div class="qty-input">
							<input class="product-qty" type="number" name="product-qty"
								min="1" value="1">
						</div></li>
				</ul>
				<div class="action">
					<ul style="padding-left: 0">
						<li class="btn_wrap"><a class="btn add_ask"
							href="javascript:;" >加入購物車</a></li>
					</ul>
				</div>
				</ul>
			</div>
			<div class="good_copyright">
				<div class="d_line"></div>
				<div class="desc">
					${product.productDescription}
				</div>
			</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="reportModal" tabindex="-1"
		aria-labelledby="reportModalLabel" style="display: block;margin-left: auto;margin-right: auto;margin-top: -500;padding-right: 17px;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reportModalLabel">匿名檢舉商品</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<textarea class="form-control" rows="4" placeholder="請輸入檢舉內容"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">關閉</button>
					<button type="button" class="btn btn-primary">儲存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- body End -->


	<!-- Footer Section Begin -->
	<%@include file="/front-end/footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/public/js/template/bootstrap.bundle.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/public/js/marryme.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/front-end/product/js/productDetail.js"></script>
		    <!-- 載入 Bootstrap 5 的 JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous"></script>
    <!-- 引入SweetAlert2的JS程式碼 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.all.min.js"></script>
    <script>
	 	// 獲取 URL 中的 productId 參數
			const urlParams = new URLSearchParams(window.location.search);
			const productId = urlParams.get('productId');
			const memberId = urlParams.get('memberId');
			const currentDomain = window.location.origin;
			const apiUrl = `${currentDomain}/marryme/product/addCart`;
		
	    $(document).ready(function() {
	        // 監聽加入購物車按鈕的點擊事件
	        $(".add_ask").on("click", function() {
	          // 獲取數量
	          var quantity = $(".product-qty").val();
	
	          // 發送POST請求到後端Servlet
	          $.ajax({
	            type: "POST",
	            url: apiUrl, 
	            data: {
	              productId: productId, // 將商品ID和數量作為POST請求的數據傳遞
	              productQty: quantity,
	              memberId: memberId
	            },
	            success: function(response) {
	                Swal.fire({
	                    icon: 'success',
	                    title: '成功加入購物車!',
	                    text: '商品已經添加到購物車中。',
	                });
	            },
	            error: function(xhr, status, error) {
	              Swal.fire("加入購物車失敗!", "請稍後再試。", "error");
	            }
	          });
	        });
	      });
    </script>

</body>
</html>