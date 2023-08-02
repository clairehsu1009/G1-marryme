<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="place" scope="request" class="com.marryme.plan.vo.Place" />
<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-edit"></i>方案場地
            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-place"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-place"><a href="<%=request.getContextPath()%>/plan-place?vendorId=${vendorId}">方案場地管理</a></li>
        </ul>
    </div>
    <!-- 之後這邊要改取得登入廠商的ID 才是正確的 -->
    <c:if test="${vendorId == place.vendorId}">
    <div class="row">
        <div class="col-md-12 productsAdd productList">
        <div class="tab-place-content">
            <div class="tab-content">
                <table class="table">
                    <tbody>
                    <tr>
                        <th scope="col">場地主圖片</th>
                        <td>
                            <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePicture" class="rounded mx-auto d-block" alt="場地主圖片">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">場地標題</th>
                        <td>${place.placeTitle}</td>
                    </tr>
                    <tr>
                        <th scope="col">建議桌數區間</th>
                        <td>${place.numbeOfTables}</td>
                    </tr>
                    <tr>
                        <th scope="col">場地介紹</th>
                        <td>${place.placeIntroduction}</td>
                    </tr>
                    <tr>
                        <th scope="col">圖片</th>
                        <td>
                            <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures2" class="rounded mx-auto d-block" alt="場地圖片2">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">圖片</th>
                        <td>
                            <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures3" class="rounded mx-auto d-block" alt="場地圖片3">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">圖片</th>
                        <td>
                            <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures4" class="rounded mx-auto d-block" alt="場地圖片4">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col">圖片</th>
                        <td>
                            <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures5" class="rounded mx-auto d-block" alt="場地圖片5">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        </div>
    </div>
    </c:if>
</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script type="text/javascript">

</script>
</body>
</html>