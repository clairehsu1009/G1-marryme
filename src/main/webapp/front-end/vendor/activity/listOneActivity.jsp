<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="activity" scope="request" class="com.marryme.activity.entity.Activity" />
<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-edit"></i>我的優惠券
            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/activity/findAll?vendorId=${vendorId}">優惠券管理</a></li>
        </ul>
    </div>
    <!-- 之後這邊要改取得登入廠商的ID 才是正確的 -->
    <c:if test="${vendorId == activity.vendorId}">
        <div class="tab-item-content">
            <div class="tab-content">
                <table class="table">
                    <tbody>
                    <tr>
                        <th scope="col">優惠代碼</th>
                        <td>${activity.discountCode}</td>
                    </tr>
                    <tr>
                        <th scope="col">優惠活動名稱</th>
                        <td>${activity.activityName}</td>
                    </tr>
                    <tr>
                        <th scope="col">折扣額度</th>
                        <td>${activity.discount}</td>
                    </tr>
                    <tr>
                        <th scope="col">活動開始時間</th>
                        <td>${activity.activityStartTime}</td>
                    </tr>
                    <tr>
                        <th scope="col">活動結束時間</th>
                        <td>${activity.activityEndTime}</td>
                    </tr>
                    <tr>
                        <th scope="col">活動內容</th>
                        <td>${activity.activityDetail}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script type="text/javascript">

</script>
</body>
</html>