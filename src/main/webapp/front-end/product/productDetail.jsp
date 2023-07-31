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
	href="${pageContext.request.contextPath}/front-end/product/css/product_rate.css"
	type="text/css">
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
					itemtype="https://schema.org/ListItem"><span itemprop="name">穎川堂手工巧克力
						婚禮小物</span></a>
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
						穎川堂手工巧克力 婚禮小物
					</h2>
				</div>
				<div>
					<a class="evaluate"
						href="#"> 
						<span class="bg_star"></span> 5.0&nbsp;
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
	<section id="studio_reviews_main" class="rwd_wrap group">
		<div class="title_studio_main">
			<h2>
				<a name="studio_reviews"></a> 評價
			</h2>
			<span class="title_count" id="evaluate_count_main" style=""> <b
				id="evaluate_count"><a
					href="https://www.marry.com.tw/studio-reviews-56748">39</a></b> 則
			</span><span class="d_line"></span>
		</div>
		<div id="evaluate_list_html">
			<div class="rate_box clearfix">
				<a name="reviews_1124724"></a>
				<div class="rate_basic clearfix">
					<div class="rate_pic">
						<img
							src="https://statics.marry.com.tw/img/public/MarryBar_default_avatar_20200827_4.jpg"
							class="review_profile_photo"
							data-real-src="https://statics.marry.com.tw/img/public/MarryBar_default_avatar_20200827_4.jpg">
					</div>
					<div class="rate_what">
						<div class="rate_who">
							<b>蔡宗烜</b>
						</div>
						<div class="evaluate">
							<span class=""></span><span class=""></span><span class=""></span><span
								class=""></span><span class=""></span>
						</div>
					</div>
				</div>
				<div class="rate_info">
					<div id="descri_evaluate_all_temp_1124724">
						<a
							href="https://www.marry.com.tw/studio-reviews_detail-kwmi56748mmri1124724mm.html"
							title="" style="color: #333; text-decoration: none;">首先，很謝謝店家願意花這時間、花這精神去設計我想要的糖果。這在我婚禮達到的效果爆炸好！店家每一隻手工的巧克力都非常巧手、美味（賓客的回饋），甚至是貨物的包裝上都能感受到店家用心！我也非常開心找到這間用...</a><a
							href="https://www.marry.com.tw/studio-reviews_detail-kwmi56748mmri1124724mm.html"><span>繼續閱讀</span></a>
					</div>
					<div class="descri_all" style="display: none"
						id="descri_evaluate_all_1124724">
						<a
							href="https://www.marry.com.tw/studio-reviews_detail-kwmi56748mmri1124724mm.html"
							title="" style="color: #333; text-decoration: none;">首先，很謝謝店家願意花這時間、花這精神去設計我想要的糖果。這在我婚禮達到的效果爆炸好！店家每一隻手工的巧克力都非常巧手、美味（賓客的回饋），甚至是貨物的包裝上都能感受到店家用心！我也非常開心找到這間用心的店家！</a>
					</div>
				</div>
			</div>
			<div class="rate_box clearfix">
				<a name="reviews_1121695"></a>
				<div class="rate_basic clearfix">
					<div class="rate_pic">
						<img
							src="https://statics.marry.com.tw/img/public/MarryBar_default_avatar_20200827_0.jpg"
							class="review_profile_photo"
							data-real-src="https://statics.marry.com.tw/img/public/MarryBar_default_avatar_20200827_0.jpg">
					</div>
					<div class="rate_what">
						<div class="rate_who">
							<b>Abby Yu</b>
						</div>
						<div class="evaluate">
							<span class=""></span><span class=""></span><span class=""></span><span
								class=""></span><span class=""></span>
						</div>
					</div>
				</div>
				<div class="rate_info">
					<div id="descri_evaluate_all_temp_1121695">
						<a
							href="https://www.marry.com.tw/studio-reviews_detail-kwmi56748mmri1121695mm.html"
							title="" style="color: #333; text-decoration: none;">去年結婚時就是訂購了穎川堂手工巧克力<br>
							有狗狗有貓貓<br> 每隻都好可愛<br> 老闆娘還很貼心的幫我準備了女生柴犬及男生柴犬<br>
							溝通過程也都很積極<br> 好後悔當時自己沒有留一些下來🥲<br> 超級推薦👍👍👍
						</a>
					</div>
					<div class="descri_all" style="display: none"
						id="descri_evaluate_all_1121695">
						<a
							href="https://www.marry.com.tw/studio-reviews_detail-kwmi56748mmri1121695mm.html"
							title="" style="color: #333; text-decoration: none;">去年結婚時就是訂購了穎川堂手工巧克力<br>
							有狗狗有貓貓<br> 每隻都好可愛<br> 老闆娘還很貼心的幫我準備了女生柴犬及男生柴犬<br>
							溝通過程也都很積極<br> 好後悔當時自己沒有留一些下來🥲<br> 超級推薦👍👍👍
						</a>
					</div>
				</div>
			</div>
			<div class="rate_box clearfix">
				<a name="reviews_1121301"></a>
				<div class="rate_basic clearfix">
					<div class="rate_pic">
						<img
							src="https://statics.marry.com.tw/img/public/MarryBar_default_avatar_20200827_1.jpg"
							class="review_profile_photo"
							data-real-src="https://statics.marry.com.tw/img/public/MarryBar_default_avatar_20200827_1.jpg">
					</div>
					<div class="rate_what">
						<div class="rate_who">
							<b>Yayin Chen</b>
						</div>
						<div class="evaluate">
							<span class=""></span><span class=""></span><span class=""></span><span
								class=""></span><span class=""></span>
						</div>
					</div>
				</div>
				<div class="rate_info">
					<div id="descri_evaluate_all_temp_1121301">
						<a
							href="https://www.marry.com.tw/studio-reviews_detail-kwmi56748mmri1121301mm.html"
							title="" style="color: #333; text-decoration: none;">超可愛的，結婚拿來發大家都搶著要<br>
							<br> 我自己只留下了幾隻做紀念，非常感謝
						</a>
					</div>
					<div class="descri_all" style="display: none"
						id="descri_evaluate_all_1121301">
						<a
							href="https://www.marry.com.tw/studio-reviews_detail-kwmi56748mmri1121301mm.html"
							title="" style="color: #333; text-decoration: none;">超可愛的，結婚拿來發大家都搶著要<br>
							<br> 我自己只留下了幾隻做紀念，非常感謝
						</a>
					</div>
				</div>
			</div>
			<br>
			<div class="load_more" id="load_more">
				<input type="hidden" id="now_evaluate_c" value="20"> <input
					type="hidden" id="now_page_c" value="2"><input
					type="hidden" id="evaluate_page_c" value="10"> <a
					id="evaluate_next" href="#" class="radius_2">載入更多(尚有19則評價)</a> <input
					type="hidden" id="m_id" value="56748">
			</div>
		</div>
	</section>






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
	// 使用Fetch API呼叫後端Servlet取得商品資料
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
            url: apiUrl, // 根據您的後端Servlet的路徑來設置
            data: {
              productId: productId, // 將商品ID和數量作為POST請求的數據傳遞
              productQty: quantity
            },
            success: function(response) {
            	 // 這裡可以處理加入購物車成功的提示，您可以使用Swal.fire或其他方法
                Swal.fire({
                    icon: 'success',
                    title: '成功加入購物車!',
                    text: '商品已經添加到購物車中。',
                }).then(function() {
                    // 成功提示後自動跳轉到購物車頁面
                    window.location.href = '/marryme/front-end/product/shoppingCart.jsp';
                });
            },
            error: function(xhr, status, error) {
              // 這裡可以處理加入購物車失敗的提示，您可以使用Swal.fire或其他方法
              Swal.fire("加入購物車失敗!", "請稍後再試。", "error");
            }
          });
        });
      });
    </script>

</body>
</html>