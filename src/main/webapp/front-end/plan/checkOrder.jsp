<%@ page import="com.marryme.plan.service.impl.PlaceServiceImpl" %>
<%@ page import="com.marryme.plan.service.PlaceService" %>
<%@ page import="com.marryme.plan.service.ItemService" %>
<%@ page import="com.marryme.plan.service.impl.ItemServiceImpl" %>
<%@ page import="com.marryme.vendor.vo.Vendor" %>
<%@ page import="static com.marryme.common.CommonString.ACTIVE" %>
<%@ page import="com.marryme.plan.vo.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="com.marryme.plan.service.PlanService" %>
<%@ page import="com.marryme.plan.service.impl.PlanServiceImpl" %>
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
<jsp:useBean id="itemList" scope="request" type="java.util.ArrayList" />
<jsp:useBean id="planCheckOrder" scope="request" class="com.marryme.plan.pojo.PlanCheckOrder" />
<jsp:useBean id="planOrder" scope="request" class="com.marryme.plan.vo.PlanOrder" />

<%
  PlanService planService = new PlanServiceImpl();
  request.setAttribute("planService", planService);

  PlaceService placeService = new PlaceServiceImpl();
  request.setAttribute("placeService", placeService);

  ItemService itemService = new ItemServiceImpl();
//  List<Item> itemList = itemService.findAllVendorIdAndOrderByType(plan.getVendorId(), ACTIVE);
  request.setAttribute("itemService", itemService);

  //TODO 之後這邊要改取得登入會員的ID 才是正確的
  String memberId = "member1@gmail.com";
  request.setAttribute("memberId", memberId);

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
  <title>確認訂購內容並結帳</title>
</head>

<body>

<%@include file="/front-end/header.jsp"%>

<div class="rwd_wrap group">
  <div class="col lg_12 md_6 sm_12">
    <ol itemscope itemtype="http://schema.org/BreadcrumbList" class="bread_list">
      <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a itemprop="item" href="#" title="Marryme首頁"> <span itemprop="name">首頁</span></a><meta itemprop="position" content="1"></li>
      <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><span itemprop="name">瀏覽方案頁</span><meta itemprop="position" content="2" /></li>
<%--      TODO 放VendorName--%>
<%--      <li><span itemprop="name">${product.productName}</span><meta itemprop="position" content="3" /></li>--%>
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
  <div class="toolbar">
    <%--        <a class="ask btn_common btn_primary add_ask" href="<%=request.getContextPath()%>/plan/plan-product?vendorId=${vendorId}" rel_m_id="MktGdnBZVk82L2U0THMwOGZB" rel_s_id="17411" rel_a_id="760">立即訂購 </a>--%>
  </div>
</section>
<form METHOD="post" ACTION="<%=request.getContextPath()%>/plan/plan-order" >
<div class="content_right placeTitle">
  <h1 class="title" style="text-align: center">請確認方案商品明細：</h1>
</div>
  <table class="table">
    <thead class="thead">
    <tr>
      <th scope="col">方案主圖片</th>
      <th scope="col">方案標題</th>
      <th scope="col">方案介紹</th>
      <th></th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>
        <img width="50%" src="${pageContext.request.contextPath}/ShowPhoto?planProductId=${plan.planProductId}&photoFieldName=planPicture" class="rounded mx-auto d-block" alt="方案主圖片">
      </td>
      <td>${plan.planTitle}</td>
      <td>${plan.planIntroduction}</td>
      <td></td>
    </tr>
    </tbody>
  </table>
  <br><br>
  <div class="content_right placeTitle">
    <h1 class="title" style="text-align: center">場地</h1>
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
        <tr>
          <td>
            <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${place.placeId}&photoFieldName=placePicture" class="rounded mx-auto d-block" alt="場地主圖片">
          </td>
          <td class="place" style="text-align: center">${place.placeTitle}</td>
          <td style="text-align: center">${place.numbeOfTables}</td>
          <td STYLE="text-align: left">${place.placeIntroduction}</td>
        </tr>
    </tbody>
  </table>
  <br><br>
  <div class="content_left placeTitle">
    <h1 class="title" style="text-align: center; font-size: 25px">
      婚宴餐價：
      <span style="font-size: 23px">
        <c:out value="${planCheckOrder.orderTables}" />
        桌 x $<c:out value="${itemService.getOne(planCheckOrder.tablePrice).itemTotal}" />
        / (桌數x單價)
      </span>
    </h1>
    <br><br><br><br>
    <h1 class="title" style="text-align: center; font-size: 20px; margin-left: 30px">
      您的加購項目如下：
    </h1>
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
          <th scope="col" class="price" style="margin-right: 20px">金額</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${itemList}" >
          <c:if test="${planCheckOrder.planItemId.contains(item.planItemId)}" >
            <input type="hidden" name="planItemId" value="${planCheckOrder.tablePrice}">
          <c:if test="${item.itemType != 1}">
            <input type="hidden" name="planItemId" value="${item.planItemId}">
            <tr>
              <td>${item.itemTypeName}</td>
              <td>${item.itemSelect}</td>
              <td>${item.itemDescription}</td>
              <td>${item.itemDeposit}</td>
              <td style="margin-right: 20px">
                <span id="platformPrice">${item.itemTotal}</span>
              </td>
            </tr>
          </c:if>
          </c:if>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
<br><br>
<div class="content_left placeTitle">
  <h1 class="title" style="text-align: center; font-size: 35px; margin-left: 30px">付款資訊</h1>
  <div class="input-group mb-3">
    <label for="pay_card" class="input-group-text" id="basic-addon2">信用卡號</label>
    <input name="pay_card" id="pay_card" type="text" class="form-control" placeholder="1111 2222 3333 4444" aria-label="cardNumber" aria-describedby="basic-addon2">
  </div>
  <div class="input-group mb-3">
    <label for="pay_exp" class="input-group-text" id="basic-addon3">有效期限</label>
    <input name="pay_exp" id="pay_exp" type="text" class="form-control" placeholder="MM/YY" aria-label="date" aria-describedby="basic-addon3">
  </div>
  <div class="input-group mb-3">
    <label for="pay_code" class="input-group-text" id="basic-addon4">CVC / CCV</label>
    <input name="pay_code" id="pay_code" type="text" class="form-control" placeholder="000" aria-label="code" aria-describedby="basic-addon4">
  </div>
</div>

<br><br>
<div class="content_right placeTitle" style="text-align: center">
  <div class="ask btn_common btn_primary add_ask" style="width: 200px; border: none">
    <span>總金額： </span>
    <span id="total">${planCheckOrder.total}</span>
  </div>
</div>
<br><br>


  <div class="content_right placeTitle">
    <input type="hidden" name="planProductId" value="${plan.planProductId}">
    <input type="hidden" name="vendorId" value="${plan.vendorId}">
    <c:set var="memberId" value="member1@gmail.com" scope="request" />
    <input type="hidden" name="memberId" value="${memberId}">
    <input type="hidden" name="placeId" value="${place.placeId}">
    <input type="hidden" name="unavailableDate" value="${planCheckOrder.unavailableDate}">
    <input type="hidden" name="unavailableTime" value="${planCheckOrder.unavailableTime}">
    <input type="hidden" name="orderTables" value="${planCheckOrder.orderTables}">
    <input type="hidden" name="total" value="${planCheckOrder.total}">

    <button class="ask btn_common btn_primary add_ask" id="submit" style="width: 500px; border: none;" type="submit" name="action" value="insert" href="<%=request.getContextPath()%>/plan/plan-order?vendorId=${vendorId}">確認付款 </button>
  </div>
</form>
<br><br><br><br>

<%@include file="/front-end/footer.jsp"%>



<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.bundle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/marryme.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.7/dist/sweetalert2.all.min.js"></script>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

<script>


  $("#submit").click(function() { //綁定sumbit提交訂單按鈕，添加點擊事件
    var num = /^\d*$/; //全數字
    var title = $.trim($("#pay_card").val());

    if (title == "") {
      Swal.fire({
        icon: 'error',
        title: '請輸入信用卡卡號！',
        text: '請稍後再試。',
      });
      return false;
    }
    if (title.length != 16 || !num.exec(title)) {
      Swal.fire({
        icon: 'error',
        title: '信用卡卡號長度必須為16位且為數字！',
        text: '請稍後再試。',
      });
      return false;
    }
    var exp = $.trim($("#pay_exp").val());
    if (exp == "") {  //為空
      Swal.fire({
        icon: 'error',
        title: '請輸入信用卡有效期限！',
        text: '請稍後再試。',
      });
      return false;
    }
    var currentDate = new Date();
    var currentYear = currentDate.getFullYear();
    var currentMonth = currentDate.getMonth() + 1; // 注意：JavaScript 的月份是從 0 開始計算的，所以需要加 1

    var expParts = exp.split('/');
    var expMonth = parseInt(expParts[0]);
    var expYear = parseInt("20" + expParts[1]);

    if (expParts.length !== 2 || isNaN(expMonth) || isNaN(expYear)) {
      Swal.fire({
        icon: 'error',
        title: '信用卡有效期限格式不正確！',
        text: '請輸入正確的 MM/YY 格式。',
      });
      return false;
    }

    if (expYear < currentYear || (expYear === currentYear && expMonth < currentMonth)) {
      Swal.fire({
        icon: 'error',
        title: '信用卡有效期限已過期！',
        text: '請輸入有效的日期。',
      });
      return false;
    }



    var cvv = $.trim($("#pay_code").val());
    if (cvv == "") {  //為空
      Swal.fire({
        icon: 'error',
        title: '請輸入信用卡背面末三碼(檢查碼)！',
        text: '請稍後再試。',
      });
      return false;
    }
    if (cvv.length != 3 || !num.exec(cvv)) {
      Swal.fire({
        icon: 'error',
        title: '信用卡背面末三碼(檢查碼)長度必須為3位且為數字！',
        text: '請稍後再試。',
      });
      return false;
    }
  })





</script>


</body>
</html>
