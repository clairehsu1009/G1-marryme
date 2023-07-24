<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="reservationList" scope="request" class="java.util.ArrayList" />




<html>


<%@include file="/front-end/vendor/common/vendorHead.jsp"%>

<body class="app sidebar-mini rtl">

    
    
    <%@include file="/front-end/header.jsp"%>
	<%@include file="/front-end/vendor/common/vendorSidebar.jsp"%>
    
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-archive">&nbsp;</i>RRR預約賞聽</h1>
            </div>
            

            
            <form method="post" action="<%=request.getContextPath()%>/reservation" style="margin-bottom: 0px;">
            <input type="hidden" name="vendorId" value="${vendorId}" />
        <ul class="app-breadcrumb breadcrumb">
            <li><button type="submit" class="btn btn-Success mr-5" name="action" value="getPlanItemInactiveList">查看已取消日期</button></li>
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/reservation?vendorId=${vendorId}">預約賞聽管理</a></li>
        </ul>
            
            
            
        </div>
        <div class="row ProductList">
            <div class="product-tab col-lg-12">
                <div class="tab-item">
                    <ul class="nav" role="tablist">
               <li><a class="active" data-toggle="tab" href="#tab-1" role="tab">預約</a></li>
<!--                     <li><a data-toggle="tab" href="#tab-1" role="tab">菜價</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-2" role="tab">婚禮企劃團隊服務</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-3" role="tab">婚禮佈置</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-4" role="tab">婚禮主持人</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-5" role="tab">婚禮小物</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-6" role="tab">其他</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-2" role="tab">預約賞聽</a></li>                      -->
                    </ul>
                </div>
                <div class="tab-item-content">
                    <div class="tab-content">
                    			<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                       			 <table class="table">
                           			<thead class="thead">
                                   
                                    <tr>
                                        <th scope="col">客戶名稱</th>
		                                <th scope="col">聯繫電話</th>
		                                <th scope="col">宴客日期</th>
		                                <th scope="col">預約日期</th>
		                                <th scope="col">備註</th>

                                    </tr>
                                  
                                </thead>
                                <tbody>
                                    <c:forEach var="reservation" items="${reservationList}" begin="0" end="${reservationList.size()}">
                                        <tr>                                        
											<td>${reservation.contactName}</td>
                                            <td>${reservation.contactNumber}</td>
                                            <td>${reservation.eventDate}</td>
                                            <td>${reservation.reservationDate}</td>
                                            <td>${reservation.reservationNotes}</td>
                                            <td>
		                                        <form method="post" action="<%=request.getContextPath()%>/reservation" style="margin-bottom: 0px;">
		                                            <input type="hidden" name="reservationId" value="${reservation.reservationId}" />
			                                            <c:if test="${reservation.status == 1}">
			                                                <button type="submit" class="btn btn-info" name="action" value="getOneForUpdate">更新</button>
			                                            </c:if>
		                                           
			                                            	<button type="submit" class="btn btn-warning" name="action" value="changeStatusToCancel">取消</button>
		                                               		
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