<!-- 231205 -->
<!-- 요청 정보 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/scopeForm.jsp</title>
</head>
<body>
<%
//영역(Scope) 	영역객체 			유효범위
//page			pageContext		현 페이지 정보 저장, 페이지 변경시 사라짐
//request		request			요청 정보가 처리되는 동안 유효
//session		session			연결 정보를 저장, 페이지 상관없이 연결만 되어있으면 유효
//application	application		서버 정보를 저장, 서버가 start되어 있는 동안 유효
// 값을 저장 메서드 setAttribute() 값을 가져오는 메서드 getAttribute()

%>
<h1>jsp1/scopeForm.jsp</h1>
<form action="scopePro1.jsp" method="get">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pw"><br>
<input type="submit" value="전송">
</form>
</body>
</html>