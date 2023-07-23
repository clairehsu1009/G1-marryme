<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="itemInactiveList" scope="request" class="java.util.ArrayList" />


<html>
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-archive">&nbsp;</i>已下架-方案加購項目</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/plan-item?vendorId=${vendorId}">方案加購項目管理</a></li>
        </ul>
    </div>
    <div class="row productList" id="productList">
        <div class="product-tab col-lg-12 col-12">
            <div class="tab-item">
                <ul class="nav" role="tablist">
                    <li><a class="active" data-toggle="tab" href="#tab-0" role="tab">試菜</a></li>
                    <li><a data-toggle="tab" href="#tab-1" role="tab">菜價</a></li>
                    <li><a data-toggle="tab" href="#tab-2" role="tab">婚禮企劃團隊服務</a></li>
                    <li><a data-toggle="tab" href="#tab-3" role="tab">婚禮佈置</a></li>
                    <li><a data-toggle="tab" href="#tab-4" role="tab">婚禮主持人</a></li>
                    <li><a data-toggle="tab" href="#tab-5" role="tab">婚禮小物</a></li>
                    <li><a data-toggle="tab" href="#tab-6" role="tab">其他</a></li>
                </ul>
            </div>
            <div class="tab-item-content">
                <div class="tab-content">
                    <c:forEach begin="0" end="6" varStatus="loop">
                        <c:set var="activeClass" value="${loop.index == 0 ? 'active' : ''}" />
                    <div class="tab-pane fade-in ${activeClass}" id="tab-${loop.index}" role="tabpanel">
                        <table class="table">
                            <thead class="thead">
                            <tr>
                                <th scope="col">項目種類</th>
                                <th scope="col">項目名稱</th>
                                <th scope="col">項目說明</th>
                                <th scope="col">訂金</th>
                                <th scope="col">金額</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${itemInactiveList}" begin="0" end="${itemInactiveList.size()}" >
                                <c:if test="${item.itemType == loop.index}">
                                <tr>
                                    <td>${item.itemTypeName}</td>
                                    <td>${item.itemSelect}</td>
                                    <td>${item.itemDescription}</td>
                                    <td>${item.itemDeposit}</td>
                                    <td>${item.itemTotal}</td>
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