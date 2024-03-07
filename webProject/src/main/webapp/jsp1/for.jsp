<!-- 231130 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/for.jsp</title>
</head>
<body>
<h1>jsp1/for.jsp</h1>
<%
int a1 = 10;
int a2 = 20;
int a3 = 30;
int a4 = 40;
int a5 = 50;
//배열 : 변수 하나에 여러개의 값을 가지게 할 수 있음
int a[] = {10,20,30,40,50};
out.println("배열 주소 : " + a +"<br>" ); 
out.println("배열 크기 : " + a.length + "<br>");

out.println("배열 내용 : " + a[0] + "<br>" );
out.println("배열 내용 : " + a[1] + "<br>" );
out.println("배열 내용 : " + a[2] + "<br>" );
out.println("배열 내용 : " + a[3] + "<br>" );
out.println("배열 내용 : " + a[4] + "<br>" );
out.println("-------------------<br>");

// for(초기값;조건;증가값) {
//	}
for(int i=0 ; i<5 ;i++){
	out.println("배열 내용 : " + a[i] + "<br>");	
}
out.println("-------------------<br>");
String b[] = {"html", "java", "jsp", "db"};
out.println("배열 크기 : " + b.length + "<br>");
for(int i = 0 ; i<4; i++){
	out.println("배열 내용 : " + b[i] + "<br>");
}
%>
-------------------<br>
<%
for(int i = 0 ; i<4; i++){ %>
	배열 내용 : <%=b[i] %> <br> 
<%}
%>
<table border="1">
<tr><td>과목</td></tr>
<tr><td><%=b[0] %></td></tr>
<tr><td><%=b[1] %></td></tr>
<tr><td><%=b[2] %></td></tr>
<tr><td><%=b[3] %></td></tr>
</table>
-------------------<br>
<table border="1">
<tr><td>과목</td></tr>
<%for(int i = 0 ; i<4; i++){ %>
<tr><td><%=b[i] %></td></tr><%} %> 
</table>
<%-- 태그는 <%에 들어가지 않는다. --%>




</body>
</html>