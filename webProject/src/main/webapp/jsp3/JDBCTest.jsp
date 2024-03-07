<!-- 231208 -->
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/JDBCTest</title>
</head>
<body>
<h1>jsp3/JDBCTest</h1>
<% 
//1단계 설치한 JDBC 프로그램 중에 Driver.class 자바실행 파일 불러오기
//Class 실행파일을 관리하는 자바 내장객체 java폴더 lang폴더 Class.java 자바파일
//java폴더 lang폴더(java.lang.Class) => 기본폴더 위치 지정 하지 않고 사용
//JDBC 프로그램 안에 com폴더 mysql폴더 cj폴더 jdbc폴더 Driver.class 실행파일
Class.forName("com.mysql.cj.jdbc.Driver");

// 2단계 불러온 파일을 이용해서 데이터베이스 연결(데이터베이스 주소, DB 접속 ID, DB 접속 PW)
//           → 연결 정보를 저장
// import="java.sql.DriverManager
// java폴더 sql폴더 DriverManager.java 파일을 찾아가서 가져와서 사용
// DriverManager : 불러온 Driver 파일을 이용해서 데이터베이스 연결

// DB 주소 Mysql,Oracle DB마다 주소 정해짐
//?serverTimezone=Asia/Seoul → 서울을 기준으로 데이터베이스 시간을 설정
String dbUrl ="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
//DB 서버에 접속할 아이디
String dbUser = "root";
//데이터베이스 서버에 접속할 PW. 보안상 좋지 않음.
String dbPw = "1234"; 
//.getConnection() → 리턴값은 Connection 내장객체
//Connection : 자바와 데이터베이스 연결 정보를 저장
//import="java.sql.DriverManager java.sql에서 DriverManager.java 파일을 찾아 가져와서 사용
//DriverManager : 불러온 Driver 파일을 이용해서 데이터베이스 연결
//getConnection(url, user, password) url DB주소, user ID, passwory Password
//import="java.sql.Connection"
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw); 

//3단계 연결 정보를 이용해서 SQL구문을 만들고 실행할 수 있는 객체 생성(SQL구문을 만들어주는 단계)

//4단계  SQL 구문 실행(insert, update, delete)
//        → 결과 저장(select)
//5단계 결과를 이용하여 출력, 이동(select)
%>
연결 성공 : <%=con %>
</body>
</html>