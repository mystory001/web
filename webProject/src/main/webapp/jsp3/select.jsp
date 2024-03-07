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
<title>jsp3/select.jsp</title>
</head>
<body>
<h1>jsp3/select.jsp</h1>
<%
//1단계 Driver.class 파일 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계 불러온 파일을 이용해서 DB연결
String dbUrl ="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser = "root"; 
String dbPw = "1234"; 
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPw); 

//3단계 연결 정보를 이용해 SQL 구문을 만들고 실행할 수 있는 객체 생성
String sql = "select * from student";
PreparedStatement pstmt = con.prepareStatement(sql);

//4단계 sql구문 실행 → 실행 후 결과 저장(select) → ResultSet 내장객체 저장
ResultSet rs = pstmt.executeQuery();
//import="java.sql.ResultSet"
//ResultSet : SQL구문 실행한 결과를 저장하는 내장객체

//5단계 결과를 이용해서 출력, 다른 곳에 저장(select)


// out.println(rs.next()+"<br>");
// out.println(rs.next()+"<br>");
// out.println(rs.next()+"<br>");
// out.println(rs.next()+"<br>");
// out.println(rs.next()+"<br>");
// while 처음과 끝을 모를때 사용, for 처음과 끝을 알 때 사용	
// 	while(rs.next()==true){
// 		//다음 행 rs.next() true이면 데이터 있음 → 열을 정급
// 		out.println("다음행에 데이터가 있음 → 열 접근 = ");
// 		out.println("num : " + rs.getInt("num")+ " / ");
// 		out.println("name : " + rs.getString("name"));
// 		out.print("<br>");
// 	}
// 		out.println("다음행에 데이터가 없음 → 반복문 종료");
		
// while(rs.next()){
// 	out.println(rs.getInt("num(열이름)"));
// 	out.println(" , ");
// 	out.println(rs.getString("name(열이름)"));
// 	out.println("<br>");
// }

// 커서를 다음행으로 이동 next, 처음행으로 이동 fist, 마지막행으로 이동 last, 이전 행으로 이동 previous
// → return 값 데이터가 있으면 true, 없으면 false
	
%>
<table border="1">
<tr><td>num</td><td>name</td></tr>
<%
while(rs.next()){
	%><tr><td><%=rs.getInt("num") %></td><td><%=rs.getString("name") %></td></tr><%
	
	
}

%>

</table>

</body>
</html>