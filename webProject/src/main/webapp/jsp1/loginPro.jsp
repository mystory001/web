<!-- 231201 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/loginPro.jsp</title>
</head>
<body>
<h1>jsp1/loginPro.jsp</h1>
<%
//사용자가 입력한 id,pw값을 http가 loginPro.jsp 요청하여 서버에 전달
//→ 서버가 정보를 전달 받아서 request, response 기억장소를 만듦
//→ request에 id,pw 파라미터값을 저장 
//→ 가져 온 정보를 변수에 저장
String sid = request.getParameter("id");
String spw = request.getParameter("pw");
//request는 String을 사용
%>
폼에서 입력한 ID : <%=sid %><br>
폼에서 입력한 PW : <%=spw %><br>
<%
//DB 접속하기를 배우지 않았기 때문에 임의로 DB에 저장된 사용자 dbId="admin" dbPw="p123" 정하기
String dbId="admin";
String dbPw="p123";
%>
DB에 저장된 ID : <%=dbId %><br>
DB에 저장된 PW : <%=dbPw %><br>
<%
//폼에서 입력한 ID와 DBID 비교 and 폼에서 입력한 PW와 DBPW 비교
//둘 다 일치하면 "ID, PW 일치"
//틀리면 "ID, PW 불일치"
//문자열 비교 변수값.equals(변수값)
// if(sid.equals(dbId)){
// 	out.println("ID 일치");
// 	if(spw.equals(dbPw)){
// 		out.println("ID, PW 일치");
// 		
// 	} else {
// 		out.println("PW 불일치");
// 	}
// } else {
// 	out.println("ID 불일치");
// 		if (spw.equals(dbPw)){
// 			out.println("PW 일치");
// 		}else {
// 		out.println("PW 불일치");	
// 	}
// 	
// }

if(sid.equals(dbId) && spw.equals(dbPw)){
	out.println("ID, PW 일치");
	//ID, PW 일치 시 로그인 표시 설정(서버-클라이언트 연결되어 있는 동안페이지 상관없이 값을 유지)
	session.setAttribute("ID", sid);
	//세션에 로그인 표시 저장("세션에 로그인 표시이름",값)
 	//ID값은 고유하고, ID기준값으로 다른 정보를 가져올 수 있기 때문에 ID로 하는것이 바람직함. PW는 동일한 사용자가 있을 수 있음.
	response.sendRedirect("loginMain.jsp");
 	//login.Main.jsp 이동(하이퍼링크 기능)
 	}else{
out.println("ID, PW 불일치");
response.sendRedirect("login.jsp");
//login.jsp 이동(하이퍼링크 기능)
}
%>


</body>
</html>