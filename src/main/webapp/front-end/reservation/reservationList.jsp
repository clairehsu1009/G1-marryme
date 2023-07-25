<<<<<<< HEAD
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
            
            
            
=======
<%@page import="wedding.service.impl.ReservationServiceImpl" %>
<%@page import="wedding.service.ReservationService" %>
<%@ page import="java.util.List" %>
<%@page import="wedding.vo.Reservation" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	ReservationServiceImpl RSvc=new ReservationServiceImpl(); 
	List<Reservation> list =RSvc.findAll();
	pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<html lang="zh-tw">
<jsp:include page="/back-end/common/backHead.jsp" />

<body class="app sidebar-mini rtl">
    <jsp:include page="/back-end/common/backSidebar.jsp" />
    <script src="js/reservation.js"></script>
    <main class="app-content">
        <div class="app-title">
            <div>
                <h1><i class="fa fa-archive">&nbsp;</i>所有直售商品</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item"><a href="#">直售商品管理</a></li>
            </ul>
>>>>>>> d5af96d7be687fd235c20e294eafc8492a5eae7e
        </div>
        <div class="row ProductList">
            <div class="product-tab col-lg-12">
                <div class="tab-item">
                    <ul class="nav" role="tablist">
<<<<<<< HEAD
               <li><a class="active" data-toggle="tab" href="#tab-1" role="tab">預約</a></li>
<!--                     <li><a data-toggle="tab" href="#tab-1" role="tab">菜價</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-2" role="tab">婚禮企劃團隊服務</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-3" role="tab">婚禮佈置</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-4" role="tab">婚禮主持人</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-5" role="tab">婚禮小物</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-6" role="tab">其他</a></li> -->
<!--                     <li><a data-toggle="tab" href="#tab-2" role="tab">預約賞聽</a></li>                      -->
=======
                        <li>
                            <a class="active" data-toggle="tab" href="#tab-1" role="tab">æªä¸æ¶åå</a>
                        </li>
                        <li>
                            <a data-toggle="tab" href="#tab-2" role="tab">直售商品</a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#tab-3" role="tab">已售出</a>
                        </li>
                        <li>
                            <a data-toggle="tab" href="#tab-4" role="tab">違規下架</a>
                        </li>
>>>>>>> d5af96d7be687fd235c20e294eafc8492a5eae7e
                    </ul>
                </div>
                <div class="tab-item-content">
                    <div class="tab-content">
<<<<<<< HEAD
                    			<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                       			 <table class="table">
                           			<thead class="thead">
                                   
=======
                        <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                            <table class="table">
                                <thead class="thead">
>>>>>>> d5af96d7be687fd235c20e294eafc8492a5eae7e
                                    <tr>
                                        <th scope="col">客戶名稱</th>
		                                <th scope="col">聯繫電話</th>
		                                <th scope="col">宴客日期</th>
		                                <th scope="col">預約日期</th>
		                                <th scope="col">備註</th>

                                    </tr>
                                  
                                </thead>
                                <tbody>
<<<<<<< HEAD
                                    <c:forEach var="reservation" items="${reservationList}" begin="0" end="${reservationList.size()}">
                                        <tr>                                        
											<td>${reservation.contactName} </td>
                                            <td>${reservation.contactNumber}</td>
<%--                                             <td>${reservation.eventDate}</td> --%>
<%--                                             <td>${reservation.reservationDate}</td> --%>



                                             <td>
                                             	<fmt:formatDate value="${reservation.eventDate}" pattern="yyyy/MM/dd" />
                                             	
												<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
												<fmt:formatDate value="${reservation.eventDate}" pattern="HH:mm:ss" var="formattedEventTime" />
												
												<c:if test="${formattedEventTime eq '12:00:00'}">中午</c:if>
												<c:if test="${formattedEventTime eq '18:00:00'}">晚餐</c:if>
											</td>

											
											
											
                                            <td><fmt:formatDate value="${reservation.reservationDate}" pattern="yyyy/MM/dd HH:mm"/></td>
                                            
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
=======
                                    <c:forEach var="reservation" items="${list}" begin="0" end="${list.size()}">

                                        <tr>
                                            <th scope="row">${reservation.contactName}
                                            </th>

                                            <td>${reservation.contactNumber}
                                            </td>

                                            <td>${reservation.eventDate}
                                            </td>
                                            <td>${reservation.reservationDate}
                                            </td>
                                            <td>${reservation.reservationNotes}
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-primary" name="RUupdate"
                                                    id="RUupdate">更新</button>
                                                <button type="button" class="btn btn-dark" name="RDelete"
                                                    id="RDelete">刪除</button>
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

    <script type="text/javascript"
        src="${pageContext.request.contextPath}/public/js/template/jquery-3.7.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/template/bootstrap.js"></script>

    <script src="${pageContext.request.contextPath}/public/js/sidebar.js"></script>
>>>>>>> d5af96d7be687fd235c20e294eafc8492a5eae7e

</body>

</html>