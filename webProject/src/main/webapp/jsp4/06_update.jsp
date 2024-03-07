<!-- 231214 -->

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
<title>jsp4/update.jsp</title>
</head>
<body>
<h1>jsp4/update.jsp</h1>
<h1>회원 정보 수정</h1>
<!-- 비밀번호가 맞는지 안맞는지를 먼저 확인한 후 이름만 수정 -->
<%
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");

Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPw = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw);

String sql = "select * from members where id=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, id);

ResultSet rs = ps.executeQuery();

if(rs.next()){
	%> 
<form action="06_updatePro.jsp" method="post">
아이디 : <input type="text" name="id" value="<%=rs.getString("id") %>" readonly><br>
비밀번호 : <input type="password" name="pw"> 비밀번호 입력 시 회원정보 수정<br>
이름 : <input type="text" name="name" value="<%=rs.getString("name")%>"><br>
<%	 
}

%>
<input type="submit" value="회원정보수정">
</form>
</body>
</html>