<!-- 231205 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/scopePro2.jsp</title>
</head>
<body>
<h1>jsp1/scopePro2.jsp</h1>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pw %><br>
<!-- 하이퍼링크는 id, pw를 가져가지 않음. -->

<!-- 내장객체 값 가져오기 -->
pageContext값 : <%=pageContext.getAttribute("page") %><br>
request값 : <%=request.getAttribute("req") %><br>
session값 : <%=session.getAttribute("sess") %><br>
application값 : <%=application.getAttribute("app") %><br>
<!-- 페이지가 바뀜으로서 pageContext값, request값은 사라짐 -->

</body>
</html>