<!-- 231228 -->
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/delete.jsp</title>
</head>
<body>
<%
//delete.jsp?num=1
//서버에 request에 "num" 요청 파라미터값을 저장한 후 가져와서 변수 int num저장
int num = Integer.parseInt(request.getParameter("num"));

//BoardDAO 객체생성
BoardDAO boardDAO = new BoardDAO();
//리턴할형 없음. deleteBoard(num) 메소드 정의
//deleteBoard(num) 메소드 호출
boardDAO.deleteBoard(boardDAO.getBoard(num));

response.sendRedirect("list.jsp");

%>



</body>
</html>