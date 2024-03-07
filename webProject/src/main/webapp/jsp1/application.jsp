<!-- 231201 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/application.jsp</title>
</head>
<body>
<h1>jsp1/application.jsp</h1>
<%
// application JSP내장객체 → ServletContext 자바내장객체 → 기억장소할당
// → 애플리케이션의 컨텍스트 정보(서버 정보)를 저장한 객체
// → 서버가 시작되면 application 내장객체 기억장소 할당, 서버에 하나만 할당됨, 서버가 중지되면 기억장소 삭제, 서버의 자원 공유(방문자수), 메소드()
%>

서버 정보 : <%=application.getServerInfo() %><br>
서버 물리적인 경로 : <%=application.getRealPath("/") %><br>

<%
// out JSP내장객체 → JspWriter 자바내장객체 → 기억장소할당
// → 응답 페이지 전송을 위한 출력 스프림(출력정보 저장) 객체

// 메소드()
out.println("출력정보저장<br>");
%>
출력 버퍼의 크기 : <%=out.getBufferSize() %>바이트<br>
출력 버퍼에 남은 크기 : <%=out.getRemaining() %>바이트<br>
<%
//출력을 종료
//out.close();
//종료 후 출력 에러 발생
out.println("종료 후 출력<br>");

// pageContext JSP내장객체 → PageContext 자바내장객체 → 기억장소할당
// → 페이지 실행에 필요한 컨텍스트 정보(프로젝트 한 페이지 정보)를 저장한 객체
// → 페이지가 바뀌면 새로운 페이지정보를 내장객체 새로 만들어지고 페이지 정보 저장
%>
현 페이지 request 정보 : <%=pageContext.getRequest() %><br>
현 페이지 session 정보 : <%=pageContext.getSession() %><br>
</body>
</html>