<!-- 231201 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/otherIO.jsp</title>
</head>
<body>
<h1>jsp1/other.jsp</h1>
<%
//pageContext
//페이지 실행에 필요한 컨텍스트 정보(프로젝트 한 페이지 정보)를 저장한 객체
//페이지가 바뀌면 새로운 페이지 정보로 내장 객체 생성, 기존 내장 객체가 사라짐
%>
현 페이지 request 정보 : <%=pageContext.getRequest() %><br>
현 페이지 session 정보 : <%=pageContext.getSession() %><br>
</body>
</html>