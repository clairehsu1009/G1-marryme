<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="vendorList" scope="request" class="java.util.ArrayList" />


<html>
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp" %>
<%@include file="/front-end/user/common/userSidebar.jsp" %>

	
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
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/front-end/user/userIndex.jsp"><i
                    class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">廠商首頁</li> 
<!--             							廠商商場? -->
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
     				<div class="form-group">
						<label for="itemSelect" class="col-sm-2 col-form-label">品牌名稱</label>
						<div class="col-sm-10">
							<input class="form-control" id="vendorName" name="name" type="text" placeholder="請輸入您的品牌名稱" value="${vendor.vendorName}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商電話</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vendorPhone" name="phone" placeholder="請輸入您的電話號碼" value="${vendor.vendorPhone}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商統編</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="companyId" name="id" placeholder="請輸入您的統一編號" value="${vendor.companyId}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商聯絡人</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="contactPerson" name="Person" placeholder="請輸入您的負責人" value="${vendor.contactPerson}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="vendorPassword" class="col-sm-2 col-form-label">廠商密碼</label>
						<div class="col-sm-10">
							<input class="form-control" id="vendorPassword"" name="pwd" type="text" placeholder="" value="${vendor.vendorPassword}">
						</div>
					</div>
					<label for="vendorLocation" class="col-sm-2 col-form-label">廠商地區</label>
					<select class="form-control" style="width:80%;margin:15px" name="location">
					  		  <option value="10">縣市</option>
			                  <option value="11">台北市</option>
			                  <option value="12">新北市</option>
			                  <option value="13">桃園市</option>
			                  <option value="14">新竹市</option>
			                  <option value="15">新竹縣</option>
			                  <option value="16">基隆市</option>
			                  <option value="17">台中市</option>
			                  <option value="18">苗栗縣</option>
			                  <option value="19">彰化縣</option>
			                  <option value="20">雲林縣</option>
			                  <option value="21">南投縣</option>
			                  <option value="22">高雄市</option>
			                  <option value="23">台南市</option>
			                  <option value="24">嘉義市</option>
			                  <option value="25">嘉義縣</option>
			                  <option value="26">屏東縣</option>
			                  <option value="27">澎湖縣</option>
			                  <option value="28">宜蘭縣</option>
			                  <option value="29">花蓮縣</option>
			                  <option value="30">台東縣</option>
			                  <option value="31">金門縣</option>
			                  <option value="32">連江縣</option>
					</select>
					<br>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vendorAddress" name="address" placeholder="請輸入您的完整地址" value="${vendor.vendorAddress}" required>
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
							<input type="text" class="form-control" id="vendorFb" name="Facebook" placeholder="請輸入您的Facebook連結" value="${vendor.vendorFb}">
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商IG</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vendorIg" name="IG" placeholder="請輸入您的IG連結" value="${vendor.vendorIg}">
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">googlemap</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="googlemap" name="googlemap" placeholder="請輸入您的googlemap連結" value="${vendor.googlemap}" required>
						</div>
					</div>
					<div class="form-group">
						<label for="itemDescription" class="col-sm-2 col-form-label">廠商基本資料</label>
						<div class="col-sm-10">
							<input type="text" style="height:200px;" class="form-control" id="basicIntroduction" name="basicIntroduction" placeholder="請介紹一下您的品牌" value="${vendor.basicIntroduction}" required>
						</div>
					</div>
					
					<div class="col-sm-10 productAddBtn">
						<input type="hidden" name="planItemId" value="${item.planItemId}">
						<a href="<%=request.getContextPath()%>/plan-item?vendorId=${vendorId}"><button type="button" class="btn btn-danger">取消</button></a>
						<button type="submit" class="btn btn-info" name="action" value="update">儲存</button>
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