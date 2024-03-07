<!-- 231201 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/session.jsp</title>
</head>
<body>
<h1>jsp1/session.jsp</h1>
<%
// session JSP내장객체 → HttpSession 자바내장객체 → 기억장소할당
// → 클라이언트의 세션 정보(연결정보)를 저장한 객체
// → 연결만 되어있으면 페이지 상관없이 값이 유지됨

//세션 기억장소 삭제가 되는 경우
//1) 사용자가 사용하는 브라우저를 모두 닫았을 때 - 사용자가 세션ID를 잃어버림
//2) 사용자가 서버에 접근을 30분동안 하지 않았을 때 - 세션 기억 장소 삭제
//3) 사용자가 로그아웃(세션삭제명령) - 세션 기억장소 삭제
%>
세션 ID : <%=session.getId() %><br> <!--통행증. 기억장소가 새로만들어지지 않는 이상 유지됨 -->
세션 만든 시간 : <%=session.getCreationTime() %><br> <!-- 유지됨 -->
세션 마지막 접근 시간 : <%=session.getLastAccessedTime() %><br> <!-- 시간이 지남에 따라 변동됨 -->
세션 유지 시간 : <%=session.getMaxInactiveInterval() %>초<br> <!-- 단위 초,sec -->
<%
//세션 유지 시간 변경:
session.setMaxInactiveInterval(3600);
%><br>
세션 유지 시간 변경 : <%=session.getMaxInactiveInterval() %><br>
<%
// 사용자가 로그 아웃(세션기억장소 전체 삭제 명령)
//session.invalidate();
//세션 영역에 속성을 생성(저장)
session.setAttribute("sessionName","sessionValue");
%><br>
세션 값 가져오기 : <%=session.getAttribute("sessionName") %><br>



</body>
</html>