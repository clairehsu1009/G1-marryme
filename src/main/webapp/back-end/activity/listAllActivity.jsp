<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.marryme.activity.service.*"%>
<%@ page import="com.marryme.activity.vo.*"%>

<%
    ActivityServiceImpl service = new ActivityServiceImpl();
    List<Activity> activityList = service.findAll();
    pageContext.setAttribute("activityList",activityList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢單筆活動 - Marryme</title>
</head>
<body>
	<h1>所有活動列表</h1>
	<table border="1">
		<thead>
			<tr>
				<th>優惠代碼</th>
				<th>廠商帳號</th>
				<th>優惠活動名稱</th>
				<th>折扣額度</th>
				<th>活動開始時間</th>
				<th>活動結束時間</th>
				<th>活動內容</th>
				<th>修改</th>
				<th>刪除</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="activity" items="${activityList}">

				<tr>
					<td>${activity.discount_code}</td>
					<td>${activity.vendor_id}</td>
					<td>${activity.activity_name}</td>
					<td>${activity.discount}</td>
					<td>${activity.activity_start_time}</td>
					<td>${activity.activity_end_time}</td>
					<td>${activity.activity_detail}</td>
					<td>
						<form method="post" action="/marryme/activity/getOneForUpdate">
							<input type="hidden" name="discount_code"
								value="${activity.discount_code}"> 
								<input type="submit" value="修改">
						</form>
					</td>
					<td>
						<form method="post" action="/marryme/activity/delete">
							<input type="hidden" name="discount_code"
								value="${activity.discount_code}"> 
								<input type="submit" value="刪除">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
