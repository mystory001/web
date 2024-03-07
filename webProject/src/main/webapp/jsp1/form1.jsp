<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/form1.jsp</title>
</head>
<body>
<!-- 
웹 서버(아파치) : 서버에 내용을 사용자에게 보여주는 기능 
웹 어플리케이션 서버(톰캣) : JSP, JAVA 코드를 HTML로 변경해서 사용자에게 보여주는 기능
http://localhost:8080/webProject/JSP1/form1.jsp 서버에 요청
사용자가 아이디, 비밀번호를 입력하고 로그인 버튼을 클릭하면
폼 안에 있는 내용을 get(주소줄에 전달값 보이게)방식으로 데이터를 서버에 전달
formPro1.jsp를 요청, 연결(하이퍼링크, 주소)
ex) http://localhost:8080/webProject/jsp1/formPro1.jsp?id=asdf&pw=1234
 -->
<form action="formPro1.jsp" method="get">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pw"><br>
<input type="submit" value="로그인">
</form>
</body>
</html>