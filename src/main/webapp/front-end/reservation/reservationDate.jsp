<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="item" scope="request" class="com.marryme.plan.vo.Item" />
<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-edit"></i>預約賞廳
            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/reservation?vendorId=${vendorId}">預約賞聽管理</a></li>
        </ul>
    </div>
    <!-- 之後這邊要改取得登入廠商的ID 才是正確的 -->
<%--     <c:if test="${vendorId == reservation.vendorId}"> --%>
    <div class="row">
        <div class="col-md-12 productsAdd productList">
        <div class="tab-item-content">
            <div class="tab-content">
                <table class="table">
                    <tbody>
                    <tr>
                        <th scope="col">客戶名稱</th>
                        <td>${reservation.contactName}</td>
                    </tr>
                    <tr>
                        <th scope="col">聯繫電話</th>
                        <td>${reservation.contactNumber}</td>
                    </tr>
                    <tr>
                        <th scope="col">宴客日期</th>
                        <td>${reservation.eventDate}</td>
                    </tr>
                    <tr>
                        <th scope="col">預約日期</th>
                        <td>${reservation.reservationDate}</td>
                    </tr>
                    <tr>
                        <th scope="col">備註</th>
                        <td>${reservation.reservationNotes}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        </div>
    </div>
<%--     </c:if> --%>
</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script type="text/javascript">

</script>
</body>
</html>