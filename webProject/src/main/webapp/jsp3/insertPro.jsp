<!-- 231208 -->
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/insertPro.jsp</title>
</head>
<body>
<h1>jsp3/insertPro.jsp</h1>
<h1>학생등록처리 → 데이터베이스 저장</h1>
<%
//사용자가 입력한 정보를 http가 서버에 전달
//→ 서버 request 내장객체에 저장
//→ request 한글처리
request.setCharacterEncoding("utf-8");
//→ request에 저장된 파라미터(num,name)을 가져옴
//→ 변수에 저장
int num = Integer.parseInt(request.getParameter("num")) ;
String name = request.getParameter("name");

%>
학생번호 : <%=num %><br>
학번이름 : <%=name %><br>

<%
//1단계 : 설치한 JDBC 프로그램 중 Driver.class(자바실행파일) 파일 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");


//2단계 : 불러온 파일을 이용해서 데이터베이스 연결(데이터베이스 주소, DB 접속 ID, DB 접속 PW)
String dbUrl ="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root"; 
String dbPw = "1234"; 
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw); 

// 3단계 연결 정보를 이용해서 SQL구문을 만들고 실행할 수 있는 객체 생성(SQL구문을 만들어주는 단계)
//String sql = "insert into student(num,name) value(1,'홍길동')";
//String sql = "insert into student(num,name) value("+num+",'"+name+"')"; //이는 복잡하다

PreparedStatement pstmt = con.prepareStatement("insert into student(num,name) value(?,?)");
//객체생성 후 미완성 SQL구문에 ?에 값을 넣기
pstmt.setInt(1, num); //?에 값을 넣을 때 정수형 setInt(물음표 순서,들어갈 값)
pstmt.setString(2, name); //?에 값을 넣을 때 문자열 setString(물음표 순서, 들어갈 값)
//import="java.sql.PreparedStatement"
//PreparedStatement 자바내장객체 : SQL구문을 만들고 실행 할 수 있는 내장 객체

// 4단계  SQL 구문 실행(insert, update, delete)
//           → 결과 저장(select)
pstmt.executeUpdate();

// 5단계 결과를 이용하여 출력, 이동(select)

%>

학생등록성공 <%=pstmt %>

</body>
</html>