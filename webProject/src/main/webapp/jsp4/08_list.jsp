<!-- 231214 + 231215 -->
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/list.jsp</title>
</head>
<body>
<h1>jsp4/list.jsp</h1>
<h1>회원 목록</h1>
<%
//로그인 표시 → 세션에서 "id"값을 가져와서 → String id 저장
String id = (String)session.getAttribute("id");

//로그인 표시값이 있으면 login.jsp이동, 있으면 로그인표시값이 "admin"이 아니면 main.jsp이동
if(id==null){
	response.sendRedirect("02_login.jsp");
}else{
	if(!id.equals("admin")){
		response.sendRedirect("03_main.jsp");
	}
	
}



request.setCharacterEncoding("utf-8");

Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl ="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root"; 
String dbPw = "1234"; 
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw);

String sql = "select * from members";
PreparedStatement ps = con.prepareStatement(sql);

ResultSet rs = ps.executeQuery();
%>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입날짜</td></tr>
<%
while(rs.next()){%>

	<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getTimestamp(4) %></td></tr>
<%
	
}

%>

</table>
</body>
</html>