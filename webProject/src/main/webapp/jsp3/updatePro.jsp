<!-- 231211 -->
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/updatePro.jsp</title>
</head>
<body>
<%
//utf-8 설정
request.setCharacterEncoding("utf-8");

//사용자가 입력한 정보를 http가 들고 서버에 전달 → 서버에 request 내장 객체 저장
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");

// 1단계 : Driver.class 파일 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 : DB연결정보 저장
String dbUrl = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPw = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw);
// 3단계 : 연결정보를 이용해서 sql구문 update 테이블 set 수정할열이름 = 수정값 where 조건열이름=값;
// 값자리에는 ?표로 하기
String sql = "update student set name=? where num=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setInt(2, num);


// 4단계 SQL 구문 실행
pstmt.executeUpdate();

// 5단계 : 결과를 이용하여 출력


%>
학생정보수정성공 <%=pstmt %>


</body>
</html>