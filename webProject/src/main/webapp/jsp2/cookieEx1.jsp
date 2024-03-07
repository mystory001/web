<!-- 231207 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/cookieEx1</title>
</head>
<body>
<h1>jsp2/cookieEx1</h1>
<%
Cookie cookies[] = request.getCookies(); //쿠키값 가져오기

String clanguageValue = "kor"; ////쿠키값이 없으면 "kor"로 설정

if(cookies!=null){
	for(int i = 0 ; i < cookies.length ; i++){
		
		if(cookies[i].getName().equals("clanguage")){
			//out.println(cookies);
			//out.println(cookies[i]);
			out.println(" 쿠키 이름 : " + cookies[i].getName());
			out.println(" 쿠키값 : " + cookies[i].getValue());
			
			clanguageValue = cookies[i].getValue(); //쿠키값을 변수에 저장
		}
	}
}

//쿠키값을 비교해서 나타내기
if(clanguageValue.equals("kor")){
%> <h1>"안녕하세요. 이것은 쿠키 예제입니다"</h1><%
}
else {
%><h1>"Hi, This is Cookie example"</h1><%
}
%>
<form action="cookieEx2.jsp" method="get">
<input type="radio" name="language" value="kor" <%if(clanguageValue.equals("kor")){%>checked<%}%>>한국어 페이지 보기(기본값)
<input type="radio" name="language" value="eng" <%if(clanguageValue.equals("eng")){%>checked<%}%>>영어 페이지 보기<br>
<input type="submit" value="언어설정">


</form>
</body>
</html>