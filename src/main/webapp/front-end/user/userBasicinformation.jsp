<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="memberList" scope="request" class="java.util.ArrayList" />


<html>
<%@include file="/front-end/user/common/userHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp" %>
<%@include file="/front-end/user/common/userSidebar.jsp" %>

	
<!--     Css Styles -->
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" /> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" /> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css" type="text/css" /> --%>

</head>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp" %>
<%@include file="/front-end/user/common/userSidebar.jsp" %>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-user fa-lg"></i>會員基本資料</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/front-end/user/userIndex.jsp"><i
                    class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">會員首頁</li>
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
	
    <form method="post" name="edit_form" action="<%=request.getContextPath()%>/user/userBasicinformation">
     
      
     <div class="form-group">
                 
              
						<label for="memberName" class="col-sm-2 col-form-label">會員姓名</label>
						<div class="col-sm-10">
							<input class="form-control" id="memberName" name="name" type="text" placeholder="請輸入您的姓名" value="${member.memberName}">
						</div>
					</div>
					<div class="form-group">
						<label for="memberPhone" class="col-sm-2 col-form-label">會員電話</label>
						<div class="col-sm-10">
							<input class="form-control" id="memberPhone" name="phone" type="text" placeholder="請輸入您的電話號碼" value="${member.memberPhone}">
						</div>
					</div>
					<div class="form-group">
						<label for="memberAddress" class="col-sm-2 col-form-label">會員居住地</label>
						<div class="col-sm-10">
							<input class="form-control" id="memberAddress" name="address" type="text" placeholder="請輸入您的居住地" value="${member.memberAddress}">
						</div>
					</div>
					<div class="form-group">
						<label for="memberPassword" class="col-sm-2 col-form-label">會員密碼</label>
						<div class="col-sm-10">
							<input class="form-control" id="memberPassword" name="pwd" type="text" placeholder="請輸入您的密碼" value="${member.memberPassword}">
						</div>
					</div>
					 <c:set var="genderValue" value="${member.memberGender}" />
					<label for="memberGender" class="col-sm-2 col-form-label">會員性別</label>
					<select class="form-control" style="width:80%;margin:15px" name="sex">
			            <option value="0" ${genderValue == 0 ? 'selected' : ''}>請選擇身分</option>
			            <option value="1" ${genderValue == 1 ? 'selected' : ''}>新郎</option>
			            <option value="2" ${genderValue == 2 ? 'selected' : ''}>新娘</option>
			        </select>
					<br>
					<div class="col-sm-10 productAddBtn">
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