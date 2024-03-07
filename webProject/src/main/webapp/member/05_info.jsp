<!-- 231218 + 231219 -->
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
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
<title>member/info.jsp</title>
</head>
<body>
<h1>member/info.jsp</h1>
<h1>회원 정보 조회</h1>
<%

String id = (String)session.getAttribute("id");
//()클래스의 형 변환
//main.jsp에서 info.jsp로 이동할 때 값을 들고오지 않음
//연결정보를 저장하는 session 내장객체 안에 로그인표시("id","id값") 저장
//session에서 로그인 표시값 가져오기 → String id 변수에 저장

request.setCharacterEncoding("utf-8");

//MemberDAO 객체 생성 -> 기억 장소 할당
MemberDAO memberDAO = new MemberDAO();
System.out.println("MemberDAO의 기억장소 주소 : " + memberDAO);
//MemberDAO에 리턴할 형 MemberDTO getMember(String id) 메소드 정의
//MemberDTO memberDTO = MemberDAO의 기억장소 주소.getMember(id) 메소드 호출
MemberDTO memberDTO = memberDAO.getMember(id);
//id가 일치했을 때 memberDTO에 id, pw, name, date가 저장해서 리턴, 
//그렇지 않을 경우 memberDTO에 비어있는 값 null이 리턴 
System.out.println("리턴 받은 MemberDTO의 바구니 기억장소 주소 : " + memberDTO);
if(memberDTO != null){
	%>
	아이디 : <%=memberDTO.getId() %> <br> 
	비밀번호 : <%=memberDTO.getPw() %> <br>
	이름 : <%=memberDTO.getName() %> <br>
	가입날짜 : <%=memberDTO.getDate() %> <br>
	<%
	}else {
		%> 아이디 없음
	<%}
%>

<a href="03_main.jsp">main.jsp 이동</a>

</body>
</html>
