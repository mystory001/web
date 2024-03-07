<!-- 231226 -->
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.cj.exceptions.RSAException"%>ort="com.itwill.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/02list.jsp</title>
</head>
<body>
<%
//BoardDAO 객체생성
BoardDAO boardDAO = new BoardDAO();
//ArrayList<BoardDTO> 리턴할 형, getBoardList() 메소드 정의
//ArrayList<BoardDTO> boardList =  getBoardList() 메소드 호출
ArrayList<BoardDTO> boardList = boardDAO.getBoardList();


%>
<h1>board/list.jsp</h1>
<h1>게시판 글 목록</h1>
<table border="1">
<tr><td>글 번호</td><td>글쓴이</td><td>제목</td><td>조회수</td><td>작성일</td></tr>
<%
for(int i = 0 ; i < boardList.size(); i++){
	BoardDTO boardDTO = boardList.get(i);
%>
<tr><td><%=boardDTO.getNum() %></td>
	<td><%=boardDTO.getName() %></td>
	<td><a href="content.jsp?num=<%=boardDTO.getNum() %>"><%=boardDTO.getSubject() %></a></td>
	<td><%=boardDTO.getReadcount() %></td>
	<td><%=boardDTO.getDate() %></td></tr>

<% 
}
%>



</table>
</body>
</html>