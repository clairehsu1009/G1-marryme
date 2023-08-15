<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<jsp:useBean id="vendor" scope="request" class="com.marryme.vendor.vo.Vendor" />


<html lang="zh-tw">
<head>
  
	<%@include file="/front-end/user/common/userHead.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

    <link rel="icon" href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico" type="image/x-icon">
	
    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/user_login.css" type="text/css" />
</head>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp" %>

    <div class="rwd_wrap group background_img">


        <div class="col lg_12 md_12 sm_12">
              <form method="POST" class="login radius_3" name="login_form" style="width:450px;margin-top:170px;"action="<%=request.getContextPath()%>/vendor/vendorRegister">
               
               <h2>廠商註冊</h2>


                <div class="tab-content-1">
                    <ul>
                        <label class="item_name" style="text-align:left;">註冊電子信箱/Email</label>
                        <li><input type="text" name="account" class="basic_input input_code"
                                placeholder="請輸入您的電子信箱/Email" required><label class="sattus" style="display:none"></label><br>
                        </li><br>
                        <label class="item_name" style="text-align:left;">註冊密碼</label>
                        <li><input type="password" name="pwd" class="basic_input input_code"  title="密碼須包含至少2位英文和6位數字，總長度不得低於8碼"
                                placeholder="請輸入您的密碼" required><label class="sattus" style="display:none"></label><br>
                        </li><br>
                        <label class="item_name" style="text-align:left;">再次確認密碼</label>
                        <li><input type="password" name="againpwd" class="basic_input input_code" title="請與註冊密碼相符"
                                placeholder="請再次輸入您的密碼" required><label class="sattus" style="display:none"></label><br>
                        </li><br>
                         <label class="item_name" style="text-align:left;">品牌名稱</label>
                        <li><input type="text" name="name" class="basic_input input_code"
                                placeholder="請輸入您的品牌名稱" required><label class="sattus" style="display:none"></label><br>
                        </li><br>
                        <c:set var="categoryValue" value="${vendor.manufacturerCategory}" /> 
                        <label class="item_name" style="text-align:left;">廠商類別</label>
						<select class="form-control" name="category" required>
						    <option value="0" >商品</option>
						    <option value="1" >服務</option>
						</select>
							<br>
                        <label class="item_name" style="text-align:left;">電話號碼</label>
                        <li><input type=" password" name="phone" class="basic_input input_code" placeholder="請輸入您的電話號碼" required>
                             <label class="sattus" style="display:none"></label><br>
                        </li><br>
						<label for="vendorLocation" class="item_name" style="text-align:left;">廠商地區</label>
						<select class="form-control" name="location" required>
						    <option value="縣市" >縣市</option>
						    <option value="台北市" >台北市</option>
						    <option value="新北市" >新北市</option>
						    <option value="桃園市" >桃園市</option>
						    <option value="新竹市" >新竹市</option>
						    <option value="新竹縣" >新竹縣</option>
						    <option value="基隆市" >基隆市</option>
						    <option value="台中市" >台中市</option>
						    <option value="苗栗縣" >苗栗縣</option>
						    <option value="彰化縣" >彰化縣</option>
						    <option value="雲林縣" >雲林縣</option>
						    <option value="南投縣" >南投縣</option>
						    <option value="高雄市" >高雄市</option>
						    <option value="台南市" >台南市</option>
						    <option value="嘉義市" >嘉義市</option>
						    <option value="嘉義縣" >嘉義縣</option>
						    <option value="屏東縣" >屏東縣</option>
						    <option value="澎湖縣" >澎湖縣</option>
						    <option value="宜蘭縣" >宜蘭縣</option>
						    <option value="花蓮縣" >花蓮縣</option>
						    <option value="台東縣" >台東縣</option>
						    <option value="金門縣" >金門縣</option>
						    <option value="連江縣" >連江縣</option>
						</select>
							<br>
                         <label class="item_name" style="text-align:left;">廠商統編</label>
                        <li><input type="text" name="companyid" class="basic_input input_code"
                                placeholder="請輸入您的統一編號" required><label class="sattus" style="display:none"></label><br>
                        </li><br>
                        <label class="item_name" style="text-align:left;">廠商聯絡人</label>
                        <li><input type=" password" name="contactperson" class="basic_input input_code"
                                placeholder="請輸入您的負責人" required><label class="sattus" style="display:none"></label><br>
                        </li><br>
                        <label class="item_name" style="text-align:left;">廠商基本資料</label>
                        <li>
                        <input type=" password" name="basicintroduction" class="basic_input input_code" style="height:200px;"
                                placeholder="請介紹一下您的品牌"required>
<!--                              <textarea type="text" style="height:200px;text-align:left;white-space:normal;" class="form-control" id="basicIntroduction" name="basicIntroduction"  placeholder="請介紹一下您的品牌" required></textarea> -->
                                <label class="sattus" style="display:none"></label><br>
                        </li><br>
                        <!-- 如果有錯誤訊息，顯示錯誤訊息 -->
                        <c:if test="${not empty responseMsgMap.exception}">
							    ${responseMsgMap.exception}
						</c:if><br>
                    </ul>
                    <br>
                    	 <input type="submit" class="btn btn-warning" name="action" value="確定註冊">
                    	<div class="link_wrap">
                        <a href="${pageContext.request.contextPath}/front-end/user/userLogin.jsp" class="register">已經有帳號?</a>
<!--                             <a href="https://www.marry.com.tw/member-findpwd.html">忘記密碼</a> -->
                        </div><br>
                    
					

                </div>
               
            </form>
        </div>
    </div>




<!-- Js Plugins -->
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.bundle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/marryme.js"></script>


</body>
</html>