<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<html>
<%@include file="/front-end/user/common/userHead.jsp"%>

<head>
	<%@include file="/front-end/user/common/userHead.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Merry Me</title>
    <link rel="icon" href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico" type="image/x-icon">
	
    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/member_basic_information.css" type="text/css" />
</head>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp" %>
<%@include file="/front-end/user/common/userSidebar.jsp" %>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-user fa-lg"></i> 會員基本資料</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/front-end/user/userIndex.jsp"><i
                    class="fa fa-home fa-lg"></i></a></li>
            <li class="breadcrumb-item">會員首頁</li>
        </ul>
    </div>
   <div class="form_item">
      <p class="item_title item_title_required">你的頭像</p>
      <form method="post" action="?" name="upload_form" style="opacity:1;cursor: pointer;">
        <div class="upload_img upload_avatar"><img id="pic_show" src="" alt=""><a href="javascript:;">上傳</a><input
            type="file" name="file" id="file" style="width:100%;height:100%;" accept="image/*"></div>
      </form>
      <p class="input_tips">請上傳 200 x 200px 以上之 jpg / png 檔，檔案大小不超過10MB</p><span class="sattus sat_error"
        style="display: none;" id="file_error"><i></i></span>
    </div>
    <form method="post" action="?" name="edit_form">
      <div class="content">
        <div class="form_item">
          <p class="item_title item_title_required">您的姓名</p><input class="basic_input" type="text" size="10" value=""
            maxlength="20" id="name" name="name" placeholder="請輸入您的姓名"><span class="sattus sat_error"
            style="display: none;"><i></i></span>
        </div>
        <div class="form_item form_dropdown">
          <p class="item_title item_title_required">新人身份</p><select class="basic_input" name="identity_type"
            id="identity_type">
            <option value="0" selected="selected">請選擇新人身份</option>
            <option value="1">新娘</option>
            <option value="2">新郎</option>
            <option value="3">共用使用</option>
          </select><span class="sattus sat_error" style="display: none;"><i></i></span>
        </div>
        <div class="form_item form_datepicker">
          <p class="item_title item_title_required">您的生日</p><input type="text" value="" name="wedding_day"
            placeholder="選擇您的生日" autocomplete="off"><span id="wedding_day_tips" class="sattus sat_error"
            style="display: none;"><i></i></span>
        </div>
        <div class="form_item">
          <p class="item_title item_title_required">您的電話號碼</p><input class="basic_input" type="text" size="10" value=""
            maxlength="20" id="name" name="name" placeholder="請輸入您的電話號碼"><span class="sattus sat_error"
            style="display: none;"><i></i></span>
        </div>
        <div class="form_item">
          <p class="item_title item_title_required">您的居住地</p><input class="basic_input" type="text" size="10" value=""
            maxlength="20" id="name" name="name" placeholder="請輸入您的居住地"><span class="sattus sat_error"
            style="display: none;"><i></i></span>
        </div>

      </div>
      <div class="content">
        <h3>註冊資料</h3>
      </div>
      <div class="form_item">
        <p class="item_title">信箱</p><input type="text" size="50" value="" readonly="" maxlength="50" id="email"
          name="email" placeholder="欲變更信箱，請至帳號設定修改" class="basic_input"><br><span class="caption">如欲變更信箱，請至<a
            href="https://www.marry.com.tw/my-account.html">帳號設定修改</a></span>
      </div>
      <div class="form_item">
        <p class="item_title">密碼</p><input type="number" size="10" value="0972280301" readonly="" disabled="disabled"
          maxlength="10" id="mobile" name="mobile" placeholder="請確認密碼" class="basic_input"><br><span
          class="mobile_verification">尚未驗證密碼，<a href="javascript:;"
            onclick="pop_mobile_verify('再一步，就能完成修改信箱！');">前往驗證</a></span>
      </div>
      <input type="hidden" name="upload_size" value="10485760"><input type="hidden" name="upload_format"
        value="jpe?g|png"><input type="hidden" name="picdata" value=""><input type="hidden" name="picdatak"
        value=""><input type="hidden" name="module" value="my"><input type="hidden" name="action"
        value="info_save"><input type="hidden" name="target_width" value="200"><input type="hidden" name="target_height"
        value="200"><input type="hidden" name="bt_list_str" id="bt_list_str" value="">
      <a class="btn_primary btn_common" href="javascript:;" title="儲存" onclick="save(this);">儲存更新</a>
    </form>
  </div>
  </div>
  </div>
  </div>
  <div class="qa_line">
    <div>
      <div class="qa_content radius_5 clearfix" id="footer_question_show" style="display:none;">
        <header>
          <h4 id="footer_question_title">問題回報</h4><a class="close_it" href="javascript:void('0');"
            onclick="footer_question_close();">X</a>
        </header><input type="text" size="10" value="" maxlength="10" id="footer_question_name"
          name="footer_question_name" placeholder="您的暱稱" class="msg_input error_box radius_3">
        <div class="error_text" style="display:none;">請輸入您的暱稱</div><input type="text" size="10" value="" maxlength="30"
          id="footer_question_email" name="footer_question_email" placeholder="您的信箱" class="msg_input radius_3">
        <div class="error_text" style="display:none;">請輸入您的信箱</div>
        <textarea class="radius_3" id="footer_question_descri" name="footer_question_descri"
          placeholder="Hi，使用平台的過程中遇到問題或想分享建議給我們嗎？歡迎在此回應。"></textarea>
        <div class="error_text" style="display:none;">請輸入您的問題或建議</div><input type="button" id="footer_question_submit"
          value="確認送出" class="btn_pink send radius_3"
          onclick="add_question(this,'footer_question','footer_question_ok','footer_question_show');">
        <span id="footer_question_ok" class="send_q" style="display:none;">謝謝您的回饋，<br>讓我們能做的更好！</span>
      </div>
    </div>
  </div>
   
   
</main>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>

</html>