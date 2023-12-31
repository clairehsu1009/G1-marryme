<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored="false" %>

<!-- 登入以後要跳轉到首頁 -->
<html>
<head>
	<%@include file="/front-end/user/common/userHead.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
   
	
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
            <form class="login radius_3" name="login_form" method="POST" action="<%=request.getContextPath()%>/user/userLogin" style="margin-bottom:50px;margin-top:200px;width:400px;">
                <!-- <h2>立即登入</h2> -->
                <!-- HTML -->

                <span id="tab-1">會員登入</span>
                <span id="tab-2">廠商登入</span>
<!--                 <span id="tab-3">平台登入</span> -->


                <!-- 頁籤按鈕 -->
                <div id="tab">
                    <ul>
                        <li><a href="#tab-1" style="margin-right:40px;">會員登入</a></li>
                        <li><a href="#tab-2" style="margin-right:70px;">廠商登入</a></li>
<!--                         <li><a href="#tab-3">平台登入</a></li> -->

                    </ul>

                    <!-- 頁籤的內容區塊 -->

                    <div class="tab-content-1" >
                        <ul>
                            <label class="item_name" style="text-align:left;">會員電子信箱/Email</label>
                            <li><input type="text" name="memberAccount" class="basic_input input_code"
                                    placeholder="請輸入您的電子信箱/Email"><label class="sattus"
                                    style="display:none"></label><br>
                            </li><br>
                            <label class="item_name" style="text-align:left;">會員密碼</label>
                            <li><input type="password" name="memberPwd" class="basic_input input_code"
                                    placeholder="請輸入您的密碼"><label class="sattus" style="display:none"></label><br>
                            </li><br>
                        </ul>
						<c:if test="${not empty responseMsgMap.exception}">
							    ${responseMsgMap.exception}
							</c:if><br>
                        <button type="submit" class="btn btn-warning" name="action" value="memberLogin">會員登入</button><br>
                        <div class="link_wrap">
                        <a href="${pageContext.request.contextPath}/front-end/user/userRegister.jsp" class="register">免費註冊</a>
                        <a href="${pageContext.request.contextPath}/front-end/user/password.jsp">忘記密碼</a>
                        </div><br>

                    </div>
                    <div class="tab-content-2">
                        <ul>
                            <label class="item_name" style="text-align:left;">廠商電子信箱/Email</label>
                            <li><input type="text" name="vendorAccount" class="basic_input input_code"
                                    placeholder="請輸入您的電子信箱/Email"><label class="sattus"
                                    style="display:none"></label><br>
                            </li><br>
                            <label class="item_name" style="text-align:left;">廠商密碼</label>
                            <li><input type="password" name="vendorPwd" class="basic_input input_code"
                                    placeholder="請輸入您的密碼"><label class="sattus" style="display:none"></label><br>
                            </li><br>
                        </ul>
                        <c:if test="${not empty errorMap.exception}">
							    ${errorMap.exception}
							</c:if><br>
                        <button type="submit" class="btn btn-warning" name="action" value="vendorLogin">廠商登入</button>
                        <div class="link_wrap">
                        <a href="${pageContext.request.contextPath}/front-end/vendor/vendorRegister.jsp" class="register">免費註冊</a>
                        <a href="${pageContext.request.contextPath}/front-end/user/password.jsp">忘記密碼</a>
                        </div><br>

                    </div>
<!--                     <div class="tab-content-3"> -->
<!--                         <ul> -->
<!--                             <label class="item_name" style="text-align:left;">平台登入帳號/Email</label> -->
<!--                             <li><input type="text" name="empAccount" class="basic_input input_code" -->
<!--                                     placeholder="請輸入您的帳號/Email"><label class="sattus" style="display:none"></label><br> -->
<!--                             </li><br> -->
<!--                             <label class="item_name" style="text-align:left;">平台密碼</label> -->
<!--                             <li><input type="password" name="empPwd" class="basic_input input_code" -->
<!--                                     placeholder="請輸入您的密碼"><label class="sattus" style="display:none"></label><br> -->
<!--                             </li><br> -->
<!--                         </ul><br> -->
<%--                         <c:if test="${not empty errorMsgMap.exception}"> --%>
<%-- 							    ${errorMsgMap.exception} --%>
<%-- 							</c:if><br> --%>
<!--                         <button type="submit" class="btn btn-warning" name="action" value="empLogin">平台登入</button> -->
          
<!--                     </div> -->
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