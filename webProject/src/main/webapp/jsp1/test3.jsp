<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/form3.jsp</title>
</head>
<body>
<%
// java,jsp 코드
// 정수형 변수 선언, 변수 이름 : hour, 초기값 17 저장
int hour = 17;
//정수형 변수 선언, 변수 이름 : min, 초기값 20 저장
int min = 20;
//정수형 변수 선언, 변수 이름 : sec, 초기값 30 저장
int sec = 30;
%>
<h1>현재 시간은 <%=hour %>시 <%=min %>분 <%=sec %>초 입니다.</h1>

<%
//if문을 이용해서 변수 hour가 12시 미만이면 "오전입니다" 그렇지 않으면 "오후입니다."

if(hour<12) {
	out.println("오전입니다.");
} else {
	out.println("오후입니다.");
}

if(hour<12) {
%>
<%=hour %> 오전입니다
<% 
} else {
%>
<%=hour %> 오후입니다
<% 
}
%>


</body>
</html>