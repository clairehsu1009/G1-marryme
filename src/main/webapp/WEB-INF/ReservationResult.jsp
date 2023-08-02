<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
<!-- 			<th>RESERVATION_ID</th> -->
<!-- 			<th>VENDOR_ID</th> -->
<!-- 			<th>MEMBER_ID</th> -->
			<th>CONTACT_NAME</th>
			<th>CONTACT_NUMBER</th>
			<th>EVENT_DATE</th>
			<th>RESERVATION_DATE</th>
			<th>RESERVATION_NOTES</th>
		</tr>
			<c:forEach var="reservation" items="${reservationlist}">
				<tr>
<%-- 					<td>${reservation.reservation_id}</td> --%>
<%-- 					<td>${reservation.vendor_id}</td> --%>
<%-- 					<td>${reservation.member_id}</td> --%>
					<td>${reservation.contactName}</td>
					<td>${reservation.contactNumber}</td>
					<td>${reservation.eventDate}</td>
					<td>${reservation.reservationDate}</td>
					<td>${reservation.reservationNotes}</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>