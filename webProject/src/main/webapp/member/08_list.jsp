<!-- 231221 -->
<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDAO"%>
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
<title>member/list.jsp</title>
</head>
<body>
<h1>member/list.jsp</h1>
<h1>회원 목록</h1>
<%
//로그인 표시 → 세션에서 "id"값을 가져와서 → String id 저장
String id = (String)session.getAttribute("id");

//로그인 표시값이 있으면 login.jsp이동, 있으면 로그인표시값이 "admin"이 아니면 main.jsp이동
if(id==null){
	response.sendRedirect("02_login.jsp");
}else{
	if(!id.equals("admin")){
		response.sendRedirect("03_main.jsp");
	}
	
}

request.setCharacterEncoding("utf-8");

//MemberDAO 객체생성
MemberDAO memberDAO = new MemberDAO();

//ArrayList 자바 내장객체 
//→ 배열(같은 기억장소를 여러 개 사용)에 단점(초기기억장소가 고정)울 보완한 자바 내장객체 배열 
//→ 기억장소 10개 할당 → 데이터가 10개가 넘어가면 추가로 10개가 추가되어짐
//→ java.util.ArrayList
// ArrayList 데이터 개수 : .size()
// ArrayList 배열에 데이터 저장(순서대로 값이 저장) : .add(memberDTO 주소값)
// ArrayList 배열에 데이터 가져오기 : .get(순서)
//ArrayList<MemberDTO> 리턴할 형 getMemberList() 메소드 정의

//ArrayList<MemberDTO> memberList = getMemberList() 메소드 호출 
ArrayList<MemberDTO> memberList = memberDAO.getMemberList();


%>
<table border="1">
<tr><td>아이디</td><td>비밀번호</td><td>이름</td><td>가입날짜</td></tr>
<%
for(int i = 0; i < memberList.size(); i++){
%>

	<tr><td><%=memberList.get(i).getId() %></td>
	<td><%=memberList.get(i).getPw() %></td>
	<td><%=memberList.get(i).getName() %></td>
	<td><%=memberList.get(i).getDate() %></td></tr>

<%
	
}

%>

</table>
</body>
</html>