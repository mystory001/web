<!-- 231218 -->
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
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
<title>member/loginPro.jsp</title>
</head>
<body>
<h1>member/loginPro.jsp</h1>
<h1>로그인 화면</h1>
<!-- 폼에서 입력한 내용이 서버에 전달 →서버에 request 내장객체에 저장
request에서 id, pass태그값(파라미터값)을 가져와서 변수에 저장 -->

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");


//MemberDAO 객체 생성 → 기억장소 할당
MemberDAO memberDAO = new MemberDAO();
System.out.println("MemberDAO의 기억장소주소 : " + memberDAO);
//MemberDAO에 리턴할 형 boolean userCheck(String id, String pw) 메소드 정의
//boolean result = MemberDAO 주소.userCheck(String id, String pw) 메소드 호출
boolean result = memberDAO.userCheck(id, pw);

// //5단계 결과를 이용해 다음 행 이동 → 아이디, 비밀번호 일치 출력, 아이디, 비밀번호 불일치 
if(result == true){
	out.println("아이디, 비밀번호 일치<br>");
	out.println("로그인 성공<br>");
	//아이디 비밀번호 일치하면 로그인 표시 설정(연결되어 있는 동안 페이지 상관없이 값을 유지)
	//세션에 로그인 표시 저장("세션에 로그인 표시이름", 값)
	session.setAttribute("id",id);
	response.sendRedirect("03_main.jsp");//main.jsp 이동
} else{
	out.println("아이디, 비밀번호 불일치<br>");
	out.println("로그인 실패<br>");
	response.sendRedirect("02_login.jsp");//login.jsp 이동
}
%>

</body>
</html>

