<!-- 231212 -->
<%@page import="javax.websocket.SendResult"%>
<%@page import="java.sql.Timestamp"%>
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
<title>jsp4/insertPro.jsp</title>
</head>
<body>
<h1>jsp4/insertPro.jsp</h1>
<h1>회원가입완료</h1>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
//Timestamp 자바내장객체 : 자바에 날짜 시간 관련 정보를 저장하는 내장객체
//시스템 현 날짜 가져오기 → System.currentTimeMillis()
Timestamp date = new Timestamp(System.currentTimeMillis());


//1단계 Driver.class 파일 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계 불러온 파일을 이용해 DB연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPw = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw);

//3단계 연결 정보를 이용해서 SQL 구문을 만들고 실행할 수 있는 객체 생성
String sql = "insert into members(id,pw,name,date) value(?,?,?,?)"; //괄호 확인하자
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pw);
pstmt.setString(3, name);
pstmt.setTimestamp(4, date); //넣어줘야함

//4단계 SQL구문 실행
pstmt.executeUpdate();

response.sendRedirect("02_login.jsp");
//login.jsp 이동

%>

회원가입완료 <%=pstmt %>
</body>
</html>