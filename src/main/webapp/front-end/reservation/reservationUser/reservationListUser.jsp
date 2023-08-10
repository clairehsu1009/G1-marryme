<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="reservationList" scope="request" class="java.util.ArrayList" />




<html>



<%@include file="/front-end/user/common/userHead.jsp"%>

<body class="app sidebar-mini rtl">

    
    
    <%@include file="/front-end/header.jsp"%>
	<%@include file="/front-end/user/common/userSidebar.jsp" %>
    
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-archive">&nbsp;</i>RRR預約賞聽</h1>
            </div>
            

            
            <form method="post" action="<%=request.getContextPath()%>/reservationUser" style="margin-bottom: 0px;">
            <input type="hidden" name="memberId" value="${memberId}" />
        <ul class="app-breadcrumb breadcrumb">
            <li><button type="submit" class="btn btn-Success mr-5" name="action" value="getPlanItemInactiveList">查看已取消日期</button></li>
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/reservationUser?memberId=${memberId}">預約賞聽管理</a></li>
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
                                        <th scope="col">廠商名稱</th>
		                                <th scope="col">聯繫電話</th>
		                                <th scope="col">宴客日期</th>
		                                <th scope="col">預約日期</th>
		                                <th scope="col">備註</th>

                                    </tr>
                                  
                                </thead>
                                <tbody>
									    <c:forEach var="currentVendor" items="${currentVendorList}">
										    <tr>
										        <td>${currentVendor[0]}</td> <!-- vendor_name -->
										        <td>${currentVendor[1]}</td> <!-- vendor_phone -->
										   

	 							
                                             <td>
                                             	<fmt:formatDate value="${currentVendor[2]}" pattern="yyyy/MM/dd" />
                                             	
												<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
												<fmt:formatDate value="${currentVendor[2]}" pattern="HH:mm:ss" var="formattedEventTime" />
												
												<c:if test="${formattedEventTime eq '12:00:00'}">中午</c:if>
												<c:if test="${formattedEventTime eq '18:00:00'}">晚餐</c:if>
											</td>

											
											
											
                                            <td><fmt:formatDate value="${currentVendor[3]}" pattern="yyyy/MM/dd HH:mm"/></td>
                                            
                                            <td>${currentVendor[4]}</td>
                                            <td>
		                                        <form method="post" action="<%=request.getContextPath()%>/reservationUser" style="margin-bottom: 0px;">
		                                            <input type="hidden" name="reservationId" value="${reservation.reservationId}" />
<%-- 			                                            <c:if test="${reservation.status == 1}"> --%>
<!-- 			                                                <button type="submit" class="btn btn-info" name="action" value="getOneForUpdate">更新</button> -->
<%-- 			                                            </c:if> --%>
		                                           
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
    
     <script>
        // 格式化日期時間函數
        function formatDateTime(dateTimeStr) {
            // 將日期時間字串轉換成 JavaScript Date 物件
            var dateTime = new Date(dateTimeStr);

            // 取得小時
            var hours = dateTime.getHours();

            // 判斷是 "中午" 還是 "晚上"
            return hours == 12 ? '中午' : '晚上';
        }
        
        
      
        
        
    </script>
    
    
    
		



<%@include file="/front-end/vendor/common/vendorFooterScript.jsp"%>

</body>

</html>