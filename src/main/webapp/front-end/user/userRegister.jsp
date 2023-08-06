<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<html lang="zh-tw">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/user_login.css" type="text/css" />
</head>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp" %>

    <div class="rwd_wrap group background_img">


        <div class="col lg_12 md_12 sm_12">
              <form method="POST" class="login radius_3" name="login_form" action="<%=request.getContextPath()%>/user/userRegister">
               
               <h2>會員註冊</h2>


                <div class="tab-content-1">
                    <ul>
                        <label class="item_name" style="text-align:left;">註冊電子信箱/Email</label>
                        <li><input type="text" name="account" class="basic_input input_code"
                                placeholder="請輸入您的電子信箱/Email"><label class="sattus" style="display:none"></label><br>
                        </li><br>
                        <label class="item_name" style="text-align:left;">註冊密碼</label>
                        <li><input type=" password" name="pwd" class="basic_input input_code"
                                placeholder="請輸入您的密碼"><label class="sattus" style="display:none"></label><br>
                        </li><br>
                        <label class="item_name" style="text-align:left;">再次確認密碼</label>
                        <li><input type=" password" name="againpwd" class="basic_input input_code"
                                placeholder="請再次輸入您的密碼"><label class="sattus" style="display:none"></label><br>
                        </li><br>
                        <c:if test="${not empty responseMsgMap.exception}">
							    ${responseMsgMap.exception}
							</c:if><br>
 
                    </ul>
                    <br>

                    	 <button type="submit" class="btn btn-info" name="action" value="update">確定註冊</button>
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

<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script type="text/javascript">

</script>

</body>
</html>