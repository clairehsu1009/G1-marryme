<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="vendorList" scope="request" class="java.util.ArrayList" />


<html>
<head>
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<!-- <body class="app sidebar-mini rtl"> -->
<%-- <%@include file="/front-end/header.jsp" %> --%>
<%-- <%@include file="/front-end/user/common/userSidebar.jsp" %> --%>

	
<!--     Css Styles -->
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" /> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" /> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css" type="text/css" /> --%>

</head>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-user fa-lg"></i> 廠商基本資料</h1>
        </div>
        <c:if test="${not empty responseMsgMap.success}">
								    ${responseMsgMap.success}
		</c:if>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/front-end/vendor/vendorIndex.jsp"><i
                    class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">廠商首頁</li> 
        </ul>
    </div>
<!--    <div class="form_item"> -->
<!--       <p class="item_title item_title_required">你的頭像</p> -->
<!--       <form method="post" action="?" name="upload_form" style="opacity:1;cursor: pointer;"> -->
<!--         <div class="upload_img upload_avatar"><img id="pic_show" src="" alt=""><a href="javascript:;">上傳</a><input -->
<!--             type="file" name="file" id="file" style="width:100%;height:100%;" accept="image/*"></div> -->
<!--       </form> -->
<!--       <p class="input_tips">請上傳 200 x 200px 以上之 jpg / png 檔，檔案大小不超過10MB</p><span class="sattus sat_error" -->
<!--         style="display: none;" id="file_error"><i></i></span> -->
<!--     </div> -->
    <form method="post" name="edit_form" action="<%=request.getContextPath()%>/vendor/vendorBasicinformation">
<!--      				<div class="form-group"> -->
<!-- 						<label for="itemSelect" class="col-sm-2 col-form-label">廠商類別</label> -->
<!-- 						<div class="col-sm-10"> -->
<%-- 							<input class="form-control" id="manufacturerCategory" name="category" type="text" placeholder="" value="${vendor.manufacturerCategory}"> --%>
<!-- 						</div> -->
<!--      				</div> -->
     				 <c:set var="categoryValue" value="${vendor.manufacturerCategory}" />
					<label for="manufacturerCategory" class="col-sm-2 col-form-label">廠商類別</label>
					<a href="${pageContext.request.contextPath}/front-end/user/password.jsp" >修改密碼</a>
					<select class="form-control" style="width:80%;margin:15px" name="category" disabled>
			            <option value="0" ${genderValue == 0 ? 'selected' : ''}>商品</option>
			            <option value="1" ${genderValue == 1 ? 'selected' : ''}>服務</option>
			        </select>
<%-- 					<c:set var="categoryValue" value="${vendor.manufacturerCategory}" />  --%>
<!-- 			        <label for="manufacturerCategory" class="col-sm-2 col-form-label">廠商類別</label> -->
<!-- 					<select class="form-control" style="width:80%;margin:15px" name="category" disabled> -->
<%-- 					    <c:choose> --%>
<%-- 					        <c:when test="${categoryValue == 0}"> --%>
<!-- 					            <option value="0" selected>商品</option> -->
<!-- 					            <option value="1">服務</option> -->
<%-- 					        </c:when> --%>
<%-- 					        <c:when test="${categoryValue == 1}"> --%>
<!-- 					            <option value="0">商品</option> -->
<!-- 					            <option value="1" selected>服務</option> -->
<%-- 					        </c:when> --%>
<%-- 					    </c:choose> --%>
<!-- 					</select> -->
     				<div class="form-group">
						<label for="itemSelect" class="col-sm-2 col-form-label">品牌名稱</label>
						<div class="col-sm-10">
							<input class="form-control" id="vendorName" name="name" type="text" placeholder="請輸入您的品牌名稱" value="${vendor.vendorName}">
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商電話</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vendorPhone" name="phone" placeholder="請輸入您的電話號碼" value="${vendor.vendorPhone}">
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商統編</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="companyId" name="companyid" placeholder="請輸入您的統一編號" value="${vendor.companyId}">
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商聯絡人</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="contactPerson" name="person" placeholder="請輸入您的負責人" value="${vendor.contactPerson}">
						</div>
					</div>
<!-- 					<div class="form-group"> -->
<!-- 						<label for="vendorPassword" class="col-sm-2 col-form-label">廠商密碼</label> -->
<!-- 						<div class="col-sm-10"> -->
<%-- 							<input class="form-control" id="vendorPassword" name="pwd" type="password" placeholder="" value="${vendor.vendorPassword}"> --%>
<!-- 						</div> -->
<!-- 					</div> -->
					<c:set var="locationValue" value="${vendor.vendorLocation}" />
					<label for="vendorLocation" class="col-sm-2 col-form-label">廠商地區</label>
					<select class="form-control" style="width:80%;margin:15px" name="location" >
					    <option value="縣市" ${'縣市'.equals(locationValue) ? 'selected' : ''}>縣市</option>
					    <option value="新北市" ${'新北市'.equals(locationValue) ? 'selected' : ''}>新北市</option>
					    <option value="台北市" ${'台北市'.equals(locationValue) ? 'selected' : ''}>台北市</option>
					    <option value="桃園市" ${'桃園市'.equals(locationValue) ? 'selected' : ''}>桃園市</option>
					    <option value="新竹市" ${'新竹市'.equals(locationValue) ? 'selected' : ''}>新竹市</option>
					    <option value="新竹縣" ${'新竹縣'.equals(locationValue) ? 'selected' : ''}>新竹縣</option>
					    <option value="基隆市" ${'基隆市'.equals(locationValue) ? 'selected' : ''}>基隆市</option>
					    <option value="台中市" ${'台中市'.equals(locationValue) ? 'selected' : ''}>台中市</option>
					    <option value="苗栗縣" ${'苗栗縣'.equals(locationValue) ? 'selected' : ''}>苗栗縣</option>
					    <option value="彰化縣" ${'彰化縣'.equals(locationValue) ? 'selected' : ''}>彰化縣</option>
					    <option value="雲林縣" ${'雲林縣'.equals(locationValue) ? 'selected' : ''}>雲林縣</option>
					    <option value="南投縣" ${'南投縣'.equals(locationValue) ? 'selected' : ''}>南投縣</option>
					    <option value="高雄市" ${'高雄市'.equals(locationValue) ? 'selected' : ''}>高雄市</option>
					    <option value="台南市" ${'台南市'.equals(locationValue) ? 'selected' : ''}>台南市</option>
					    <option value="嘉義市" ${'嘉義市'.equals(locationValue) ? 'selected' : ''}>嘉義市</option>
					    <option value="嘉義縣" ${'嘉義縣'.equals(locationValue) ? 'selected' : ''}>嘉義縣</option>
					    <option value="屏東縣" ${'屏東縣'.equals(locationValue) ? 'selected' : ''}>屏東縣</option>
					    <option value="澎湖縣" ${'澎湖縣'.equals(locationValue) ? 'selected' : ''}>澎湖縣</option>
					    <option value="宜蘭縣" ${'宜蘭縣'.equals(locationValue) ? 'selected' : ''}>宜蘭縣</option>
					    <option value="花蓮縣" ${'花蓮縣'.equals(locationValue) ? 'selected' : ''}>花蓮縣</option>
					    <option value="台東縣" ${'台東縣'.equals(locationValue) ? 'selected' : ''}>台東縣</option>
					    <option value="金門縣" ${'金門縣'.equals(locationValue) ? 'selected' : ''}>金門縣</option>
					    <option value="連江縣" ${'連江縣'.equals(locationValue) ? 'selected' : ''}>連江縣</option>
					</select>
					<br>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vendorAddress" name="address" placeholder="請輸入您的完整地址" value="${vendor.vendorAddress}">
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商官方網址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vendorWebsite" name="website" placeholder="請輸入您的廠商官方網址" value="${vendor.vendorWebsite}">
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商FB</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vendorFb" name="facebook" placeholder="請輸入您的Facebook連結" value="${vendor.vendorFb}">
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商IG</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vendorIg" name="ig" placeholder="請輸入您的IG連結" value="${vendor.vendorIg}"/>
						</div>
					</div>
					<div class="form-group">
						<label for="googlemap" class="col-sm-2 col-form-label">googlemap</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="googlemap" name="googlemap" placeholder="請輸入您的googlemap連結" value="${vendor.googlemap}"/>
						</div>
					</div>
					<div class="form-group">
						<label for="basicIntroduction" class="col-sm-2 col-form-label">廠商基本資料</label>
						<div class="col-sm-10">
							<textarea  style="height:200px;text-align:left;white-space:normal;" class="form-control" id="basicIntroduction" name="basicIntroduction"  placeholder="請介紹一下您的品牌" >${vendor.basicIntroduction}</textarea>
<%-- 							<input type="text" style="height:200px;text-align:left;white-space:normal;line-height:45px;color: #495057;background-color: #fff;border: 1px solid #ced4da;font-size: 1rem;" id="basicIntroduction" name="basicIntroduction" placeholder="請輸入您的品牌介紹" value="${vendor.basicIntroduction}"> --%>
							<input type="hidden"  name="basicIntroduction"  value="${vendor != null ? '' : vendor.basicIntroduction}"/>
<%-- 							<textarea type="text" style="height:200px;text-align:left;white-space:normal;" class="form-control" id="basicIntroduction" name="basicIntroduction" placeholder="請介紹一下您的品牌" value="${vendor != null ? '' : vendor.basicIntroduction}">${vendor.basicIntroduction}</textarea> --%>
						</div>
					</div>
					
					<div class="col-sm-10 productAddBtn">
						<button type="submit" class="btn btn-info" name="action" value="update">儲存</button>
<!-- 						<input type="submit" class="btn btn-info" name="action" value="update"> -->
					</div>
    </form>
 
<!--   <div class="qa_line"> -->
<!--     <div> -->
<!--       <div class="qa_content radius_5 clearfix" id="footer_question_show" style="display:none;"> -->
<!--         <header> -->
<!--           <h4 id="footer_question_title">問題回報</h4><a class="close_it" href="javascript:void('0');" -->
<!--             onclick="footer_question_close();">X</a> -->
<!--         </header><input type="text" size="10" value="" maxlength="10" id="footer_question_name" -->
<!--           name="footer_question_name" placeholder="您的暱稱" class="msg_input error_box radius_3"> -->
<!--         <div class="error_text" style="display:none;">請輸入您的暱稱</div><input type="text" size="10" value="" maxlength="30" -->
<!--           id="footer_question_email" name="footer_question_email" placeholder="您的信箱" class="msg_input radius_3"> -->
<!--         <div class="error_text" style="display:none;">請輸入您的信箱</div> -->
<!--         <textarea class="radius_3" id="footer_question_descri" name="footer_question_descri" -->
<!--           placeholder="Hi，使用平台的過程中遇到問題或想分享建議給我們嗎？歡迎在此回應。"></textarea> -->
<!--         <div class="error_text" style="display:none;">請輸入您的問題或建議</div><input type="button" id="footer_question_submit" -->
<!--           value="確認送出" class="btn_pink send radius_3" -->
<!--           onclick="add_question(this,'footer_question','footer_question_ok','footer_question_show');"> -->
<!--         <span id="footer_question_ok" class="send_q" style="display:none;">謝謝您的回饋，<br>讓我們能做的更好！</span> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
   
   
</main>

<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script type="text/javascript">

<!-- Js Plugins -->
<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script> -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.bundle.js"></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script> --%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/marryme.js"></script> --%>



</body>

</html>