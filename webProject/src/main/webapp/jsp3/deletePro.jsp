<!-- 231211 -->
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
<title>jsp3/deletePro.jsp</title>
</head>
<body>
<!-- 번호와 이름이 같을 때 삭제 -->
<%
request.setCharacterEncoding("utf-8");

int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");

//1단계 Driver.class 파일 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계 불러온 파일을 이용해서 DB연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPw = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw);

//3단계 연결 정보를 이용해 SQL 구문을 만들고 실행할 수 있는 객체 생성
PreparedStatement pstmt = con.prepareStatement("delete from student where num=? and name=?");
pstmt.setInt(1, num);
pstmt.setString(2, name);

//4단계 SQL문 실행
pstmt.executeUpdate();

%>
학생정보삭제성공 <%=pstmt %>

</body>
</html>