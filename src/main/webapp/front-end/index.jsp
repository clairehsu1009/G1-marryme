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
	href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico" type="image/x-icon">


	
		
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>
<%@include file="/front-end/header.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/front-end/weddingVenue/css/index.css" type="text/css" />
	



	

	

</head>

<body>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>



 
<div class="carousel-container">

</div>
					


<div class="swiper-container">
        <div class="swiper-wrapper slider_content" id="center">
            <div class="swiper-slide banner">
                <div class="img">
                    <a href="https://marry.com.tw/13666" target="_blank" title="結婚吧挺新人，找命定商家">
                        <picture>
                            <source srcset="https://data.marry.com.tw/img/2023/05/26/168506239196378300.webp"
                                media="(min-width: 1025px)" type="image/webp">
                            <source srcset="https://data.marry.com.tw/img/2023/05/26/168508424559025900.webp"
                                type="image/webp">
                            <source srcset="https://data.marry.com.tw/img/2023/05/26/168506239197072100.png"
                                media="(min-width: 1025px)" type="image/jpeg">
                            <source srcset="https://data.marry.com.tw/img/2023/05/26/168506239197072100.png"
                                type="image/jpeg"><img
                                src="https://data.marry.com.tw/img/2023/05/26/168506239197072100.png" alt="結婚吧挺新人，找命定商家"
                                title="結婚吧挺新人，找命定商家">
                        </picture>
                    </a>
                </div>
            </div>
            <div class="swiper-slide banner">
                <div class="img"><a href="https://marry.com.tw/10281" target="_blank" title="">
                        <picture>
                            <source srcset="https://data.marry.com.tw/img/2021/12/09/163903368895706400.webp"
                                media="(min-width: 1025px)" type="image/webp">
                            <source srcset="https://data.marry.com.tw/img/2021/12/09/163903368895581400.webp"
                                type="image/webp">
                            <source srcset="https://data.marry.com.tw/img/2021/12/09/163903368899004700.jpeg"
                                media="(min-width: 1025px)" type="image/jpeg">
                            <source srcset="https://data.marry.com.tw/img/2021/12/09/163903368899120100.jpeg"
                                type="image/jpeg"><img
                                src="https://data.marry.com.tw/img/2021/12/09/163903368899004700.jpeg" alt="" title="">
                        </picture>
                    </a></div>
            </div>
        </div>
        <div class="swiper-pagination"></div>
    </div>



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
                <ul class="shop_box" id="data-cltk-home_basic-9033" "
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
                        <a class="shop_profPic shop_profPic_four cltk_click" data-cltk-id="data-cltk-home_basic-9033" href="#" title="">
	                         <img class="lazy" title="${weddingVenue.placeTitle}" alt="${weddingVenue.placeTitle}"
	                                data-src="<%=request.getContextPath()%>/weddingVenue?id=${weddingVenue.placeId}">
                        </a>
                    </li>
                    <li class="shop_info">
                        <h3><a class="shop_name cltk_click" data-cltk-id="data-cltk-home_basic-9033"
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
            
            
    <form method="post" action="<%=request.getContextPath()%>/index">
            <div class="photos_wall clearfix">
      <c:forEach var="plan" items="${planAllList}" begin="0" end="2">
                <ul class="album_box radius_2" id="data-cltk-home_works-21365"
                    data-cltk="aUtNOG9kQkR0cW5zSXMweVB6ZmtqMnJQaE5PMHhwMFFNS0FpOHNMdzQ3SzhNbmg1bWkwSDhLYkJoZWlwMGhMVCtjU05IQTNOMVdaNWRBOEFGc3RNZVpCMU5IaWtpRDc1TVI4UlZNcTJ1OWVKOE5HR0lWWWNqanJFS3dhZG9OU1Z1UmlKTEd4Umk1MjU4NEZNQkJBU1AvNUNmYWhoTFBVdDBUeXJvaUgzZFd3ZTcyR2VTZTNvQm5DdVVvZ29GR2xIbktIUDBDZzJuejE2L1pkNE9ZbVJSY250YnZZcnZXZUxENWd2VFY4TXBpY0k3ZXhvM1ZRYVZR"
                    itemscope="" itemtype="https://schema.org/ImageObject">
                    <li class="photos_pic"><a class="cltk_click" data-cltk-id="data-cltk-home_works-21365"
                            href="#"
                            title="${plan.planTitle}">
                            <picture>
                                <source
                                    data-srcset="<%=request.getContextPath()%>/weddingPlan?id=${plan.planProductId}"
                                    type="image/webp">
                                <source
                                    data-srcset="<%=request.getContextPath()%>/weddingPlan?id=${plan.planProductId}"
                                    type="image/jpg"><img class="lazy" itemprop="contentUrl" 
                                    title="${plan.planTitle}" alt="${plan.planTitle}"
                                    data-src="<%=request.getContextPath()%>/weddingPlan?id=${plan.planProductId}">
                            </picture>
                        </a><span class="photos_counts"></span></li>
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
                    <i class="title_sort icon_venue"></i>
                    <h2>婚禮週邊</h2>
                <p>共${totalProductAlls}件商品</p>
	                <span class="more_go">
		                <a href="#">看更多</a>
	                 </span>
            </div>
  
            <div class="shop_wall clearfix">
            
     <form method="post" action="<%=request.getContextPath()%>/index">
      <c:forEach var="product" items="${productAllList}" begin="0" end="8">
                <ul class="shop_box" id="data-cltk-home_basic-9033" "
                    data-cltk="aWZWaDh0SWV1YXpzSXMweVB6ZmtqMnJQaE5PMHhwMFFNS0FpOGNMdzQ3SzhNbmg1bWkwSDhLTGFndWV6bnd1YnNNbUFCRWJReEc1TFFnSkdENWtGY1pkOElIeXJ6VFg1UFI5YVNJUG45WnlXOFlEVUpnVkgyanFYTjFITXVNMk83RUxXTENSTnc5N2N1SllCVFExM1o2RVRmUEpoUDcwc2d5MnE4MmkwS0hRSDl5ekdEdWFuQUdXekVvbDFTR1plaktxTTNuRmhuMjErbzlCZ0lKSGNFWUR0ZDc1aXQyV1REOU05RUFKRjdTME1xTEp5amhoRUNxSzhaeEFpN3c=">
                    <li class="shop_pic">
                        <a class="shop_pic_a cltk_click" data-cltk-id="data-cltk-home_basic-9033"
                            href="<%=request.getContextPath()%>/weddingProduct?id=${product.productId}" title="">
 
                            <picture>
                                    <img class="lazy shop_pic_img" title="${product.productName}"
                                    alt="${product.productName}"
                                    data-src="<%=request.getContextPath()%>/weddingProduct?id=${product.productId}">
                            </picture>
                        </a>
                        <a class="shop_profPic shop_profPic_four cltk_click" data-cltk-id="data-cltk-home_basic-9033" href="#" title="">
	                         <img class="lazy" title="${product.productName}" alt="${product.productName}"
	                                data-src="<%=request.getContextPath()%>/weddingProduct?id=${product.productId}">
                        </a>
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










<!-- =============================婚禮週邊======================================== -->
<!--         <div class="lg_12 md_12 sm_12 clearfix"> -->
<!--             <div class="index_title"><a href="https://www.marry.com.tw/record-photos?a_id=812"> -->
<!--                     <i class="title_sort icon_record"></i> -->
<!--                     <h2>婚禮週邊</h2> -->
<!--                 </a> -->
<!--                 <p>共17,466商品</p><span class="more_go"><a -->
<!--                         href="#">看更多<img class="arrow_more" -->
<!--                             src="https://statics.marry.com.tw/img/public/arrow_more.svg" alt="看更多"></a></span> -->
<!--             </div> -->
<!--             <div class="photos_wall clearfix"> -->
<!--                 <ul class="album_box radius_2" id="data-cltk-home_works-123082" -->
<!--                     data-cltk="M1BKc29OUWQ2cTNzSXMweVB6ZmtqMnJQaE5PMHhwMFFNS0FpOHNMdzQ3SzhNbmg1bWkwSDhLYkJoZWlwMGhMVCtjU05IQTNOMVdaNWRBOEFGc3RNZXBOMU1uV3R3SGY3TXdkRFM5YXNwc3FQOFoyZmFSOFNnQ0tPTEFTVjU4M2Q4QldFTkQxTmxwdVN4WXdLSFVKQk5QUUtOS0ZvTktRc3kzYXk2bWo4Y1dNR3BuMkFVcTYwQm4rNEZJb29GVFpIMDdpSG1TWTRoM1JtN29BcElNSFlUOFAxYnU5ajlHV0pGOG8rUzEwYXZEUVhxdlU2amxnWEUrUQ==" -->
<!--                     itemscope="" itemtype="https://schema.org/ImageObject"> -->
<!--                     <li class="photos_pic"><a class="cltk_click" data-cltk-id="data-cltk-home_works-123082" -->
<!--                             href="https://www.marry.com.tw/studio-works-kwmi4109mmwi123082mm.html#works_index" -->
<!--                             title="【婚禮。精選】"> -->
<!--                             <picture> -->
<!--                                 <source -->
<!--                                     data-srcset="https://d2uju15hmm6f78.cloudfront.net/image/2017/01/05/4109/2023/03/12/trim_167861627666704400_450x300.webp" -->
<!--                                     type="image/webp"> -->
<!--                                 <source -->
<!--                                     data-srcset="https://d2uju15hmm6f78.cloudfront.net/image/2017/01/05/4109/2023/03/12/trim_167861627666704400_450x300.jpg" -->
<!--                                     type="image/jpg"><img class="lazy" itemprop="contentUrl" title="【婚禮。精選】" -->
<!--                                     alt="【婚禮。精選】" -->
<!--                                     data-src="https://d2uju15hmm6f78.cloudfront.net/image/2017/01/05/4109/2023/03/12/trim_167861627666704400_450x300.jpg"> -->
<!--                             </picture> -->
<!--                         </a><span class="photos_counts"> -->
<!--                             共 479張</span></li> -->
<!--                     <li class="photos_name"> -->
<!--                         <h3 class="boxsize nobr"><a class="cltk_click" data-cltk-id="data-cltk-home_works-123082" -->
<!--                                 href="https://www.marry.com.tw/studio-works-kwmi4109mmwi123082mm.html#works_index" -->
<!--                                 title="【婚禮。精選】"><span itemprop="name"> -->
<!--                                     【婚禮。精選】</span></a></h3> -->
<!--                     </li> -->
<!--                     <li class="photos_studio nobr boxsize"><a class="cltk_click" -->
<!--                             data-cltk-id="data-cltk-home_works-123082" href="https://www.marry.com.tw/studio-4109" -->
<!--                             itemprop="author"> -->
<!--                             有惟攝影 yw studio<span> -->
<!--                                 6,819 人氣</span></a></li> -->
<!--                 </ul> -->

<!--             </div> -->
<!--         </div>   -->
<!--                 </ul> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->



<!-- ===============================婚禮籌備必讀攻略========================================= -->
    <section class="rwd_wrap group">
        <div class="index_title"><a href="https://www.marry.com.tw/topic?a_id=816">
                <i class="title_sort icon_no"></i>
                <h2>婚禮籌備必讀攻略</h2>
            </a>
            <p>共2,600篇</p><span class="more_go"><a href="https://www.marry.com.tw/topic?a_id=822">看更多<img
                        class="arrow_more" src="https://statics.marry.com.tw/img/public/arrow_more.svg"
                        alt="看更多"></a></span>
        </div>
        <div class="lg_12 topic_wall">
            <ul class="topic_list clearfix" id="data-cltk-home_topic-4061"
                data-cltk="amZGaDk0WWQ3UGZzSXMweVB6ZmtqMnJQaE5PMHhwMFFNS0FpOHNMdzQ3SzhNbmg1bWkwSDhLWEJoK3E1MGhMVCtjU05IQTNOMVdaNWRBOEFGc3RNZjVGd00zYnN3VHo3S1UwT1NOQ3JwdEdJdk1qT2FGZ1NsbkRES1E3YXVaemN0QldSZlhCTWpiYVAvc2RWVmtNWk5iWUxkS0Y1ZmZRM215WGo2eXIwZW5SWDgzK0ZDckhvQkhEckRkVTZIbmNRaXFDZWdXdG96blEyNnQ1cU9OaUpUb0QxZFBkNjl6N1dTSnNuVUY5ZDlEUlg5K3g4">
                <li class="l_img"><a class="cltk_click" data-cltk-id="data-cltk-home_topic-4061"
                        href="https://www.marry.com.tw/topic/4061" title="結婚不挑好日子竟有 6 大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！"><img
                            class="lazy"
                            data-src="https://data.marry.com.tw/img/2023/04/20/168198088273444400_w_mid_450x338.jpg"
                            title="結婚不挑好日子竟有 6 大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！"
                            alt="結婚不挑好日子竟有 6 大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！"></a></li>
                <li class="r_info">
                    <dl>
                        <dt>
                            <h3><a class="cltk_click" data-cltk-id="data-cltk-home_topic-4061"
                                    href="https://www.marry.com.tw/topic/4061"
                                    title="結婚不挑好日子竟有 6 大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！">結婚不挑好日子竟有 6
                                    大好處？忌嫁娶/鬼月/平日「非吉日」婚宴優惠專案盤點！</a></h3>
                        </dt>
                        <dd class="d_count" style="text-align:left;">
                            <div data-href="https://www.marry.com.tw/topic/4061" data-send="false"
                                data-layout="button_count" data-width="80" data-show-faces="false"></div>
                            人氣：<em>5223</em> <span>│</span>
                            分享：<em>2</em>
                        </dd>
                    </dl>
                </li>
            </ul>
			
			 <div id="msg_descri_{targetid}" class="send_btn msg_descri" is_focus="0" style="cursor:text;"
                contenteditable="true" placeholder="輪入訊息 (Shift + Enter 換行)" name="descri_div"
                onclick='ask_msg_list("#ask_msg_var_{targetid}");'>
            </div>
			
			
        </div>
    </section>
            
            

                


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
<%@include file="/front-end/footer.jsp"%>
<!-- Footer Section End --> 


</body>
</html>