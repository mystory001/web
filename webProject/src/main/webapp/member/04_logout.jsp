<!-- 231212 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/logout.jsp</title>
</head>
<body>
<h1>member/logout.jsp</h1>
<%=session.getAttribute("id") %>님 안녕히 가십시오.<br>
<%
session.invalidate();//로그인표시 저장된 세션전체 삭제
response.sendRedirect("03_main.jsp"); //main.jsp 이동(세션이 삭제되었는지 확인)

%>
</body>
</html>