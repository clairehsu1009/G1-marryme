<%@ page import="com.marryme.plan.service.impl.PlaceServiceImpl" %>
<%@ page import="com.marryme.plan.service.PlaceService" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="plan" scope="request" class="com.marryme.plan.vo.Plan"/>

<html lang="zh-tw">
<%@include file="/front-end/vendor/common/vendorHead.jsp" %>

<%
    PlaceService placeService = new PlaceServiceImpl();
    request.setAttribute("placeService", placeService);
%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp" %>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp" %>
<style>
    .productList .btn.btn-danger {
        margin-top: 0;
    }
    .productAddBtn {
    margin: 0 auto;
    }
</style>
<main class="app-content">
    <div class="app-title">
        <div>
            <h1>
                <i class="fa fa-edit"></i>方案
            </h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-place"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-place"><a href="<%=request.getContextPath()%>/plan?vendorId=${vendor.vendorId}">方案管理</a></li>
        </ul>
    </div>
    <!-- 之後這邊要改取得登入廠商的ID 才是正確的 -->
    <c:if test="${vendor.vendorId == plan.vendorId}">
        <div class="row">
            <div class="col-md-12 productsAdd productList">
                <div class="tab-place-content">
                    <div class="tab-content">
                        <table class="table">
                            <tbody>
                            <tr>
                                <th scope="col">方案主圖片</th>
                                <td>
                                    <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPicture" class="rounded mx-auto d-block" alt="方案主圖片">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">方案標題</th>
                                <td>${plan.planTitle}</td>
                            </tr>
                            <tr>
                                <th scope="col">方案介紹</th>
                                <td>${plan.planIntroduction}</td>
                            </tr>
                            <tr>
                                <th scope="col">圖片2</th>
                                <td>
                                    <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures1" class="rounded mx-auto d-block" alt="方案圖片1">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">圖片2簡介</th>
                                <td>${plan.planPictureIntro1}</td>
                            </tr>
                            <tr>
                                <th scope="col">圖片3</th>
                                <td>
                                    <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures2" class="rounded mx-auto d-block" alt="方案圖片2">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">圖片3簡介</th>
                                <td>${plan.planPictureIntro2}</td>
                            </tr>
                            <tr>
                                <th scope="col">圖片4</th>
                                <td>
                                    <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures3" class="rounded mx-auto d-block" alt="方案圖片3">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">圖片4簡介</th>
                                <td>${plan.planPictureIntro3}</td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table">
                            <thead class="thead">
                            <tr>
                                <th scope="col">場地主圖片</th>
                                <th scope="col">場地標題</th>
                                <th scope="col">建議桌數區間</th>
                                <th scope="col">場地介紹</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="planDetail" items="${plan.planDetail}" begin="0" end="${plan.planDetail.size()}">
                                    <c:if test="${planDetail.placeId != null}">
                                        <tr>
                                            <td>
                                                <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${planDetail.placeId}&photoFieldName=placePicture" class="rounded mx-auto d-block" alt="場地主圖片">
                                            </td>
                                            <td>${placeService.getOne(planDetail.placeId).placeTitle}</td>
                                            <td>${placeService.getOne(planDetail.placeId).numbeOfTables}</td>
                                            <td>${placeService.getOne(planDetail.placeId).placeIntroduction}</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                        <form method="post" action="<%=request.getContextPath()%>/plan" style="margin-bottom: 0 ;">
                            <div class="col-sm-10 productAddBtn">
                                <input type="hidden" name="planProductId" value="${plan.planProductId}"/>
                                <input type="hidden" name="vendorId" value="${plan.vendorId}"/>
                                <c:if test="${plan.editStatus == 0}">
                                    <button type="submit" class="btn btn-info" name="action" value="getOneForUpdate">編輯</button>
                                </c:if>
                                <a href="<%=request.getContextPath()%>/plan?vendorId=${vendor.vendorId}"><button type="button" class="btn btn-danger">取消</button></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp" %>

<script type="text/javascript">

</script>
</body>
</html>