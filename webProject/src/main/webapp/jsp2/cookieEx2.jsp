<!-- 231207 -->
<%@page import="javax.security.auth.callback.LanguageCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieEx2</title>
</head>
<body>
<h1>jsp2/cookieEx2</h1>
<%
request.setCharacterEncoding("utf-8");

//사용자가 선택한 값이 서버에 전달 → request에 저장
//request에 저장된 파라미터 값(name, value)(태그정보값)을 가져와서 변수에 저장
String language = request.getParameter("language");
%>
사용자가 선택한 값 : <%=language %><br>
<%
Cookie cookie = new Cookie("clanguage", language); //쿠키객체생성 "이름",값 → 이름 "clanguage", 값 사용자가 선택한 언어 값
cookie.setMaxAge(3600); //쿠키시간설정 3600초
response.addCookie(cookie); //쿠키를 response에 저장한 후 사용자 컴퓨터에 저장
%>

쿠키주소 : <%=cookie %><br>
쿠키이름 : <%=cookie.getName() %><br>
쿠키값 : <%=cookie.getValue() %><br>
쿠키설정시간 : <%=cookie.getMaxAge() %>초<br>

<a href="cookieEx1.jsp">쿠키값 가져오기(설정된 언어 페이지 보기)</a>
</body>
</html>