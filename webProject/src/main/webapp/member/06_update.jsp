<!-- 231219 -->
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
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
<title>member/update.jsp</title>
</head>
<body>
<h1>member/update.jsp</h1>
<h1>회원 정보 수정</h1>
<!-- 비밀번호가 맞는지 안맞는지를 먼저 확인한 후 이름만 수정 -->
<%
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");


//자바 파일 MemberDAO 객체 생성
MemberDAO memberDAO = new MemberDAO();
System.out.println("MemberDAO의 기억장소 주소 : " + memberDAO);

//MemberDTO memberDTO = MemberDAO의 기억장소 주소 .getMember(id) 메소드 호출
MemberDTO memberDTO = memberDAO.getMember(id);

System.out.println("리턴 받은 MemberDTO의 바구니 기억장소 주소 : " + memberDTO);
if(memberDTO!=null){
	%> 
<form action="06_updatePro.jsp" method="post">
아이디 : <input type="text" name="id" value="<%=memberDTO.getId() %>" readonly><br>
비밀번호 : <input type="password" name="pw"> 비밀번호 입력 시 회원정보 수정<br>
이름 : <input type="text" name="name" value="<%=memberDTO.getName() %>"><br>
<%	 
}

%>
<input type="submit" value="회원정보수정">
</form>
</body>
</html>