<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/formPro1.jsp</title>
</head>
<body>
<h1>jsp1/formPro1.jsp</h1>
<!-- html 주석(설명글) -->
<%-- <%="jsp주석" %> --%>
<%
// 자바 주석
/* 
Ctrl Shift /
자바
여러줄
주석
*/
%>

<%
//http://localhost:8080/webProject/jsp1/formPro1.jsp?id=asdf&pw=1234
//java,jsp 코드
//사용자가 입력한 정보를 서버에 전달(http) 
//→ 서버에 요청, 정보가 저장(request)
//→ request 요청 정보를 가져옴
//→ 출력, DB연결 비교

String sid = request.getParameter("id"); //자료형 변수명 = request.getParameter(value); ※request정보가 들어있는 그릇
String spw = request.getParameter("pw");

%>
아이디 : <%=sid %><br>
비밀번호 : <%=spw %><br>
</body>
</html>