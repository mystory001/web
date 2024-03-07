<!-- 231214 -->
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp4/updatePro.jsp</title>
</head>
<body>
<h1>jsp4/updatePro.jsp</h1>

<%
request.setCharacterEncoding("utf-8");

//request에서 id, pass, name 태그(파라미터)값 가져와서 변수에 저장
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");

Class.forName("com.mysql.cj.jdbc.Driver");

String dbUrl ="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root"; 
String dbPw = "1234"; 
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw);

String sql1 = "select * from members where id=? and pw=?";
PreparedStatement ps1 = con.prepareStatement(sql1);
ps1.setString(1,id);
ps1.setString(2,pw);

ResultSet rs1 = ps1.executeQuery();

if(rs1.next()){ 	
 out.println("비밀번호 일치");
 String sql2 = "update members set name=? where id=?";
 PreparedStatement ps2 = con.prepareStatement(sql2);
 ps2.setString(1, name);
 ps2.setString(2, id);
 ps2.executeUpdate();

 response.sendRedirect("03_main.jsp");  
 
}else{ 
 out.println("비밀번호 불일치");	
 response.sendRedirect("06_update.jsp");
}

%>


</body>
</html>