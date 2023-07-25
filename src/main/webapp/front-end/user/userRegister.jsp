<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<jsp:useBean id="member" scope="request" class="com.marryme.member.vo.Member" />

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
               
               <h2>免費註冊</h2>


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
<!--                         <label class="item_name" style="text-align:left;">尊姓大名</label> -->
<!--                         <li><input type="text" name="name" class="basic_input input_code" -->
<!--                                 placeholder="請輸入您的姓名"><label class="sattus" style="display:none"></label><br> -->
<!--                         </li><br> -->
<!--                         <label class="item_name" style="text-align:left;">電話號碼</label> -->
<!--                         <li><input type="text" name="phone" class="basic_input input_code" -->
<!--                                 placeholder="請輸入您的電話號碼"><label class="sattus" style="display:none"></label><br> -->
<!--                         </li><br> -->
                    </ul>
                    <br>
<!--                     <div class=""><input type="button" value="確認註冊" onclick="login_submit();" -->
<!--                             class="btn_common btn_primary"> -->
<!--                     </div> -->
			                     <button type="submit" class="btn btn-warning" name="action" value="changeStatusToInactive">確定註冊</button><br>
                    
                    <div class="link_wrap"><a href="https://www.marry.com.tw/member-register.html"
                            class="register">已經有帳號?</a> 
<!--                             網址要換成登入畫面 -->
                        <a href="https://www.marry.com.tw/member-findpwd.html">忘記密碼</a>
                    </div><br>

                </div>
               
            </form>
        </div>
    </div>



<!-- body End -->


<!-- Footer Section Begin -->
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