<!-- 231212 -->
<%@page import="java.sql.Statement"%>
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
<title>jsp4/loginPro.jsp</title>
</head>
<body>
<h1>jsp4/loginPro.jsp</h1>
<h1>로그인 화면</h1>
<!-- 폼에서 입력한 내용이 서버에 전달 →서버에 request 내장객체에 저장
request에서 id, pass태그값(파라미터값)을 가져와서 변수에 저장 -->

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");

//1단계 Driver.class 자바실행 파일 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계 불러온 파일을 DB 연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPw = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw);


//한국인터넷진흥원 https://kisa.or.kr/ 지식 플랫폼 법령가이드라인 가이드 라인
//https://www.egovframe.go.kr/home/main.do 알림마당 - 관련참고문서 - 표준프레임워크 보안 개발 가이드
//3단계 연결정보를 이용해 SQL구문을 만들고 실행할 수 있는 객체 생성

//PMD 공식 사이트
//https://pmd.github.io/#plugins

//보안에 좋은 코드
// String sql = "select * from members where id=? and pw=?"; 
// PreparedStatement pstmt = con.prepareStatement(sql);
// pstmt.setString(1, id);
// pstmt.setString(2, pw);

//SQL 삽입 공격
//보안 취약 코드 : 아이디 lee' OR '1'='1 입력 => 비밀번호가 틀려도 로그인이됨
//java.sql.Statement
//3단계
String sql = "select * from members where id='"+id+"' and pw='"+pw+"'"; 
Statement stmt = con.createStatement();
//4단계
ResultSet rs = stmt.executeQuery(sql);


//4단계 SQL구문 실행 → 실행 후 결과 저장(select) → ResultSet 내장객체 저장
//조건 db, form id, pw가 일치하면 → ResultSet 내장객체 저장
// ResultSet rs = pstmt.executeQuery();
//5단계 결과를 이용해 다음 행 이동 → 아이디, 비밀번호 일치 출력, 아이디, 비밀번호 불일치 
if(rs.next()){
	out.println("아이디, 비밀번호 일치<br>");
	out.println("로그인 성공<br>");
// 	out.print(pstmt);
	out.print(stmt);
	//아이디 비밀번호 일치하면 로그인 표시 설정(연결되어 있는 동안 페이지 상관없이 값을 유지)
	//세션에 로그인 표시 저장("세션에 로그인 표시이름", 값)
	session.setAttribute("id",id);
	response.sendRedirect("03_main.jsp");//main.jsp 이동
} else{
	out.println("아이디, 비밀번호 불일치<br>");
	out.println("로그인 실패<br>");
// 	out.print(pstmt);
	out.print(stmt);
	response.sendRedirect("02_login.jsp");//login.jsp 이동
}
%>

</body>
</html>