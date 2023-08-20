<%@ page import="com.marryme.plan.service.impl.ItemServiceImpl" %>
<%@ page import="com.marryme.plan.service.impl.PlaceServiceImpl" %>
<%@ page import="com.marryme.plan.service.ItemService" %>
<%@ page import="com.marryme.plan.service.impl.PlanServiceImpl" %>
<%@ page import="com.marryme.plan.service.PlaceService" %>
<%@ page import="com.marryme.plan.service.PlanService" %>
<%@ page import="com.marryme.plan.service.OrderService" %>
<%@ page import="com.marryme.plan.service.impl.OrderServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="placeList" scope="request" class="java.util.ArrayList" />
<jsp:useBean id="plan" scope="request" class="com.marryme.plan.vo.Plan" />
<jsp:useBean id="place" scope="request" class="com.marryme.plan.vo.Place" />
<jsp:useBean id="item" scope="request" class="com.marryme.plan.vo.Item" />
<jsp:useBean id="planCheckOrder" scope="request" class="com.marryme.plan.pojo.PlanCheckOrder" />
<jsp:useBean id="orderList" scope="request" class="java.util.ArrayList" />
<jsp:useBean id="planOrderList" scope="request" class="com.marryme.plan.vo.PlanOrder" />
<jsp:useBean id="planOrderDetail" scope="request" class="com.marryme.plan.vo.PlanOrderDetail" />

<%
  PlanService planService = new PlanServiceImpl();
  request.setAttribute("planService", planService);

  PlaceService placeService = new PlaceServiceImpl();
  request.setAttribute("placeService", placeService);

  ItemService itemService = new ItemServiceImpl();
//  List<Item> itemList = itemService.findAllVendorIdAndOrderByType(plan.getVendorId(), ACTIVE);

  request.setAttribute("itemService", itemService);

  request.getAttribute("memberId");

%>

<html>
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>

<main class="app-content">
  <div class="app-title">
    <div>
      <h1><i class="fa fa-archive">&nbsp;</i>我的結婚訂單</h1>
    </div>
    <form method="post" action="<%=request.getContextPath()%>/plan-order" style="margin-bottom: 0;">
      <input type="hidden" name="vendorId" value="${vendorId}" />
      <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
        <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/plan-order?vendorId=${vendorId}">訂單管理</a></li>
      </ul>
    </form>
  </div>
  <div class="row productList" id="productList">
    <div class="product-tab col-lg-12 col-12">
      <div class="tab-item">
        <ul class="nav" role="tablist">
          <li><a class="active" data-toggle="tab" href="#tab-0" role="tab">結婚明細</a></li>
        </ul>
      </div>
      <div class="tab-item-content">
        <div class="tab-content">
          <table class="table">
            <thead class="thead">
            <tr>
              <th scope="col">會員</th>
              <th scope="col">方案主圖片</th>
              <th scope="col">方案標題</th>
              <th scope="col">方案介紹</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
          <c:forEach var="order" items="${orderList}" begin="0" end="${orderList.size()}">
            <tr>
              <td>${order.memberId}</td>
              <td>
                <img width="50%" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${order.planProductId}&photoFieldName=planPicture" class="rounded mx-auto d-block" alt="方案主圖片">
              </td>
              <td>${planService.getOne(order.planProductId).planTitle}</td>
              <td>${planService.getOne(order.planProductId).planIntroduction}</td>
                <td>
                    <button class="btn btn-info">查看</button>
                </td>

            </tr>
          </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
        </div>
      </div>



</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>


</body>
</html>