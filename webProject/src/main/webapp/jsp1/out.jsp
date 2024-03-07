<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/out.jsp</title>
</head>
<body>
<h1>jsp1/out.jsp</h1>
<!-- JspWriter 자바 내장 객체 
응답 페이지를 전송하기 위한 출력 스프림(출력 정보 저장)객체 -->
<%
out.println("출력정보저장<br>");
%>
출력 버퍼의 크기 : <%=out.getBufferSize() %>byte<br>
출력 버퍼의 남은 크기 : <%=out.getRemaining() %>byte<br>
<%
//out.close();
//출력을 종료
out.println("종료 후 출력<br>"); 
//나타나지 않고 에러 메세지 IOException
%>
</body>
</html>