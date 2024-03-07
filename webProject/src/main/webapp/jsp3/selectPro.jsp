<!-- 231211 -->
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
<title>jsp3/selectPro.jsp</title>
</head>
<body>
<h1>학생 정보 조회</h1>
<%
int num = Integer.parseInt(request.getParameter("num"));

//1단계 Driver.class 파일 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계 불러온 파일을 이용해서 DB연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root"; 
String dbPw = "1234"; 
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw); 

// 3단계 연결정보를 이용해서 SQL구문을 만들고 실행할 수 있는 객체생성
// select * from 테이블이름 where 조건열=값;
PreparedStatement pstmt = con.prepareStatement("select * from student where num=?");
pstmt.setInt(1, num);

// 4단계 SQL 구문 실행 → 실행 후 결과 저장(select) → ResultSet 내장객체 저장
ResultSet rs = pstmt.executeQuery();

// 5단계 결과를 이용해서 출력, 다른 곳에 저장(select)
// if, while 커서를 다음행 이동 → 리턴값 데이터가 있으면 true → 열 접근 출력
// 					 				  없으면 false → 조건문을 빠져나옴

%>

<table border="1">
<tr><td>num</td><td>name</td></tr>
<%
if(rs.next()){%>
	<tr><td><%=rs.getInt("num") %></td><td><%=rs.getString("name") %></td></tr><%
}%>
</table>
</body>
</html>