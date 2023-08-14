
<%@ page import="com.marryme.plan.service.impl.PlaceServiceImpl" %>
<%@ page import="com.marryme.plan.service.PlaceService" %>
<%@ page import="com.marryme.plan.service.ItemService" %>
<%@ page import="com.marryme.plan.service.impl.ItemServiceImpl" %>
<%@ page import="static com.marryme.common.CommonString.ACTIVE" %>
<%@ page import="com.marryme.plan.vo.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="com.marryme.vendor.vo.Vendor" %>
<%--
  Created by IntelliJ IDEA.
  User: T14 Gen 3
  Date: 2023/7/31
  Time: 下午 03:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="plan" scope="request" class="com.marryme.plan.vo.Plan" />
<jsp:useBean id="place" scope="request" class="com.marryme.plan.vo.Place" />
<%--<jsp:useBean id="item" scope="request" class="com.marryme.plan.vo.Item" />--%>
<jsp:useBean id="unavailableDate" scope="request" class="com.marryme.plan.vo.UnavailableDates"/>

<%
  PlaceService placeService = new PlaceServiceImpl();
  request.setAttribute("placeService", placeService);

  ItemService itemService = new ItemServiceImpl();
  List<Item> itemList = itemService.findAllVendorIdAndOrderByType(plan.getVendorId(), ACTIVE);
  pageContext.setAttribute("itemList", itemList);

%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Marry Me</title>
  <link rel="icon" href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico" type="image/x-icon">

  <!-- Css Styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/style.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/product_rate.css" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/product/css/product_detail.css" type="text/css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.min.css">

  <style>
    .content_left {
      width: 56%;
      padding-right: 30px;
      padding-left: 30px;
      box-sizing: border-box;
      margin-right: 0;
    }
    .table th, .table td {
      text-align: center;
      padding-left: 40px;
      padding-right: 20px;
      box-sizing: border-box;
      vertical-align: middle;
    }
    .placeTitle{
      text-align: left;
      color: #B766AD;
    }
  </style>
  <title>方案商品</title>
</head>

<body>

<%@include file="/front-end/header.jsp"%>

<div class="rwd_wrap group">
  <div class="col lg_12 md_6 sm_12">
    <ol itemscope itemtype="http://schema.org/BreadcrumbList" class="bread_list">
      <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a itemprop="item" href="#" title="Marryme首頁"> <span itemprop="name">首頁</span></a><meta itemprop="position" content="1"></li>
      <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><span itemprop="name">瀏覽方案頁</span><meta itemprop="position" content="2" /></li>
      <li><span itemprop="name">${product.productName}</span><meta itemprop="position" content="3" /></li>
    </ol>
  </div>
</div>
<section class="rwd_wrap profile_detail">
  <div class="info">
    <div class="detail">
      <div class="name">
        <h2>
          瀏覽方案頁
        </h2>
      </div>
      <div>
        <a class="evaluate" href="#"><span class="bg_star"></span> 5.0&nbsp;<span class="counts" id="evaluate_counts_basic">(39)</span></a>
      </div>
    </div>
  </div>
<%--  <div class="toolbar">--%>
<%--    <a class="ask btn_common btn_primary add_ask" href="<%=request.getContextPath()%>/plan/plan-order?planProductId=${plan.planProductId}">立即訂購 </a>--%>
<%--  </div>--%>
</section>
  <section class="rwd_wrap group">
    <div class="favor_content">
      <div class="content_left">
          <img width="80%" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPicture" class="rounded mx-auto d-block" alt="方案主圖片">
      </div>
      <div class="content_right">
        <h1 class="title">${plan.planTitle}</h1>
        <br>
        <p></p>
        <br><br>
          <div class="d_line">
            <br><br><br>
            <h2 class="title text-center">方案介紹</h2>
            <br><br>
              <p>${plan.planIntroduction}</p>
            <br><br><br><br>
              <form METHOD="get" ACTION="<%=request.getContextPath()%>/plan/plan-order">
                <p style="text-align: center" >
                  <label for="unavailableDate">結婚日期為: </label>
                  <input type="date" id="unavailableDate" name="unavailableDate" min="<%= java.time.LocalDate.now() %>" />
                  <c:if test="${responseMsgMap.containsKey('unavailableDate')}">
                    <span class="errorMsg">${responseMsgMap['unavailableDate']}</span>
                  </c:if>
                  <label for="unavailableTime">時段: </label>
                  <select id="unavailableTime" name="unavailableTime">
                  </select>
                  <c:if test="${responseMsgMap.containsKey('unavailableTime')}">
                    <span class="errorMsg">${responseMsgMap['unavailableTime']}</span>
                  </c:if>
                </p>
            <br><br><br><br>
              <input type="hidden" name="planProductId" value="${plan.planProductId}">
              <input type="hidden" name="unavailableDate" value="${unavailableDate.unavailableDate}">
              <input type="hidden" name="unavailableTime" value="${unavailableDate.unavailableTime}">
              <input type="hidden" name="vendorId" value="${plan.vendorId}">
              <button type="submit" class="ask btn_common btn_primary add_ask btn_wrap" style="width: 500px; border: none; padding-left: 0">立即訂購 </button>
             </form>
          </div>
      </div>
      <br><br><br>
    </div>
      <div class="content_right placeTitle">
        <h1 class="title" >可選擇的場地：</h1>
      </div>
      <table class="table">
        <thead class="thead">
          <tr>
            <th scope="col">場地圖片</th>
            <th scope="col">場地標題</th>
            <th scope="col">建議桌數區間</th>
            <th scope="col" >場地介紹</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="planDetail" items="${plan.planDetail}" begin="0" end="${plan.planDetail.size()}">
            <c:if test="${planDetail.placeId != null}">
              <tr>
                <td>
                  <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${planDetail.placeId}&photoFieldName=placePicture" class="rounded mx-auto d-block" alt="場地主圖片">
                </td>
                <td class="place" style="text-align: center">${placeService.getOne(planDetail.placeId).placeTitle}</td>
                <td style="text-align: center">${placeService.getOne(planDetail.placeId).numbeOfTables}</td>
                <td STYLE="text-align: left">${placeService.getOne(planDetail.placeId).placeIntroduction}</td>
              </tr>
            </c:if>
          </c:forEach>
        </tbody>
      </table>

    <div class="content_right placeTitle">
      <h1 class="title" >可選擇的加購項目：</h1>
    </div>
      <div class="tab-item-content">
        <div class="tab-content">
            <table class="table">
              <thead class="thead">
                <tr>
                  <th scope="col">項目種類</th>
                  <th scope="col">項目名稱</th>
                  <th scope="col">項目說明</th>
                  <th scope="col">訂金</th>
                  <th scope="col" style="margin-right: 20px">金額</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="item" items="${itemList}" begin="0" end="${itemList.size()}">
                  <tr>
                    <td>${item.itemTypeName}</td>
                    <td>${item.itemSelect}</td>
                    <td>${item.itemDescription}</td>
                    <td>${item.itemDeposit}</td>
                    <td style="margin-right: 20px">${item.itemTotal}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
         </div>
      </div>
  </section>
<br><br>
<form METHOD="get" ACTION="<%=request.getContextPath()%>/plan/plan-order">
    <input type="hidden" name="planProductId" value="${plan.planProductId}">
    <input type="hidden" name="unavailableDate" value="${unavailableDate.unavailableDate}">
    <input type="hidden" name="unavailableTime" value="${unavailableDate.unavailableTime}">
    <input type="hidden" name="vendorId" value="${plan.vendorId}">
    <button class="ask btn_common btn_primary add_ask" style="width: 500px; border: none;" type="submit">立即訂購 </button>
</form>

<br><br><br><br>

<!-- Footer Section Begin -->
<%@include file="/front-end/footer.jsp"%>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.bundle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/marryme.js"></script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/front-end/product/js/productDetail.js"></script>--%>
<!-- 載入 Bootstrap 5 的 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<!-- 引入SweetAlert2的JS程式碼 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.all.min.js"></script>

<script>

  $("#unavailableDate").change(() => {
    generateTimeOptions();
  })

  function generateTimeOptions() {
    const unavailableTime = document.getElementById('unavailableTime');
    const unavailableDate = new Date(document.getElementById('unavailableDate').value);
    const currentDate = new Date();

    // 清空下拉式選單中的選項
    unavailableTime.innerHTML = '';
    if (unavailableDate.toDateString() === currentDate.toDateString()) {

      // 若選擇日期與當前日期相同，則限制選項為中午或晚上
      const currentHour = currentDate.getHours();
      if (currentHour < 12) {
        const option = document.createElement('option');
        option.text = '中午';
        option.value = '0';
        unavailableTime.add(option);
      } else {
        const option = document.createElement('option');
        option.text = '晚上';
        option.value = '1';
        unavailableTime.add(option);
      }
    } else {
      // 若選擇日期不是當前日期，則提供完整的時段選項
      const optionNoon = document.createElement('option');
      optionNoon.text = '中午';
      optionNoon.value = '0';
      unavailableTime.add(optionNoon);

      const optionNight = document.createElement('option');
      optionNight.text = '晚上';
      optionNight.value = '1';
      unavailableTime.add(optionNight);
    }
  }


</script>

</body>
</html>
