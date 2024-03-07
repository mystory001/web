<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewFile결과</title>
</head>
<body>
<h1>회원가입 완료</h1>
<%-- <% --%>
<!-- String id = request.getParameter("id"); -->
<!-- String pw = request.getParameter("pw"); -->
<%-- %> --%>

<%-- 입력한 아이디 : <%=id %><br> --%>
<%-- 입력한 비밀번호 : <%=pw %><br> --%>

<%-- <% --%>
<!-- String name = request.getParameter("name"); -->
<!-- String age = request.getParameter("age"); -->
<%-- %> --%>
<%-- 입력한 이름 : <%=name %><br> --%>
<%-- 입력한 나이 : <%=age %> --%>

<%-- <%  --%>
<!-- // request.setCharacterEncoding("utf-8"); -->
<!-- // String name = request.getParameter("name"); -->
<!-- // String age = request.getParameter("age"); -->
<!-- // int age1 = Integer.parseInt(request.getParameter("age")); -->
<%-- %> --%>
<%-- 입력한 이름 : <%=name %><br> --%>
<%-- 입력한 나이 : <%=age %><br> --%>
<%-- <% --%>
<!-- // if(age1<19){ -->
<!-- // 	out.println("보호자의 동의가 필요함."); -->
<!-- // } else { -->
<!-- // 	out.println("보호자의 동의가 필요하지 않음."); -->
<!-- // } -->
<%-- %><br> --%>
<%-- <% --%>
<!-- // if(age1<19){ -->
<%-- 	%><%=age1 %>세 보호자의 동의가 필요함<br> --%>
<%-- <% } else { --%>
<%-- 	%><%=age1 %>세 보호자의 동의가 필요하지 않음<br> --%>
<%-- <%} --%>
<%-- %><br> --%>
<%-- <%=age +100 %><br> --%>
<%-- <%=age1 + 100 %> --%>

<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String pw = request.getParameter("pw");
String gender = request.getParameter("gender");
String hobby[] = request.getParameterValues("hobby");
String grade = request.getParameter("grade");
String extra = request.getParameter("extra");
%>

입력한 이름 : <%=name %><br>
입력한 비밀번호 : <%=pw %><br>
입력한 성별 : <%=gender %><br>
입력한 취미주소 : <%=hobby %><br>
선택한 취미내용 : <%=hobby[0] %> <%=hobby[1] %> <%=hobby[2] %><br>
입력한 등급 : <%=grade %><br>
입력한 특이사항 : <%=extra %>


</body>
</html>