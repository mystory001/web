<!-- 231214 -->
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
<title>member/updatePro.jsp</title>
</head>
<body>
<h1>member/updatePro.jsp</h1>

<%
request.setCharacterEncoding("utf-8");

//request에서 id, pass, name 태그(파라미터)값 가져와서 변수에 저장
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");

//자바파일 MemberDAO 객체 생성
MemberDAO memberDAO = new MemberDAO();
System.out.println("MemberDAO의 기억장소주소 : " + memberDAO);

boolean result = memberDAO.userCheck(id, pw);

if(result == true){ 
  out.println("비밀번호 일치");
  //MemberDTO 객체생성(기억장소 할당)
  MemberDTO memberDTO = new MemberDTO();
  //수정할 데이터 파라미터(태그)값을 MemberDTO에 set메소드 호출해서 저장
  memberDTO.setId(id);
  memberDTO.setPw(pw);
  memberDTO.setName(name);
  //리턴값없음 updateMember(MemberDTO memberDTO) 메소드 정의
  //updateMember(MemberDTO memberDTO) 메소드 정의
  memberDAO.updateMember(memberDTO);
  
//   String sql2 = "update members set name=? where id=?";
//   PreparedStatement ps2 = con.prepareStatement(sql2);
//   ps2.setString(1, name);
//   ps2.setString(2, id);
//   ps2.executeUpdate();

  response.sendRedirect("03_main.jsp");  
 
 }else{ 
  out.println("비밀번호 불일치");	
  response.sendRedirect("06_update.jsp");
 }

%>


</body>
</html>