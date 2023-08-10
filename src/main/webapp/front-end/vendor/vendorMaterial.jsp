<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="vendorList" scope="request" class="java.util.ArrayList" />


<html>
<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp"%>
<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>


<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-archive">&nbsp;</i>廠商資料列表</h1>
        </div>
        <form method="post" action="<%=request.getContextPath()%>/vendor/vendorMaterial" >
            <input type="hidden" name="vendorId" value="${vendorId}" />
        <ul class="app-breadcrumb breadcrumb">
<!--             <li><button type="submit" class="btn btn-Success mr-5" name="action" value="getPlanItemInactiveList">查看已下架方案加購項目</button></li> -->
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/plan-item?vendorId=${vendorId}">方案加購項目管理</a></li>
        </ul>
        </form>
    </div>
    <div class="row productList" id="vendorList">
        <div class="product-tab col-lg-12 col-12">
            <div class="tab-item">
                <ul class="nav" role="tablist">
                    <li><a class="active" data-toggle="tab" href="#tab-0" role="tab">廠商</a></li>
<!--                     <li><a data-toggle="tab" href="#tab-1" role="tab">菜價</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-2" role="tab">婚禮企劃團隊服務</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-3" role="tab">婚禮佈置</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-4" role="tab">婚禮主持人</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-5" role="tab">婚禮小物</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-6" role="tab">其他</a></li> -->
                </ul>
            </div>
            <div class="tab-item-content" >
                <div class="tab-content" >
                    <div class="tab-pane fade-in active" id="tab-0" role="tabpanel">
                        <table class="table" style="padding: 10px; /* 添加內邊距 */
						  border: 1px solid #ccc; /* 添加邊框 */
						  display: inline-block; /* 設定為行內區塊元素 */" >
                            <thead class="thead">
                            <tr>
                                <th scope="col">廠商ID</th>
                                <th scope="col">品牌名稱</th>
                                <th scope="col">電話號碼</th>
                                <th scope="col">密碼</th>
                                <th scope="col">服務地區</th>
                                <th scope="col">地址</th>
                                <th scope="col">廠商類別</th>
                                <th scope="col">註冊時間</th>
                                <th scope="col">官方網址</th>
                                <th scope="col">FB</th>
                                <th scope="col">IG</th>
                                <th scope="col">統編</th>
                                <th scope="col">聯絡人</th>
                                <th scope="col">基本資料</th>
                                <th scope="col">googlemap</th>
                                <th scope="col">審核狀態</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="vendor" items="${vendorList}" begin="0" end="${vendorList.size()}" >
               
                                <tr>
                                    <td>${vendor.vendorId}</td>
                                    <td>${vendor.vendorName}</td>
                                    <td>${vendor.vendorPhone}</td>
                                    <td>${vendor.vendorPassword}</td>
                                    <td>${vendor.vendorLocation}</td>
                                    <td>${vendor.vendorAddress}</td>
                                    <td>${vendor.manufacturerCategory}</td>
                                    <td>${vendor.vendorRegistrationTime}</td>
                                    <td>${vendor.vendorWebsite}</td>
                                    <td>${vendor.vendorFb}</td>
                                    <td>${vendor.vendorIg}</td>
                                    <td>${vendor.companyId}</td>
                                    <td>${vendor.contactPerson}</td>
                                    <td>${vendor.basicIntroduction}</td>
                                    <td>${vendor.googlemap}</td>
                                    <td>${vendor.vendorStatus}</td>
                                    <td>
                                        <form method="post" action="<%=request.getContextPath()%>/vendor/vendorMaterial" style="margin-bottom: 0px;">
                                            <input type="hidden" name="vendorId" value="${vendor.vendorId}" />
<%--                                             <c:if test="${item.editStatus == 0}"> --%>
<!--                                                 <button type="submit" class="btn btn-info" name="action" value="getOneForUpdate">編輯</button> -->
<%--                                             </c:if> --%>
                                            <button type="submit" href="${pageContext.request.contextPath}/front-end/vendor/vendorBasicinformation.jsp" class="btn btn-warning" name="action" value="changeStatusToInactive">下架</button>
                                        </form>
                                    </td>
                                </tr>
                            
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                 </div> 
                </div>
            </div>
       </div>
   

</main>
<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>


</body>
</html>