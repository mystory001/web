<!-- 231214 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/delete.jsp</title>
</head>
<body>
<h1>jsp4/delete.jsp</h1>
<h1>회원 정보 삭제</h1>
<%
//main.jsp에서 delete.jsp로 이동할 때 아무값도 없이 이동
//연결정보를 저장하는 session 내장객체 안에 로그인표시("id","asdf") 저장
//session에서 로그인 표시값 가져오기 String id 변수저장
String id = (String)session.getAttribute("id");
%>
<form action="07_deletePro.jsp" method="post">
아이디 : <input type="text" name="id" value="<%=id %>" readonly><br>
비밀번호 : <input type="password" name="pw"><br>
<input type="submit" value="회원정보삭제">
</form>
</body>
</html>