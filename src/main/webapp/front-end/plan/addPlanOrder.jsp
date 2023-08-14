<%@ page import="com.marryme.plan.service.impl.PlaceServiceImpl" %>
<%@ page import="com.marryme.plan.service.PlaceService" %>
<%@ page import="com.marryme.plan.service.ItemService" %>
<%@ page import="com.marryme.plan.service.impl.ItemServiceImpl" %>
<%@ page import="com.marryme.vendor.vo.Vendor" %>
<%@ page import="static com.marryme.common.CommonString.ACTIVE" %>
<%@ page import="com.marryme.plan.vo.Item" %>
<%@ page import="java.util.List" %>
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
<jsp:useBean id="placeId" scope="request" type="java.util.ArrayList" />
<jsp:useBean id="planCheckOrder" scope="request" class="com.marryme.plan.pojo.PlanCheckOrder" />
<%--<jsp:useBean id="item" scope="request" class="com.marryme.plan.vo.Item" />--%>


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
    <title>選購方案商品</title>
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
    <div class="toolbar">
<%--        <a class="ask btn_common btn_primary add_ask" href="<%=request.getContextPath()%>/plan/plan-product?vendorId=${vendorId}" rel_m_id="MktGdnBZVk82L2U0THMwOGZB" rel_s_id="17411" rel_a_id="760">立即訂購 </a>--%>
    </div>
</section>
<form METHOD="post" ACTION="<%=request.getContextPath()%>/plan/plan-order">
<c:if test="${vendorId == plan.vendorId}">
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

<%-- // TODO 預設抓會員的基本資料 --%>


    <br><br>
    <div class="content_right placeTitle">
        <h1 class="title" >可選擇的場地：</h1>
    </div>
    <table class="table">
        <thead class="thead">
        <tr>
            <th></th>
            <th scope="col">場地圖片</th>
            <th scope="col">場地標題</th>
            <th scope="col">建議桌數區間</th>
            <th scope="col" >場地介紹</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="placeIdList" items="${placeId}" begin="0" end="${placeId.size()}">
            <c:if test="${placeIdList != null}">
                <tr>
                    <td>
                        <label for="" class="col-sm-2 col-form-label">
                            <input type="radio"  id="" name="placeId" value="${placeIdList}" />
                            <span class="checkmark"></span>
                        </label>
                    </td>
                    <td>
                        <img width="200px" height="200px" src="${pageContext.request.contextPath}/ShowPhoto?placeId=${placeIdList}&photoFieldName=placePicture" class="rounded mx-auto d-block" alt="場地主圖片">
                    </td>
                    <td class="place" style="text-align: center">${placeService.getOne(placeIdList).placeTitle}</td>
                    <td style="text-align: center">${placeService.getOne(placeIdList).numbeOfTables}</td>
                    <td STYLE="text-align: left">${placeService.getOne(placeIdList).placeIntroduction}</td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <div class="content_right placeTitle">
        <h1 class="title" style="text-align: left">輸入桌數後選擇餐價：
            <input type="text" style="text-align: center" id="tables" name="tables" value="" required/>
            <span>桌</span>
        </h1>
    </div>
    <div class="tab-item-content">
        <div class="tab-content">
            <table class="table">
                <thead class="thead">
                <tr>
                    <th></th>
                    <th scope="col">項目種類</th>
                    <th scope="col">項目名稱</th>
                    <th scope="col">項目說明</th>
                    <th scope="col">訂金</th>
                    <th scope="col" class="price" style="margin-right: 20px">金額</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${itemList}" begin="0" end="${itemList.size()}">
                    <c:if test="${item.itemType == 1}">
                        <tr>
                            <td>
                                <label class="col-sm-2 col-form-label">
                                    <input type="radio" name="tablePrice" value="${item.planItemId}" data-table="${item.itemTotal}"/>
                                    <span class="checkmark"></span>
                                </label>
                            </td>
                            <td>${item.itemTypeName}</td>
                            <td>${item.itemSelect}</td>
                            <td>${item.itemDescription}</td>
                            <td>${item.itemDeposit}</td>
                            <td style="margin-right: 20px">${item.itemTotal}</td>
                        </tr>
                    </c:if>
                </c:forEach>
                <tr>
                    <td colspan="5" style="text-align: right;"><strong>總計：</strong></td>
                    <td id="totalTablesMoney" style="margin-right: 20px">0</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="content_right placeTitle">
        <h1 class="title" >可選擇的加購項目：</h1>
    </div>
    <div class="tab-item-content">
        <div class="tab-content">
            <table class="table">
                <thead class="thead">
                <tr>
                    <th></th>
                    <th scope="col">項目種類</th>
                    <th scope="col">項目名稱</th>
                    <th scope="col">項目說明</th>
                    <th scope="col">訂金</th>
                    <th scope="col" class="price" style="margin-right: 20px">金額</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${itemList}" begin="0" end="${itemList.size()}">
                    <c:if test="${item.itemType != 1}">
                        <tr>
                            <td>
                                <label class="col-sm-2 col-form-label">
                                    <input type="checkbox" name="planItemId" value="${item.planItemId}" data-money="${item.itemTotal}"/>
                                    <span class="checkmark"></span>
                                </label>
                            </td>
                            <td>${item.itemTypeName}</td>
                            <td>${item.itemSelect}</td>
                            <td>${item.itemDescription}</td>
                            <td>${item.itemDeposit}</td>
                            <td style="margin-right: 20px">
                                <span id="platformPrice">${item.itemTotal}</span>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
                <tr>
                    <td colspan="5" style="text-align: right;"><strong>總計：</strong></td>
                    <td id="totalAmount" style="margin-right: 20px">0</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</c:if>
<br><br>



<%--<div class="content_right placeTitle">--%>
<%--    <h1 class="title" style="text-align: center">訂購人資料：</h1>--%>
<%--</div>--%>
<%--<div>--%>
<%--    <p>--%>
<%--        <span>姓名：</span>--%>
<%--    </p>--%>
<%--    <p>--%>
<%--        <span>電話：</span>--%>
<%--    </p>--%>
<%--    <p>--%>
<%--        <span>地址：</span>--%>
<%--    </p>--%>
<%--</div>--%>
<br><br>
<div class="content_right placeTitle" style="text-align: center">
    <div class="ask btn_common btn_primary add_ask" style="width: 200px; border: none">
        <span>總金額： </span>
        <span id="total">0</span>
    </div>
</div>
    <br><br>
<%--<div class="content_right placeTitle">--%>
<%--    <button class="ask btn_common btn_primary add_ask" style="width: 500px; border: none;" type="submit">訂購 </button>--%>
<%--</div>--%>

    <div class="content_right placeTitle">
        <input type="hidden" name="planProductId" value="${plan.planProductId}">
        <input type="hidden" name="vendorId" value="${plan.vendorId}">
        <input type="hidden" name="unavailableDate" value="<%= request.getAttribute("unavailableDate") %>">
        <input type="hidden" name="unavailableTime" value="<%= request.getAttribute("unavailableTime") %>">
        <input type="hidden" id="totalHidden" name="total" value="">

        <button class="ask btn_common btn_primary add_ask" style="width: 500px; border: none;" type="submit" name="action" value="check">下一頁：確認訂購資訊 </button>
        <%--        <a class="ask btn_common btn_primary add_ask" style="width: 500px" type="submit"  name="action" value="insert" href="<%=request.getContextPath()%>/plan/plan-product?vendorId=${vendorId}" rel_m_id="MktGdnBZVk82L2U0THMwOGZB" rel_s_id="17411" rel_a_id="760">立即訂購 </a>--%>
        <%--  <a href="<%=request.getContextPath()%>/plan/plan-product?vendorId=${vendorId}"><button type="button" class="btn btn-danger">取消</button></a>--%>
        <%--    <button type="submit" class="btn btn-info" name="action" value="update">儲存</button>--%>
    </div>
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


    $('input[name="planItemId"]').on("change", () => {
        updateTotalAmount();
    });

    function updateTotalAmount() {
        let totalAmount = 0;
        $('input[name="planItemId"]:checked').each(function() {
            totalAmount += $(this).data("money");
        });
        $("#totalAmount").html(totalAmount);
        let total = totalAmount + $('input[name="tablePrice"]:checked').data("table") * $('#tables').val();
        $("#totalHidden").val(total);
        $("#total").html(total);
    }


    $('input[name="tablePrice"]').on("change", () => {
        updateTotalTablesMoney();
    });

    function updateTotalTablesMoney() {
        let totalTablesMoney = $('input[name="tablePrice"]:checked').data("table") * $('#tables').val();
        $("#totalTablesMoney").html(totalTablesMoney);

        let totalAmount = 0;
        $('input[name="planItemId"]:checked').each(function() {
            totalAmount += $(this).data("money");
        });
        let total = totalAmount + totalTablesMoney;
        $("#totalHidden").val(total);
        $("#total").html(total);
    }


</script>


</body>
</html>
