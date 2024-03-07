<%@page import="java.security.Timestamp"%>
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
<title>jsp4/info.jsp</title>
</head>
<body>
<h1>jsp4/info.jsp</h1>
<h1>회원 정보 조회</h1>
<%

String id = (String)session.getAttribute("id");
//()클래스의 형 변환
//main.jsp에서 info.jsp로 이동할 때 값을 들고오지 않음
//연결정보를 저장하는 session 내장객체 안에 로그인표시("id","id값") 저장
//session에서 로그인 표시값 가져오기 → String id 변수에 저장

request.setCharacterEncoding("utf-8");

//1단계 : Driver.class 자바실행 파일 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계 : 불러온 파일을 이용해 DB 연결 → 연결정보 저장
String dbUrl ="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root"; 
String dbPw = "1234"; 
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw);

//3단계 : 연결정보를 이용해 SQL구문을 만들고 실행할 수 있는 객체생성
String sql = "select * from members where id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);

//4단계 : SQL 구문 실행 → 실행 후 결과 저장 → ResultSet 내장객체저장
ResultSet rs = pstmt.executeQuery();

//5단계 : 결과를 이용해서 출력
if(rs.next()){
	%>
	아이디 : <%=rs.getString("id") %> <br> 
	비밀번호 : <%=rs.getString("pw") %> <br>
	이름 : <%=rs.getString("name") %> <br>
	가입날짜 : <%=rs.getTimestamp("date") %> <br>
	<%
 }
%>

<a href="main.jsp">main.jsp 이동</a>

</body>
</html>