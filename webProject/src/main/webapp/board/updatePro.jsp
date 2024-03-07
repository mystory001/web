<!-- 231228 -->
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/04updatePro.jsp</title>
</head>
<body>
<h1>board/updatePro.jsp</h1>
<h1>글 수정 처리 작업</h1>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");
//사용자가 수정할 내용을 적고 수정버튼을 클릭하면 서버에 전달 request내장객체에 저장
//request num, name, subject, content 파라미터에 가져와서 변수에 저장
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
//BoardDTO 객체 생성
BoardDTO boardDTO = new BoardDTO();
//set메소드 호출해서 변수 내용을 저장
boardDTO.setNum(num);
boardDTO.setName(name);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
System.out.println("BoardDTO 주소 : " + boardDTO);
//BoardDAO 객체 생성
BoardDAO boardDAO = new BoardDAO();
//리턴할 형 없음. updateBoard(BoardDTO 변수) 메소드 정의
System.out.println("BoardDAO 주소 : " + boardDAO);
boardDAO.updateBoard(boardDTO);


response.sendRedirect("list.jsp");

%>
</body>
</html>