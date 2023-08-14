<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--<jsp:useBean id="planList" scope="request" class="com.marryme.plan.vo.Plan" />--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Merry Me</title>
    <link rel="icon" href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico" type="image/x-icon">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css" type="text/css" />
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
                <span itemprop="name">婚禮小物</span> <!--自己那頁的名稱-->
                <meta itemprop="position" content="2">
            </li>
        </ol>
    </div>
</div>
<div class="main_h1"> <!--做服務or商品的才需要加-->
    <div class="rwd_wrap group">
        <div class="clearfix">
            <ul class="clearfix">
                <li><a href="#" class="onit">商品</a></li>
                <li><a href="#" class="">店家</a></li>
            </ul>
        </div>
    </div>
</div>

<!-- <div class="filter_pc on_pc"> 做服務or商品的才需要加，這段先保留畫面位置因為有JS功能+還有功能選項尚待確認 -->
<div class="filter_pc on_pc">
    <section class="rwd_wrap group">
        <div id="service_filter_obt_html"></div>
        <div id="service_filter_ts_html"></div>
        <div id="service_filter_pr_html">
            <dl id="show_pr" class="show_filter">
                <dt><a href="javascript:;" onclick="check_open_filter('show_pr');">
                    預算
                </a>
                </dt>
                <dd id="show_pr_dd" style="display:none;">
                    <ul class="radius_3">
                        <label for="pr_">
                            <li class="onit filter_search_ref" onclick="filter_search_ref($(this).find('a'));"><a
                                    id="pr_" href="" rel_id="show_pr" rel_tit="預算" title="不拘">
                                不拘&nbsp;<span>0</span></a></li>
                        </label>
                    </ul>
                </dd>
            </dl>
        </div>
    </section>
</div>

<!--<div class="rwd_wrap group"> 這段做服務or商品才需要新增-->
<div class="rwd_wrap group">
    <div class="h1_count clearfix">
        <h1 class="channel_title">
            <strong id="channel_title">婚禮小物推薦商品</strong>
        </h1>
        <div class="count_line">
            <span class="count" id="service_count_main">共<b id="service_count">0</b>筆商品</span>
            <span class="line"></span>
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
            <select class="basic_input w_100" onchange="location.href=$(this).val();">
                <option value="#">推薦排序</option>
                <option value="#">最高人氣</option>
                <option value="#">最新上架</option>
            </select>
        </div>
    </div>
</div>
<!-- body End -->


<<<<<<< Updated upstream
<!-- Footer Section Begin -->
=======

<!-- ====================================婚宴場地======================================= -->
   
   
    <section class="rwd_wrap group">
        <div class="col lg_12 md_12 sm_12">
        
            <div class="index_title">
            	<a href="${pageContext.request.contextPath}/weddingVenueList">
                    <i class="title_sort icon_venue"></i>
                    <h2>婚宴場地</h2>
                </a>
                <p>共${totalVenues}家</p>
	                <span class="more_go">
		                <a href="${pageContext.request.contextPath}/weddingVenueList">看更多</a>
	                 </span>
            </div>
  
            <div class="shop_wall clearfix">
            
     <form method="post" action="<%=request.getContextPath()%>/index">
      <c:forEach var="weddingVenue" items="${weddingVenuesList}" begin="0" end="3">
                <ul class="shop_box" id="data-cltk-home_basic-9033"
                    data-cltk="aWZWaDh0SWV1YXpzSXMweVB6ZmtqMnJQaE5PMHhwMFFNS0FpOGNMdzQ3SzhNbmg1bWkwSDhLTGFndWV6bnd1YnNNbUFCRWJReEc1TFFnSkdENWtGY1pkOElIeXJ6VFg1UFI5YVNJUG45WnlXOFlEVUpnVkgyanFYTjFITXVNMk83RUxXTENSTnc5N2N1SllCVFExM1o2RVRmUEpoUDcwc2d5MnE4MmkwS0hRSDl5ekdEdWFuQUdXekVvbDFTR1plaktxTTNuRmhuMjErbzlCZ0lKSGNFWUR0ZDc1aXQyV1REOU05RUFKRjdTME1xTEp5amhoRUNxSzhaeEFpN3c=">
                    <li class="shop_pic">
                        <a class="shop_pic_a cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                            href="<%=request.getContextPath()%>/weddingVenueWork?id=${weddingVenue.placeId}" title="">

                            <picture>
                                    <img class="lazy shop_pic_img" title="${weddingVenue.placeTitle}"
                                    alt="${weddingVenue.placeTitle}"
                                    data-src="<%=request.getContextPath()%>/weddingVenue?id=${weddingVenue.placeId}">
                            </picture>
                        </a>
<!--  小圖                       <a class="shop_profPic shop_profPic_four cltk_click" data-cltk-id="data-cltk-home_basic-9033" href="#" title=""> -->
<%-- 	                         <img class="lazy" title="${weddingVenue.placeTitle}" alt="${weddingVenue.placeTitle}" --%>
<%-- 	                                data-src="<%=request.getContextPath()%>/weddingVenue?id=${weddingVenue.placeId}"> --%>
<!--                         </a> -->
                    </li>
                    <li class="shop_info">
                        <h3>
                        	<a class="shop_name cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                                href="#" title="${weddingVenue.placeTitle}">${weddingVenue.placeTitle}
                            </a>
                        </h3>
                        <div class="shop_title">
                        	<a class="evaluate cltk_click" data-cltk-id="data-cltk-home_basic-9033" href="#">
                                <img src="https://statics.marry.com.tw/img/public/selected.svg" alt="${weddingVenue.placeTitle}" title="${weddingVenue.placeTitle}">5.0&nbsp;
                                <span class="evaluate_counts">(190)</span>
                            </a>
                                <span class="shop_work_wrap">
                                <a class="shop_work cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                                    href="#">廳房&nbsp;${weddingVenue.numbeOfTables}</a>
                                <a class="shop_work cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                                    href="#">方案&nbsp;${totalPlans}</a>
<!--                                 <a class="shop_work cltk_click" data-cltk-id="data-cltk-home_basic-9033" -->
<!--                                     href="#">影片&nbsp;7</a> -->
                                </span>
                        </div>
                        <ul class="tag_row">
                            <li class="general">安心防疫</li>
                        </ul>
                        
                         <c:forEach var="location" items="${location}">
						    <div class="shop_add">
						        <img src="https://statics.marry.com.tw/img/public/vendorprofile/location_gray_20.svg">
						        <span>${location}</span>
						    </div>
						</c:forEach>
                    </li>                    
                </ul>               
         </c:forEach>
      </form>
            </div>
        </div>
    </section>




    <section class="rwd_wrap group">


<!-- ====================================方案================================================ -->
        <div class="lg_12 md_12 sm_12 clearfix">
            <div class="index_title"><a href="https://www.marry.com.tw/prewedding-photos?a_id=811">
                    <i class="title_sort icon_prewedding"></i>
                    <h2>方案</h2>
                </a>
                <p>共${totalPlanAlls}作品集</p><span class="more_go"><a
                        href="https://www.marry.com.tw/prewedding-photos?a_id=817">看更多<img class="arrow_more"
                            src="https://statics.marry.com.tw/img/public/arrow_more.svg" alt="看更多"></a></span>
            </div>
            
            
    <form method="get" action="<%=request.getContextPath()%>/plan/plan-product">
            <div class="photos_wall clearfix">
      <c:forEach var="plan" items="${planList}" begin="0" end="${planList.size()}">
                <ul class="album_box radius_2" id="data-cltk-home_works-21365"
                    data-cltk="aUtNOG9kQkR0cW5zSXMweVB6ZmtqMnJQaE5PMHhwMFFNS0FpOHNMdzQ3SzhNbmg1bWkwSDhLYkJoZWlwMGhMVCtjU05IQTNOMVdaNWRBOEFGc3RNZVpCMU5IaWtpRDc1TVI4UlZNcTJ1OWVKOE5HR0lWWWNqanJFS3dhZG9OU1Z1UmlKTEd4Umk1MjU4NEZNQkJBU1AvNUNmYWhoTFBVdDBUeXJvaUgzZFd3ZTcyR2VTZTNvQm5DdVVvZ29GR2xIbktIUDBDZzJuejE2L1pkNE9ZbVJSY250YnZZcnZXZUxENWd2VFY4TXBpY0k3ZXhvM1ZRYVZR"
                    itemscope="" itemtype="https://schema.org/ImageObject">
                    <li class="photos_pic">
<%--                        <a class="cltk_click" data-cltk-id="data-cltk-home_works-21365"--%>
<%--                            href="#"--%>
<%--                            title="${plan.planTitle}">--%>
                        <a class="shop_pic_a cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                           href="<%=request.getContextPath()%>/plan/plan-product?planProductId=${plan.planProductId}" title="">
                            <picture>
                                <img class="lazy shop_pic_img" title="${plan.planTitle}" alt="${plan.planTitle}"
                                     width="80%" data-src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPicture">
                            </picture>
                        </a>
                    <span class="photos_counts"></span></li>
                    <li class="photos_name">
                        <h3 class="boxsize nobr"><a class="cltk_click" data-cltk-id="data-cltk-home_works-21365"
                                href="#"
                                title="${plan.planTitle}"><span itemprop="name">
                                    ${plan.planTitle}</span></a></h3>
                    </li>
                    <li class="photos_studio nobr boxsize">
	                    <a class="cltk_click" data-cltk-id="data-cltk-home_works-21365" href="#" itemprop="author">
	                            
	                            <span>27,940 人氣</span>
	                     </a>
                     </li>
                </ul>
          </c:forEach>
            </div>            
         </form>
       </div>




<!-- =============================婚禮週邊======================================== -->

<section class="rwd_wrap group">
        <div class="col lg_12 md_12 sm_12">
        

        
        
            <div class="index_title">
             		<a href="${pageContext.request.contextPath}/front-end/product/product.jsp?productCategoryId=1">
                    <i class="title_sort icon_venue"></i>
                    <h2>婚禮週邊</h2>
                    </a>
                <p>共${totalProductAlls}件商品</p>
	                <span class="more_go">
		                <a href="${pageContext.request.contextPath}/front-end/product/product.jsp?productCategoryId=1">看更多</a>
	                 </span>
            </div>
  
            <div class="shop_wall clearfix">
            
     <form method="post" action="<%=request.getContextPath()%>/index">
      <c:forEach var="product" items="${productAllList}" begin="0" end="8">
                <ul class="shop_box" id="data-cltk-home_basic-9033"
                    data-cltk="aWZWaDh0SWV1YXpzSXMweVB6ZmtqMnJQaE5PMHhwMFFNS0FpOGNMdzQ3SzhNbmg1bWkwSDhLTGFndWV6bnd1YnNNbUFCRWJReEc1TFFnSkdENWtGY1pkOElIeXJ6VFg1UFI5YVNJUG45WnlXOFlEVUpnVkgyanFYTjFITXVNMk83RUxXTENSTnc5N2N1SllCVFExM1o2RVRmUEpoUDcwc2d5MnE4MmkwS0hRSDl5ekdEdWFuQUdXekVvbDFTR1plaktxTTNuRmhuMjErbzlCZ0lKSGNFWUR0ZDc1aXQyV1REOU05RUFKRjdTME1xTEp5amhoRUNxSzhaeEFpN3c=">
                    <li class="shop_pic">
                        <a class="shop_pic_a cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                            href="<%=request.getContextPath()%>/product/getOne?productId=${product.productId}" title="">
 
                            <picture>
                                    <img class="lazy shop_pic_img" title="${product.productName}"
                                    alt="${product.productName}"
                                    data-src="<%=request.getContextPath()%>/weddingProduct?id=${product.productId}">
                            </picture>
                        </a>
<!-- 小圖                        <a class="shop_profPic shop_profPic_four cltk_click" data-cltk-id="data-cltk-home_basic-9033" href="#" title=""> -->
<%-- 	                         <img class="lazy" title="${product.productName}" alt="${product.productName}" --%>
<%-- 	                                data-src="<%=request.getContextPath()%>/weddingProduct?id=${product.productId}"> --%>
<!--                         </a> -->
                    </li>
                    <li class="shop_info">
                        <h3><a class="shop_name cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                                href="#" title="${product.productName}">${product.productName}
                            </a>
                        </h3>
                        <div class="shop_title">
                        	<a class="evaluate cltk_click" data-cltk-id="data-cltk-home_basic-9033" href="#">
                                <img src="https://statics.marry.com.tw/img/public/selected.svg" alt="${product.productName}" title="${product.productName}">5.0&nbsp;
                                <span class="evaluate_counts">(190)</span>
                            </a>
                                <span class="shop_work_wrap">
                                <a class="shop_work cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                                    href="#">原價&nbsp;${product.originalPrice}</a>
                                <a class="shop_work cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                                    href="#">折扣金額&nbsp;${product.platformPrice}</a>
                                </span>
                        </div>
                        <ul class="tag_row">
                            <li class="general">絕不買貴</li>
                        </ul>
                        

                    </li>                    
                </ul>               
         </c:forEach>
      </form>
            </div>
        </div>
    </section>




    <section class="rwd_wrap group">












<!-- ===============================婚禮籌備必讀攻略========================================= -->
<!--     <section class="rwd_wrap group"> -->
<!--         <div class="index_title"><a href="https://www.marry.com.tw/topic?a_id=816"> -->
<!--                 <i class="title_sort icon_no"></i> -->
<!--                 <h2>婚禮籌備必讀攻略</h2> -->
<!--             </a> -->
<!--             <p>共2,600篇</p><span class="more_go"><a href="https://www.marry.com.tw/topic?a_id=822">看更多<img -->
<!--                         class="arrow_more" src="https://statics.marry.com.tw/img/public/arrow_more.svg" -->
<!--                         alt="看更多"></a></span> -->
<!--         </div> -->
<!--         <div class="lg_12 topic_wall"> -->
<!--             <ul class="topic_list clearfix" id="data-cltk-home_topic-4061" -->
<!--                 data-cltk="amZGaDk0WWQ3UGZzSXMweVB6ZmtqMnJQaE5PMHhwMFFNS0FpOHNMdzQ3SzhNbmg1bWkwSDhLWEJoK3E1MGhMVCtjU05IQTNOMVdaNWRBOEFGc3RNZjVGd00zYnN3VHo3S1UwT1NOQ3JwdEdJdk1qT2FGZ1NsbkRES1E3YXVaemN0QldSZlhCTWpiYVAvc2RWVmtNWk5iWUxkS0Y1ZmZRM215WGo2eXIwZW5SWDgzK0ZDckhvQkhEckRkVTZIbmNRaXFDZWdXdG96blEyNnQ1cU9OaUpUb0QxZFBkNjl6N1dTSnNuVUY5ZDlEUlg5K3g4"> -->
<!--                 <li class="l_img"><a class="cltk_click" data-cltk-id="data-cltk-home_topic-4061" -->
<!--                         href="https://www.marry.com.tw/topic/4061" title="結婚不挑好日子竟有 6 大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！"><img -->
<!--                             class="lazy" -->
<!--                             data-src="https://data.marry.com.tw/img/2023/04/20/168198088273444400_w_mid_450x338.jpg" -->
<!--                             title="結婚不挑好日子竟有 6 大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！" -->
<!--                             alt="結婚不挑好日子竟有 6 大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！"></a></li> -->
<!--                 <li class="r_info"> -->
<!--                     <dl> -->
<!--                         <dt> -->
<!--                             <h3><a class="cltk_click" data-cltk-id="data-cltk-home_topic-4061" -->
<!--                                     href="https://www.marry.com.tw/topic/4061" -->
<!--                                     title="結婚不挑好日子竟有 6 大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！">結婚不挑好日子竟有 6 -->
<!--                                     大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！</a></h3> -->
<!--                         </dt> -->
<!--                         <dd class="d_count" style="text-align:left;"> -->
<!--                             <div data-href="https://www.marry.com.tw/topic/4061" data-send="false" -->
<!--                                 data-layout="button_count" data-width="80" data-show-faces="false"></div> -->
<!--                             人氣：<em>5223</em> <span>│</span> -->
<!--                             分享：<em>2</em> -->
<!--                         </dd> -->
<!--                     </dl> -->
<!--                 </li> -->
<!--             </ul> -->
			
<!-- 	=========================大圖輪播橫桿============================= -->
			 <div id="msg_descri_{targetid}" class="send_btn msg_descri" is_focus="0" style="cursor:text;"
                contenteditable="true" placeholder="輪入訊息 (Shift + Enter 換行)" name="descri_div"
                onclick='ask_msg_list("#ask_msg_var_{targetid}");'>
            </div>
			
			
<!--         </div> -->
<!--     </section> -->
            
            

                


	<!-- body End -->


  <script type="text/javascript" src="${pageContext.request.contextPath}/front-end/weddingVenue/js/index.js"></script>
    <script>
        $(function () {
            if ($("#open_fb_fun").val() == '1') {
                setTimeout(function () {
                    (function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/zh_TW/all.js#xfbml=1&appId=1802784896617361";
                        fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));
                }, 500);
            }
        });</script>



    <input type="hidden" name="image_loading" value="" />
                		



	
<!-- 	<!-- Footer Section Begin --> 
>>>>>>> Stashed changes
<%@include file="/front-end/footer.jsp"%>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.bundle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/marryme.js"></script>

<script>

</script>


</body>
</html>