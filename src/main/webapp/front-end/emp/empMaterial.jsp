<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="empList" scope="request" class="java.util.ArrayList" />

<html>
<%@include file="/front-end/user/common/userHead.jsp"%>

<body class="app sidebar-mini rtl">
<%@include file="/front-end/header.jsp" %>
<%@include file="/front-end/user/common/userSidebar.jsp" %>


<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-archive">&nbsp;</i>員工資料列表</h1>
        </div>
        <form method="post" action="<%=request.getContextPath()%>/emp/empMaterial.jsp" style="margin-bottom: 0px;">
            <input type="hidden" name="vendorId" value="${vendorId}" />
        <ul class="app-breadcrumb breadcrumb">
            <li><button type="submit" class="btn btn-Success mr-5" name="action" value="getPlanItemInactiveList">查看已下架方案加購項目</button></li>
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/plan-item?vendorId=${vendorId}">方案加購項目管理</a></li>
        </ul>
        </form>
    </div>
    <div class="row productList" id="EmpList">
        <div class="product-tab col-lg-12 col-12">
            <div class="tab-item">
                <ul class="nav" role="tablist">
                    <li><a class="active" data-toggle="tab" href="#tab-0" role="tab">員工</a></li>
<!--                     <li><a data-toggle="tab" href="#tab-1" role="tab">菜價</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-2" role="tab">婚禮企劃團隊服務</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-3" role="tab">婚禮佈置</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-4" role="tab">婚禮主持人</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-5" role="tab">婚禮小物</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-6" role="tab">其他</a></li> -->
                </ul>
            </div>
            <div class="tab-item-content">
                <div class="tab-content">
                    <div class="tab-pane fade-in active" id="tab-0" role="tabpanel">
                        <table class="table">
                            <thead class="thead">
                            <tr>
                                <th scope="col">員工ID</th>
                                <th scope="col">姓名</th>
                                <th scope="col">電話號碼</th>
                                <th scope="col">信箱</th>
                                <th scope="col">密碼</th>
                                <th scope="col">地址</th>
                                <th scope="col">性別</th>
                                <th scope="col">生日</th>
                                <th scope="col">到職日</th>
                                <th scope="col">在職狀態</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="emp" items="${empList}" begin="0" end="${empList.size()}" >
               
                                <tr>
                                    <td>${emp.empId}</td>
                                    <td>${emp.empName}</td>
                                    <td>${emp.empPhone}</td>
                                    <td>${emp.empEmail}</td>
                                    <td>${emp.empPassword}</td>
                                    <td>${emp.empAddress}</td>
                                    <td>${emp.empGender}</td>
                                    <td>${emp.birthday}</td>
                                    <td>${emp.hiredate}</td>
                                    <td>${emp.empStatus}</td>
                                    <td>
                                        <form method="post" action="<%=request.getContextPath()%>/emp/empMaterial" style="margin-bottom: 0px;">
                                            <input type="hidden" name="empId" value="${emp.empId}" />
<%--                                             <c:if test="${item.editStatus == 0}"> --%>
<!--                                                 <button type="submit" class="btn btn-info" name="action" value="getOneForUpdate">編輯</button> -->
<%--                                             </c:if> --%>
                                            <button type="submit" class="btn btn-warning" name="action" value="changeStatusToInactive">下架</button>
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