<!-- 231214 -->
<%@page import="member.MemberDAO"%>
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
<title>member/deletePro.jsp</title>
</head>
<body>
<h1>member/deletePro.jsp</h1>
<h1>회원 정보 삭제</h1>
<%
//폼에서 입력한 내용이 서버에 전달되어지면 서버에 request 내장객체 저장
//request에서 id,pw 태그값 가져와서 변수에 저장
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

MemberDAO memberDAO = new MemberDAO();
System.out.println("MemberDAO의 기억장치주소 : " + memberDAO);

boolean result = memberDAO.userCheck(id, pw);

if(result==true){
 	out.println("아이디, 비밀번호 일치");
 	memberDAO.deleteMember(id);
 	session.invalidate();
 	response.sendRedirect("03_main.jsp");
} else{
 	out.println("아이디, 비밀번호 불일치");
 	response.sendRedirect("07_delete.jsp");
}

%>


</body>
</html>