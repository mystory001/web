<!-- 231205 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/scopePro1.jsp</title>
</head>
<body>
<h1>jsp1/scopePro1.jsp</h1>
<%
//사용자가 입력한 요청 정보를 서버에 전달하면 request 내장객체에 저장
//request에 가져와서 변수에 저장 → 출력
String id = request.getParameter("id");
//	  변수명						태그이름
String pw = request.getParameter("pw");

//내장객체 값 저장
pageContext.setAttribute("page", "pageContextValue");
request.setAttribute("req", "requestValue");
session.setAttribute("sess", "sessionValue");
application.setAttribute("app", "applicationValue");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pw %><br>
<!-- 내장객체 값 가져오기 -->
pageContext값 : <%=pageContext.getAttribute("page") %><br>
request값 : <%=request.getAttribute("req") %><br>
session값 : <%=session.getAttribute("sess") %><br>
application값 : <%=application.getAttribute("app") %><br>

<a href="scopePro2.jsp">scopePro2.jsp 이동</a><br>
<!-- get방식 형태 http://localhost:8080/webProject/jsp1/scopePro1.jsp?id=admin&pw=1234 -->
<a href="scopePro2.jsp?id=<%=id %>&pw=<%=pw %>">scopePro2.jsp로 get방식으로 데이터 요청하면서 이동</a><br>
<%
// response.sendRedirect("scopePro2.jsp");
//get방식으로 데이터 요청
// response.sendRedirect("scopePro2.jsp?id="+id+"&pass="+pw);
%>
<!-- 
액션 태그 : JSP문법으로 태그처럼 사용하도록 만든 문법, %밖에 사용
jsp:include : 반복되는 코드를 가져오기
jsp:forward : 페이지(주소줄) 변경 없이 이동 ex)a-b-c페이지가 있으면 a-c, requset값을 가지고 이동, MVC
-->
<%-- <jsp:forward page="scopePro2.jsp"/> --%>


</body>
</html>