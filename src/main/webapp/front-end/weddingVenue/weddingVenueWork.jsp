<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	href="${pageContext.request.contextPath}/front-end/weddingVenue/css/weddingVenueWork.css" type="text/css" />
	
	
	<%@ page import="java.util.List" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	

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
					itemtype="https://schema.org/ListItem">
<!-- 					<span itemprop="name">婚宴場地</span> -->
					
				<a href="<%=request.getContextPath()%>/weddingVenueList">婚宴場地!!!!!!!!!</a>

					 
					 
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
					<li><a href="#" class="onit">方案</a></li>
					<li><a href="#" class="">店家</a></li>
				</ul>
			</div>
		</div>
	</div>

<!-- 	<div class="filter_pc on_pc"> 做服務or商品的才需要加，這段先保留畫面位置因為有JS功能+還有功能選項尚待確認 -->
	<div class="filter_pc on_pc">
		<section class="rwd_wrap group" style="height:50px;">
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
							方案 </a>
					</dt>
				</dl>				
			</div>
			
			<div id="service_filter_pr_html">
				<dl id="show_pr" class="show_filter">

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


	
	
<!-- 	==========================================店家========================================= -->



<section class="rwd_wrap profile_detail"  style="height:100px;">
        <div class="info"  >
<%-- <form method="post" action="<%=request.getContextPath()%>/weddingVenueWork">	 --%>
<input type="hidden" name="placeId" value=1/>
		
            <div class="avatar">
            	<a href="#" title="${weddingVenueWork.placeTitle}">
            		<img style="border-redius:50%;width:50px;height:50px;" alt="${weddingVenueWork.placeTitle}" title="${weddingVenueWork.placeTitle}" src="<%=request.getContextPath()%>/weddingVenue?id=${weddingVenueWork.placeId}">
                </a>
                <a class="flagship_tag" href="#" target="_blank">${weddingVenueWork.placeTitle}</a>
            </div>
            
            <div class="detail">
                <div>
                	<a class="evaluate" href="https://www.marry.com.tw/studio-reviews-16481">
	                	<span class="bg_star"></span> 4.9&nbsp;
	                        <span class="counts" id="evaluate_counts_basic">(861)
	                     </span>
                   </a>
                </div>
            </div>
        </div>
        
        <div class="toolbar"><a href="javascript:;" id="studio_like_a" onclick="set_like_big(this,'studio',4985);"
                class="follow btn_common btn_outline_primary " title="追蹤新莊典華"><img
                    src="https://statics.marry.com.tw/img/studio/follow_default.svg"><span>追蹤</span></a>
          
<%--             <a class="ask btn_common btn_primary add_ask" href="${pageContext.request.contextPath}/front-end/reservation/addReservation.jsp?vendorId=${vendorId}" rel_m_id="anZRNjk0Wk42LzI4THM0d2RR" --%>
<!--             <a class="ask btn_common btn_primary add_ask addPage" href="javascript:void(0);"  rel_m_id="anZRNjk0Wk42LzI4THM0d2RR" -->
<!--                 rel_s_id="0" rel_a_id="760"> -->
<!--                 預約賞廳                -->
<!--             </a> -->
<!-- </form>	  -->
        </div>
    </section>


	 <section class="section_main"
        style="background-image:url(<%=request.getContextPath()%>/weddingVenue?id=${weddingVenueWork.placeId})">
        <div class="rwd_wrap_new">
            <div class="cover">
                <img src="<%=request.getContextPath()%>/weddingVenue?id=${weddingVenueWork.placeId}"
                    alt="">
            </div>
            <div class="right_box">
                <p class="name">${weddingVenueWork.placeTitle}</p>
                <ul>
                    <li>
                        <p class="title">桌數</p>
                        <p class="text">${weddingVenueWork.numbeOfTables} <span>桌</span></p>
                    </li>
                    <li>
                        <p class="title">樓層</p>
                        <p class="text">1 <span>F</span></p>
                    </li>
                    <li>
                        <p class="title">樑柱</p>
                        <p class="text">無</p>
                    </li>
                </ul>
                <div class="btn_wrap">

                    <a class="ask btn_common btn_primary add_ask addPage" href="javascript:void(0);"  rel_m_id="anZRNjk0Wk42LzI4THM0d2RR"
		               id="addPage" name="action" value="getOne">
		                預約賞廳               
		            </a>
                </div>
            </div>
        </div>
    </section>
    
    <section class="section_detail rwd_wrap_new">
        <div class="line"></div>
        <h3>場地資訊</h3>
        <ul class="tag_row">
        </ul>
        <div class="text_wrap">
            <${weddingVenueWork.placeIntroduction}>
        </div>
        
<!-- =======================googlemap============================ -->

        
        <div class="application">
            <b>場地適用</b>
            <ul>
                <li class="unavailable">
                    <i></i>
                    宴客
                </li>
                <li class="unavailable">
                    <i></i>
                    證婚
                </li>
                <li class="unavailable">
                    <i></i>
                    文定/迎娶
                </li>
                <li class="unavailable">
                    <i></i>
                    After party
                </li>
                <li class="unavailable">
                    <i></i>
                    商務
                </li>
            </ul>
        </div>
            <div>  
		      ${googleMap};
		
		    </div>
        
        <div class="line"></div>
    </section>
    










<style>
        .more_photos .swiper-container {
            overflow: hidden !important;
        }

        .more_photos .swiper-wrapper {
            overflow: visible !important;
        }

        .more_photos .swiper-slide {
            width: auto !important;
        }
    </style>
    <section class="more_photos rwd_wrap_new more_photos_swiper_js">
        <p><b>照片集</b></p>
        <div class="slider_wrap">
            <div class="swiper-container swiper-container-initialized swiper-container-horizontal"
                style="cursor: grab;">
                <div id="service_swiper_list" class="swiper-wrapper" aria-live="polite"
                    style="transform: translate3d(0px, 0px, 0px);">
                    <div class="swiper-slide swiper-slide-visible swiper-slide-active" role="group" aria-label="1 / 16">
                        <a class="lightbox" onclick="return lightbox_click(this);"
                            href=""  alt="法蘿廳Floral">
                                               

    <img src="<%=request.getContextPath()%>/weddingVenuePicAll?id=${weddingVenueWork.placeId}&imageIndex=0">
    <img src="<%=request.getContextPath()%>/weddingVenuePicAll?id=${weddingVenueWork.placeId}&imageIndex=1">
    <img src="<%=request.getContextPath()%>/weddingVenuePicAll?id=${weddingVenueWork.placeId}&imageIndex=2">
    <img src="<%=request.getContextPath()%>/weddingVenuePicAll?id=${weddingVenueWork.placeId}&imageIndex=3">
    <img src="<%=request.getContextPath()%>/weddingVenuePicAll?id=${weddingVenueWork.placeId}&imageIndex=4">
     <!-- 圖片將動態添加到這裡 -->
                
                        </a>
                    </div>
                </div><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
            </div><a class="arrow_right arrow_right_js" href="javascript:;" tabindex="0" role="button"
                aria-label="Next slide" aria-controls="service_swiper_list" aria-disabled="false"></a>
        </div>
    </section>
    
    
    
<!--  ==========================================方案=================================================    -->
 <c:set var="vendorId" value="${weddingVenueWork.vendorId}" />
 <c:set var="placeId" value="${weddingVenueWork.placeId}" />
  
    <section class="more_photos rwd_wrap_new more_photos_swiper_js" >
        <p><b>方案</b></p>
                <div id="service_swiper_list" class="swiper-wrapper" aria-live="polite"
                    style="transform: translate3d(0px, 0px, 0px);">
                   
<%-- 	<form method="post" action="<%=request.getContextPath()%>/plan" style="margin-bottom: 0;"> --%>
         <input type="hidden" name="vendorId" value="${vendorId}" />
              
           <div class="tab-item-content"  >
                <div class="tab-content">
                    <c:forEach begin="0" end="1" varStatus="loop" >
                        <c:set var="activeClass" value="${loop.index == 1 ? 'active' : ''}" />
                        <div class="tab-pane fade-in ${activeClass}" id="tab-${loop.index}" role="tabpanel">
                            <table class="table" border-collapse: collapse; style="width: 100%;">
                                <thead class="thead">
                                <tr>
                                    <th style="width: 14.28%; height:100px;" scope="col">方案主圖片</th>
                                    <th style="width: 14.28%; height:100px;" scope="col">方案標題</th>
                                    <th style="width: 14.28%; height:100px;" scope="col">方案介紹</th>
                                    <th style="width: 14.28%; height:100px;" scope="col">圖片1</th>
                                    <th style="width: 14.28%; height:100px;" scope="col">圖片2</th>
                                    <th style="width: 14.28%; height:100px;" scope="col">圖片3</th>
                                    <th style="width: 14.28%; height:100px;" scope="col">簡介</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="plan" items="${planList}" begin="0" end="${planList.size()}">
                                    <c:if test="${plan.status == loop.index}">
                                        <tr>
                                            <td>
                                                <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPicture" class="rounded mx-auto d-block" alt="方案主圖片">
                                            </td>
                                            <td>${plan.planTitle}</td>
                                            <td>${plan.planIntroduction}</td>
                                            <td>
                                                <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures1" class="rounded mx-auto d-block" alt="方案圖片1">
                                            </td>
                                           
                                            <td>
                                                <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures2" class="rounded mx-auto d-block" alt="方案圖片2">
                                            </td>
                                            
                                            <td>
                                                <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures3" class="rounded mx-auto d-block" alt="方案圖片3">
                                            </td>
                                           

<!-- <td> -->
<%--     <form method="get" action="${pageContext.request.contextPath}/plan/plan-product?planProductId=${plan.planProductId}" style="margin-bottom: 0;"> --%>
<%--         <input type="hidden" name="planProductId" value="${plan.planProductId}" /> --%>
<%--         <input type="hidden" name="vendorId" value="${plan.vendorId}" /> --%>
<!--         <button type="submit" class="btn btn-info" >查看</button>                                                   -->
<!--     </form> -->
<!-- </td> -->

    <td>
                <form method="get" action="${pageContext.request.contextPath}/plan/plan-product" style="margin-bottom: 0;">
                    <input type="hidden" name="planProductId" value="${plan.planProductId}" />
                    <input type="hidden" name="vendorId" value="${plan.vendorId}" />
                    <button type="submit" class="btn btn-info" >查看</button>                                                  
                </form>
            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>
                </div>
           </div>
<!--         </form>                 -->
       </div>
</section>
    
<script>

 // 取得具有 "addPage" 類別的所有元素
  const buttons = document.querySelectorAll(".addPage");

 //迴圈設置每個按鈕的點擊事件處理函式
 buttons.forEach(button => {
    button.onclick = function (event) {
//      alert(${weddingVenueWork.placeId});
//     alert(${vendor.vendorId});
 	var memberId = "${member.memberId}";
 	var placeId = "${weddingVenueWork.placeId}";
//  	alert(memberId);
 	
 	// 阻止默認行為
     event.preventDefault();
    
     if (typeof memberId === 'undefined' || memberId == null || memberId == "") { 
    	
        window.location.href = "<%=request.getContextPath()%>/front-end/user/userLogin.jsp";
    } else {

		window.location.href = "<%=request.getContextPath()%>/addReservation?action=getOne&placeId=" + placeId;


     }
   }
 });
	

</script>


		
	<!-- body End -->


	
<!-- 	<!-- Footer Section Begin --> 
<%@include file="/front-end/footer.jsp"%>
<!-- Footer Section End --> 
                		

</body>
</html>