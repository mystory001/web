<!-- 231215 + 231218 -->
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
<title>member/insertPro.jsp</title>
</head>
<body>
<h1>member/insertPro.jsp</h1>
<h1>회원가입완료</h1>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
//Timestamp 자바내장객체 : 자바에 날짜 시간 관련 정보를 저장하는 내장객체
//시스템 현 날짜 가져오기 → System.currentTimeMillis()
Timestamp date = new Timestamp(System.currentTimeMillis());


//여러 개의 데이터를 하나의 바구니(MemberDTO)에 담기
//패키지(폴더) member, 자바파일 MemberDTO 생성
//멤버 변수 setter getter 메서드 정의

//MemberDTO 객체 생성 → 기억장소 할당
//MemberDTO 객체 생성
MemberDTO memberDTO = new MemberDTO();
System.out.println("MemberDTO형(회원정보를 저장하는 그릇 주소)의 주소 : " + memberDTO);

//멤버변수에 request에 가져온 값을 set 메서드 호출해서 저장
memberDTO.setId(id);
memberDTO.setPw(pw);
memberDTO.setName(name);
memberDTO.setDate(date);


// 패키지(폴더) member, 자바파일 MemberDAO 생성
// insertMember() 메소드 정의
//MemberDAO 객체생성 → 기억장소를 할당/부여
//import="member.MemberDAO" 위치에서 가져오기
MemberDAO memberDAO = new MemberDAO();
System.out.println("MeberDAO형의 주소 : " + memberDAO);


//insertMember() 메소드 호출
//memberDAO.멤버변수
//memberDAO.메소드();
memberDAO.insertMember(memberDTO);

response.sendRedirect("02_login.jsp");
//login.jsp 이동

%>

</body>
</html>