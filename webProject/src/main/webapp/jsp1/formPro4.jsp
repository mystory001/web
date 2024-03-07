<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/formPro4.jsp</title>
</head>
<body>
<h1>jsp1/formPro4.jsp</h1>
<%
//1. 사용자가 입력한 내용을 http가 요청정보를 들고 서버에 전달
//2. 서버에 request,response 기억장소를 만들고 
//3. request에 http가 들고 온 요청정보를 저장
//4. post방식으로 데이터를 가져오면 request 한글설정
//5. request에서 파라미터(태그) 값을 가져와서 변수에 저장
//6. 화면에 출력

//request 한글 설정
request.setCharacterEncoding("utf-8");
//request 파라미터 값 id, pw, gender, hobby, grade, intro 값을 가져와서 String 변수 저장
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String gender = request.getParameter("gender");
// String hobby = request.getParameter("hobby");
//이름 하나에 값이 여러 개 일 경우 getParameterValues() → 배열변수 저장
String hobby[] = request.getParameterValues("hobby");
String grade = request.getParameter("grade");
String intro = request.getParameter("intro");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pw %><br>
성별 : <%=gender %><br>
취미주소 : <%=hobby %><br>
<%-- 취미내용 : <%=hobby[0] %> <%=hobby[1] %> <%=hobby[2] %><br> --%>
<%-- 취미개수 : <%=hobby.length %><br> --%>
<%
if(hobby!=null){
	for(int i = 0; i< hobby.length ; i++){ 
%>
		<%=hobby[i]%> 
<%	
}
} %> <br>
------------------<br>
<table border="1">
<tr><td>취미</td></tr>
<%
if(hobby != null){
	for(int i = 0; i < hobby.length ; i++){ %>
<tr><td><%=hobby[i] %></td></tr>
<%
} 
}%>
</table>
등급 : <%=grade %><br>
자기소개 : <%=intro %><br>
</body>
</html>