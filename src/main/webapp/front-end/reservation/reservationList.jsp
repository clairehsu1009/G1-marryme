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
                <h1><i class="fa fa-archive">&nbsp;</i>ææç´å®åå</h1>
            </div>
            <ul class="app-breadcrumb breadcrumb">
                <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                <li class="breadcrumb-item"><a href="#">ç´å®ååç®¡ç</a></li>
            </ul>
        </div>
        <div class="row ProductList">
            <div class="product-tab col-lg-12">
                <div class="tab-item">
                    <ul class="nav" role="tablist">
                        <li>
                            <a class="active" data-toggle="tab" href="#tab-1" role="tab">æªä¸æ¶åå</a>
                        </li>
                        <li>
                            <a data-toggle="tab" href="#tab-2" role="tab">ç´å®åå</a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#tab-3" role="tab">å·²å®åº</a>
                        </li>
                        <li>
                            <a data-toggle="tab" href="#tab-4" role="tab">éè¦ä¸æ¶</a>
                        </li>
                    </ul>
                </div>
                <div class="tab-item-content">
                    <div class="tab-content">
                        <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th scope="col">å®¢æ¶åç¨±</th>
                                        <th scope="col">è¯ç¹«é»è©±</th>
                                        <th scope="col">å®´å®¢æ¥æ</th>
                                        <th scope="col">é ç´æ¥æ</th>
                                        <th scope="col">åè¨»</th>

                                    </tr>
                                    <!--                               -->
                                </thead>
                                <tbody>
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
                                                    id="RUupdate">æ´æ°</button>
                                                <button type="button" class="btn btn-dark" name="RUupdate"
                                                    id="RUupdate">åªé¤</button>
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

</body>

</html>