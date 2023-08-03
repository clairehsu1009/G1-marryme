<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="products" scope="request"
	class="java.util.ArrayList" />
	
<%
String productCategoryId = request.getParameter("productCategoryId");
%>


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
					itemtype="https://schema.org/ListItem"><span itemprop="name">婚禮小物</span>
					<!--自己那頁的名稱-->
					<meta itemprop="position" content="2"></li>
			</ol>
		</div>
	</div>



	<!--<div class="rwd_wrap group"> 這段做服務or商品才需要新增-->
	<div class="rwd_wrap group">
		<div class="h1_count clearfix">
			<h1 class="channel_title">
				<strong id="channel_title">婚禮小物推薦商品</strong>
			</h1>
			<div class="count_line">
				<span class="count" id="service_count_main">共<b
					id="service_count">0</b>筆商品
				</span> <span class="line"></span>
			</div>
			<!-- 下面這段註解掉的是for RWD切版的會顯示不同的部分，因為我們沒有不買貴所以刪掉會容易跑版，之後要再討論是否就直接刪除或是要修改 -->
			<!-- <div class="feature_filter_rwd" id="feature_filter_rwd">
            <div class="checkbox_wrapper">
                <div class="checkbox_option checkbox_option_minimum">
                    <input type="checkbox"
                        href="https://www.marry.com.tw/favors-kwbt2018mmim1mmir0mmkwir0mm"
                        onclick="filter_search_ref($(this));" id="filter_minimum_input_rwd">
                    <label for="filter_minimum_input_rwd">不買貴保證</label>
                </div>
            </div>
            <div id="open_where_search" class="service_filter on_mobile"><a href="javascript:;"
                    onclick="where_search_main_open();">進階篩選</a></div>
        </div>
        <p class="feature_qa_rwd" id="feature_qa_rwd">什麼是
            <a href="javascript:;" class="feature_qa_js" data-type="minimum">不買貴</a>
        </p> -->
			<div class="list_by_select">
				<select class="basic_input w_100"
					onchange="location.href=$(this).val();">
					<option value="#">推薦排序</option>
					<option value="#">最高人氣</option>
					<option value="#">最新上架</option>
				</select>
			</div>
		</div>
		<section class="rwd_wrap group">
			<div class="good_wall" id="service_list"></div>
			<div id="pages">
				<ul class="pagination"></ul>
			</div>
			<input type="hidden" id="pagesize" value="50"> <input
				type="hidden" id="now_link" href="#">
		</section>
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
		src="${pageContext.request.contextPath}/front-end/product/js/product.js"></script>


	

</body>
</html>