<!-- 231201 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/logout.jsp</title>
</head>
<body>
<h1>jsp1/logout.jsp</h1>
<%
session.invalidate();
//세션 → 연결정보를 저장하는 기억장소 삭제
response.sendRedirect("login.jsp");
//login.jsp 이동
%>
</body>
</html>