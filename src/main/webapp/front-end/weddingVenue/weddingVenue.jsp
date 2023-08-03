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
<title>Merry Me</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico"
	type="image/x-icon">


	
		
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>
<%@include file="/front-end/header.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front-end/weddingVenue/css/weddingVenue.css" type="text/css" />

<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




</head>

<body>

	
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
						itemtype="https://schema.org/ListItem"><span itemprop="name">婚宴場地</span>
						<!--自己那頁的名稱-->
						<meta itemprop="position" content="2"></li>
				</ol>
			</div>
		</div>
		<div class="main_h1">
			<!--做服務or商品的才需要加-->
			<div class="rwd_wrap group">
				<div class="clearfix">
					<ul class="clearfix">
						<li><a href="#" class="">方案</a></li>
						<li><a href="#" class="onit">店家</a></li>
					</ul>
				</div>
			</div>
		</div>
	
	<!-- 	<div class="filter_pc on_pc"> 做服務or商品的才需要加，這段先保留畫面位置因為有JS功能+還有功能選項尚待確認 -->
		<div class="filter_pc on_pc">
			<section class="rwd_wrap group">
				<div id="service_filter_obt_html">
					<dl id="show_pr" class="show_filter">
						<dt>
							<a href="javascript:;" onclick="check_open_filter('show_pr');">
								店家區域 </a>
						</dt>
						<dd id="show_pr_dd" style="display: none;">
							<ul class="radius_3">
								<label for="pr_">
									<li class="onit filter_search_ref"
									onclick="filter_search_ref($(this).find('a'));"><a id="pr_"
										href="" rel_id="show_pr" rel_tit="預算" title="不拘"> 不拘&nbsp;<span>0</span></a></li>
								</label>
							</ul>
							<ul class="radius_3">
								<label for="pr_">
									<li class="onit filter_search_ref"
									onclick="filter_search_ref($(this).find('a'));"><a id="pr_"
										href="" rel_id="show_pr" rel_tit="預算" title="不拘"> 不拘&nbsp;<span>0</span></a></li>
								</label>
							</ul>
						</dd>
					</dl>
				</div>
							
				<div id="service_filter_ts_html">
					<dl id="show_pr" class="show_filter">
						<dt>
							<a href="javascript:;" onclick="check_open_filter('show_pr');">
								桌數區間 </a>
						</dt>
					</dl>				
				</div>
				
				<div id="service_filter_pr_html">
					<dl id="show_pr" class="show_filter">
						<dt>
							<a href="javascript:;" onclick="check_open_filter('show_pr');">
								預算 </a>
						</dt>
						<dd id="show_pr_dd" style="display: none;">
							<ul class="radius_3">
								<label for="pr_">
									<li class="onit filter_search_ref"
									onclick="filter_search_ref($(this).find('a'));"><a id="pr_"
										href="" rel_id="show_pr" rel_tit="預算" title="不拘"> 不拘&nbsp;<span>0</span></a></li>
								</label>
							</ul>
						</dd>
					</dl>
				</div>
			</section>
		</div>
	
<table id="example" class="display" style="width: 100%">
	
		<!--<div class="rwd_wrap group"> 這段做服務or商品才需要新增-->
		<div class="rwd_wrap group">
			<div class="h1_count clearfix">
				<h1 class="channel_title">
					<strong id="channel_title">婚宴場地推薦店家</strong>
				</h1>
				<div class="count_line">
					<span class="count" id="service_count_main">共<b
						id="service_count">0</b>筆商品
					</span> <span class="line"></span>
				</div>
	
				<div class="list_by_select">
					<select class="basic_input w_100"
						onchange="location.href=$(this).val();">
						<option value="#">推薦排序</option>
						<option value="#">最高人氣</option>
						<option value="#">最新上架</option>
					</select>
				</div>
			</div>
		</div>

<!-- 	==========================================店家========================================= -->
<%
   List<?> weddingVenuesList = (List<?>) request.getAttribute("weddingVenuesList");
   
   int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
   int productsPerPage = 6;
   int startIndex = (currentPage - 1) * productsPerPage;
   int endIndex = Math.min(startIndex + productsPerPage, weddingVenuesList.size()) -1;
   
   int totalPages = (int) Math.ceil((double) weddingVenuesList.size() / productsPerPage);
   
   //確保endIndex至少為0
   endIndex = Math.max(0, endIndex);
%>



	<section class="rwd_wrap group"  >
        <div class="col lg_12 md_12 sm_12" id="basic_list">
            <div class="shop_box_list">              

<form method="post" action="<%=request.getContextPath()%>/weddingVenueList">	
<%--    <c:forEach var="weddingVenue" items="${weddingVenuesList}" begin="0" end="${weddingVenuesList.size()}">                  --%>
<c:forEach var="weddingVenue" items="${weddingVenuesList}" begin="<%= startIndex %>" end="<%= endIndex %>">

	
                  <ul class="shop_box" id="data-cltk-id_6167">
                    <li class="shop_pic">
                        <a class="shop_pic_a cltk_click" data-cltk-id="data-cltk-id_6167" 
                        	href="<%=request.getContextPath()%>/weddingVenueWork?id=${weddingVenue.placeId}" 
                         	onclick="goToPage(${weddingVenue.placeId});">
                                    <img class="shop_pic_img" title="孫立人將軍官邸 - 官邸文囍" alt="貓貓官邸"
                                    src="<%=request.getContextPath()%>/weddingVenue?id=${weddingVenue.placeId}">
                        </a>
                    </li>
                    <li class="shop_info">
                        <h2>
                        <a class="shop_name cltk_click" data-cltk-id="data-cltk-id_6167" href="#"
                                title="${weddingVenue.placeTitle}">${weddingVenue.placeTitle}</a>
                        </h2>
                        <div class="shop_title">
                        	<a class="evaluate cltk_click" data-cltk-id="data-cltk-id_6167" href="#">
                        		<img src="https://statics.marry.com.tw/img/public/selected.svg"> 5.0&nbsp;
<!--                         			<span class="evaluate_counts">(3)</span> -->
                        	</a>
                        	<span class="shop_work_wrap">
                            	<a class="shop_work cltk_click" data-cltk-id="data-cltk-id_6167" href="#">廳房 ${weddingVenue.numbeOfTables}</a>
                            	<a class="shop_work cltk_click" data-cltk-id="data-cltk-id_6167" href="#">方案&nbsp;4</a>

<%--                             	<a class="shop_work cltk_click" data-cltk-id="data-cltk-id_6167" data-size="${weddingPlanList.size()}" href="#">方案&nbsp;</a> --%>
                            	
                            	
                            </span>
                        </div>
                        <ul class="tag_row">
                        </ul>
                        <div class="shop_add">
                            <img src="https://statics.marry.com.tw/img/public/vendorprofile/location_gray_20.svg">


							<span>
                                台北市&nbsp;中正區
                            </span>

                        </div>
	                    </li>
	                </ul>
   </c:forEach>
</form>	           
	   		 </div>
	    </div>
	</section>


<div id="pages">
    <ul class="pagination">
        <%-- 這裡是頁碼列表，使用<c:forEach>來生成頁碼 --%>
        <c:forEach var="pageNum" begin="1" end="<%= totalPages %>" >
            <li>
                <a href="javascript:void(0);" onclick="goToPage(${pageNum})" <%-- 調用JavaScript函數並將頁碼傳遞給goToPage() --%>
                    <%-- 這裡使用三元運算符來判斷是否為當前頁，如果是當前頁添加active樣式 --%>
                    class="${pageNum == currentPage ? 'active' : ''}">
                    ${pageNum}
                </a>
            </li>
        </c:forEach>
        <%-- 下一頁按鈕 --%>
        <li>
            <a href="javascript:void(0);" onclick="goToPage(<%= currentPage + 1 %>)">&gt; 下一頁
            </a>

        </li>
        <%-- 顯示當前頁數 --%>
        <li>
            <span>第<b id="now_page_pic"><%= currentPage %></b>/<%= totalPages %>頁</span>
        </li>
    </ul>
</div>




	


<script>

function goToPage(page) {
	  if (page > <%= totalPages %>) {
	    // 如果指定的頁碼大於總頁數，直接跳轉到最後一頁
	    window.location.href = '<%= request.getContextPath() %>/weddingVenueList?page=' + <%= totalPages %>;
	  } else {
	    // 否則跳轉到指定的頁碼
	    window.location.href = '<%= request.getContextPath() %>/weddingVenueList?page=' + page;
	  }
	}



var currentPage = <%= totalPages %>;
console.log(currentPage)


</script>

	
	<!-- body End -->


	
<!-- 	<!-- Footer Section Begin --> 
	<%@include file="/front-end/footer.jsp"%>
<!-- 	<!-- Footer Section End --> 
	


</body>
</html>