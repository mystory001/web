<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
JSP 지시어 : page지시어(page 설정 지시), 
    	  include 지시어(변수, 내용 포함), 
		  taglib 지시어(% 대신에 태그처럼 사용하는 설정) 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/formPro2.jsp</title>
</head>
<body>
<h1>jsp1/form2.jsp</h1>
<%
// 스클립틀릿(Scriptlet) : java, jsp코드 영역
// form2.jsp에서 입력한 name, num 이름에 해당하는 값이 서버에 전달
// → 서버 request, response라는 기억장소가 만들어짐
// → request에 name, num 이름에 해당하는 값 등 요청 정보가 저장
// request에서 name, num 이름에 해당하는 값을 가져와서 String 변수에 저장
// → 변수를 출력(표현식)
String name = request.getParameter("name");
String num = request.getParameter("num");
%>
이름 : <%=name %><br>
좋아하는 숫자 : <%=num %><br>
</body>
</html>