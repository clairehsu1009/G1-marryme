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
                <i class="fa fa-edit"></i>方案加購項目
            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/plan-item?vendorId=${vendor.vendorId}">方案加購項目管理</a></li>
        </ul>
    </div>
    <!-- 之後這邊要改取得登入廠商的ID 才是正確的 -->
    <c:if test="${vendor.vendorId == item.vendorId}">
        <div class="tab-item-content">
            <div class="tab-content">
                <table class="table">
                    <tbody>
                    <tr>
                        <th scope="col">項目種類</th>
                        <td>${item.itemTypeName}</td>
                    </tr>
                    <tr>
                        <th scope="col">項目名稱</th>
                        <td>${item.itemSelect}</td>
                    </tr>
                    <tr>
                        <th scope="col">項目說明</th>
                        <td>${item.itemDescription}</td>
                    </tr>
                    <tr>
                        <th scope="col">訂金</th>
                        <td>${item.itemDeposit}</td>
                    </tr>
                    <tr>
                        <th scope="col">金額</th>
                        <td>${item.itemTotal}</td>
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