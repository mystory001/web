<!-- 231212 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/main.jsp</title>
</head>
<body>
<h1>jsp4/main.jsp</h1>
<%
String id = (String)session.getAttribute("id");
if(id == null){
	response.sendRedirect("02_login.jsp");
}
%>
<%=id %> 님 환영합니다.


<a href="04_logout.jsp">로그아웃</a><br>
<a href="05_info.jsp">회원 정보 조회</a><br>
<a href="06_update.jsp">회원 정보 수정</a><br>
<a href="07_delete.jsp">회원 정보 삭제</a><br>

<%
//로그인 한 사용자가 null이 아닌 경우
if(id!=null){
	

//로그인한 관리자가 "admin" → 일치하면 회원 목록이 보이게
if(id.equals("admin")){%>
	
	<a href="08_list.jsp">회원 목록(관리자)</a><br>

<%}
}	
%>



</body>
</html>