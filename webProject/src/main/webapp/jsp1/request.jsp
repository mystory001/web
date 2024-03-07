<!-- 231130 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/request.jsp</title>
</head>
<body>
<h1>jsp1/request.jsp</h1>
<!--  
http가 들고 온 요청정보 : 파라미터(태그이름 = 값)값, 서버정보, 사용자정보, 쿠키정보(세션정보), http에 저장된 정보(http 헤더) 
→ 서버에 전달
→ 서버 request가 요청정보에 저장 
-->
서버이름(서버 도메인) : <%=request.getServerName() %><br>
서버포트번호 : <%=request.getServerPort() %><br>
요청한 주소(URL) : <%=request.getRequestURL() %><br>
주소에서 서버주소를 뺀 주소(URI) : <%=request.getRequestURI() %><br>
클라이언트(유저) IP 주소 : <%=request.getRemoteAddr() %><br>
프로토콜 : <%=request.getProtocol() %><br>
요청방식 : <%=request.getMethod() %><br>
컨텍스트(프로젝트) 경로 : <%=request.getContextPath() %><br>
파일 업로드 시 업로드 한 경로(물리적인 경로) : <%=request.getRealPath("/") %><br>

http 헤더정보(언어) : <%=request.getHeader("accept-language") %><br>
http 헤더정보(브라우저) : <%=request.getHeader("user-agent") %><br>
</body>
</html>