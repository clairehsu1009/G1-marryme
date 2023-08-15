<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Marry Me</title>
  <link rel="icon" href="${pageContext.request.contextPath}/public/images/front-end/marrymelittle.ico" type="image/x-icon">

  <!-- Css Styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap/bootstrap.min.css" type="text/css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/fontawesome/css/all.css" type="text/css" />
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css/user.css">

</head>


<!-- 增加import -->
<%@ page import="com.marryme.member.vo.Member" %>
<%
  //TODO 之後這邊要改取得登入廠商的ID 才是正確的
//   String memberId = "member2@gmail.com";
  Member memberId = (Member) session.getAttribute("member");
  session.setAttribute("memberId", memberId);
%>
