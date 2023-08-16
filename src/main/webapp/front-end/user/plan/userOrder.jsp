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
<jsp:useBean id="itemList" scope="request" class="java.util.ArrayList" />
<jsp:useBean id="planCheckOrder" scope="request" class="com.marryme.plan.pojo.PlanCheckOrder" />
<jsp:useBean id="orderList" scope="request" class="java.util.ArrayList" />
<jsp:useBean id="planOrderList" scope="request" class="com.marryme.plan.vo.PlanOrder" />
<jsp:useBean id="planOrderDetail" scope="request" class="com.marryme.plan.vo.PlanOrderDetail" />

<jsp:useBean id="items" scope="request" class="java.util.ArrayList" />

<%
  PlanService planService = new PlanServiceImpl();
  request.setAttribute("planService", planService);

  PlaceService placeService = new PlaceServiceImpl();
  request.setAttribute("placeService", placeService);

  ItemService itemService = new ItemServiceImpl();
  request.setAttribute("itemService", itemService);

  request.getAttribute("memberId");
  request.getAttribute("unavailableDate");

  OrderService orderService = new OrderServiceImpl();
  request.setAttribute("orderService", orderService);

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
      <input type="hidden" name="memberId" value="${memberId}" />
      <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
        <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/plan-order?memberId=${memberId}">訂單管理</a></li>
      </ul>
    </form>
  </div>
  <%--  <c:if test="${plan.vendorId} == ${vendorId}">--%>
  <div class="row productList" id="productList">
    <div class="product-tab col-lg-12 col-12">
      <div class="tab-item">
        <ul class="nav" role="tablist">
          <li><a class="active" data-toggle="tab" href="#tab-0" role="tab">結婚明細</a></li>
          <%--          <li><a class="active" data-toggle="tab" href="#tab-1" role="tab">上架中</a></li>--%>
        </ul>
      </div>
      <c:forEach var="order" items="${orderList}" begin="0" end="${orderList.size()}">
      <div class="tab-item-content">
        <div class="tab-content">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">廠商</th>
                <th scope="col">您的方案</th>
                <th scope="col">方案標題</th>
                <th scope="col">方案介紹</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="font-size: 15px">${orderService.getOneByVendorId(order.vendorId)}</td>
                <td>
                  <img width="50%" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${order.planProductId}&photoFieldName=planPicture" class="rounded mx-auto d-block" alt="方案主圖片">
                </td>
                <td>${planService.getOne(order.planProductId).planTitle}</td>
                <td>${planService.getOne(order.planProductId).planIntroduction}</td>
              </tr>
            </tbody>
            <thead>
              <tr>
                <th></th>
                <th scope="col">您的場地</th>
                <th scope="col">場地標題</th>
                <th scope="col" >場地介紹</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td></td>
                <td>
                  <img width="50%" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${order.placeId}&photoFieldName=placePicture" class="rounded mx-auto d-block" alt="場地主圖片">
                </td>
                <td>${placeService.getOne(order.placeId).placeTitle}</td>
                <td>${placeService.getOne(order.placeId).placeIntroduction}</td>
              </tr>
            </tbody>
            <thead>
              <tr>
                <th></th>
                <th scope="col" >您的預約日期</th>
                <th scope="col" >您的預約時段</th>
                <th scope="col" >您的桌數</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td></td>
                <td>${unavailableDate.unavailableDate}</td>
                <td class="time-cell">${unavailableDate.unavailableTime}</td>
                <td>${order.orderTables}</td>
              </tr>
            </tbody>
              <thead>
                <tr>
                  <th scope="col">加購項目種類</th>
                  <th scope="col">項目名稱</th>
                  <th scope="col">項目說明</th>
                  <th scope="col">單價</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="item" items="${items}" begin="0" end="${items.size()}">
              <tr>
                <td>${item.itemTypeName}</td>
                <td>${item.itemSelect}</td>
                <td>${item.itemDescription}</td>
                <td>
                  $ <fmt:formatNumber value="${item.itemTotal}" type="number" pattern="#,##0" />
                </td>
              </tr>
              </c:forEach>
              <tr>
                <td></td>
                <td></td>
                <th scope="col" >總金額</th>
                <td>
                  $ <fmt:formatNumber value="${order.totalAmount}" type="number" pattern="#,##0" />
                </td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <th scope="col" style="width: 120px">訂單成立時間</th>
                <td>${order.orderDateTime}</td>
              </tr>
              </tbody>
          </table>
        </div>
      </div>
      </c:forEach>

</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script>
  $(document).ready(function() {
    $('.time-cell').each(function() {
      var timeValue = $(this).text();
      if (timeValue === '0') {
        $(this).text('中午');
      } else if (timeValue === '1') {
        $(this).text('晚上');
      }
    });
  });



</script>




</body>

</html>