<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="placeList" scope="request" class="java.util.ArrayList" />

<html>
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-archive">&nbsp;</i>方案場地</h1>
        </div>
        <form method="post" action="<%=request.getContextPath()%>/plan-place" style="margin-bottom: 0;">
            <input type="hidden" name="vendorId" value="${vendor.vendorId}" />
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/plan-place?vendorId=${vendor.vendorId}">方案場地管理</a></li>
        </ul>
        </form>
    </div>
    <div class="row productList" id="productList">
        <div class="product-tab col-lg-12 col-12">
            <div class="tab-item">
                <ul class="nav" role="tablist">
                    <li><a data-toggle="tab" href="#tab-0" role="tab">下架</a></li>
                    <li><a class="active" data-toggle="tab" href="#tab-1" role="tab">上架中</a></li>
                </ul>
            </div>
            <div class="tab-item-content">
                <div class="tab-content">
                    <c:forEach begin="0" end="1" varStatus="loop" >
                        <c:set var="activeClass" value="${loop.index == 1 ? 'active' : ''}" />
                    <div class="tab-pane fade-in ${activeClass}" id="tab-${loop.index}" role="tabpanel">
                        <table class="table">
                            <thead class="thead">
                            <tr>
                                <th scope="col">場地主圖片</th>
                                <th scope="col">場地標題</th>
                                <th scope="col">建議桌數區間</th>
                                <th scope="col">場地介紹</th>
                                <th scope="col">圖片</th>
                                <th scope="col">圖片</th>
                                <th scope="col">圖片</th>
                                <th scope="col">圖片</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="place" items="${placeList}" begin="0" end="${placeList.size()}">
                                <c:if test="${place.status == loop.index}">
                                <tr>
                                    <td>
                                        <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePicture" class="rounded mx-auto d-block" alt="場地主圖片">
                                    </td>
                                    <td>${place.placeTitle}</td>
                                    <td>${place.numbeOfTables}</td>
                                    <td>${place.placeIntroduction}</td>
                                    <td>
                                        <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures2" class="rounded mx-auto d-block" alt="場地圖片2">
                                    </td>
                                    <td>
                                        <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures3" class="rounded mx-auto d-block" alt="場地圖片3">
                                    </td>
                                    <td>
                                        <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures4" class="rounded mx-auto d-block" alt="場地圖片4">
                                    </td>
                                    <td>
                                        <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePictures5" class="rounded mx-auto d-block" alt="場地圖片5">
                                    </td>
                                    <td>
                                        <form method="post" action="<%=request.getContextPath()%>/plan-place" style="margin-bottom: 0 ;">
                                            <input type="hidden" name="planPlaceId" value="${place.placeId}" />
                                            <input type="hidden" name="vendorId" value="${place.vendorId}" />
                                            <c:if test="${place.editStatus == 0}">
                                                <button type="submit" class="btn btn-info" name="action" value="getOneForUpdate">編輯</button>
                                            </c:if>
                                            <button type="submit" class="btn btn-warning" name="action" value="changeStatusToInactive">下架</button>
                                        </form>
                                    </td>
                                </tr>
                                 </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>


</body>
</html>