<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="planList" scope="request" class="java.util.ArrayList" />

<html>
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<style>
    table th {
        white-space: nowrap;
    }
</style>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-archive">&nbsp;</i>方案商品</h1>
        </div>
        <form method="post" action="<%=request.getContextPath()%>/plan" style="margin-bottom: 0;">
            <input type="hidden" name="vendorId" value="${vendorId}" />
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/plan?vendorId=${vendorId}">方案管理</a></li>
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
                                    <th scope="col">方案主圖片</th>
                                    <th scope="col">方案標題</th>
                                    <th scope="col">方案介紹</th>
                                    <th scope="col">圖片1</th>
                                    <th scope="col">簡介</th>
                                    <th scope="col">圖片2</th>
                                    <th scope="col">簡介</th>
                                    <th scope="col">圖片3</th>
                                    <th scope="col">簡介</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="plan" items="${planList}" begin="0" end="${planList.size()}">
                                    <c:if test="${plan.status == loop.index}">
                                        <tr>
                                            <td>
                                                <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPicture" class="rounded mx-auto d-block" alt="方案主圖片">
                                            </td>
                                            <td>${plan.planTitle}</td>
                                            <td>${plan.planIntroduction}</td>
                                            <td>
                                                <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures1" class="rounded mx-auto d-block" alt="方案圖片1">
                                            </td>
                                            <td>${plan.planPictureIntro1}</td>
                                            <td>
                                                <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures2" class="rounded mx-auto d-block" alt="方案圖片2">
                                            </td>
                                            <td>${plan.planPictureIntro2}</td>
                                            <td>
                                                <img width="50px" height="50px" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPictures3" class="rounded mx-auto d-block" alt="方案圖片3">
                                            </td>
                                            <td>${plan.planPictureIntro3}</td>
                                            <td>
                                                <form method="post" action="<%=request.getContextPath()%>/plan" style="margin-bottom: 0 ;">
                                                    <input type="hidden" name="planProductId" value="${plan.planProductId}" />
                                                    <input type="hidden" name="vendorId" value="${plan.vendorId}" />
                                                    <button type="submit" class="btn btn-info" name="action" value="getOne">查看</button>
                                                    <c:if test="${loop.index == 1}">
                                                    <button type="submit" class="btn btn-warning" name="action" value="changeStatusToInactive">下架</button>
                                                    </c:if>
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