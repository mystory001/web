<!-- 231226 -->
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/03content.jsp</title>
</head>
<body>
<%
//요청 주소 : content.jsp?num=1
//서버에 request에 "num"요청 파라미터값을 저장 → 가져와서 변수 int num에 저장
int num = Integer.parseInt(request.getParameter("num"));
//BoardDAO 객체생성
BoardDAO boardDAO = new BoardDAO();

//조회수 증가
//리턴할형 없음. updateReadcount(int num) 메소드 정의
//BoardDTO boardDTO = boardDTO.updateReadcount(num) 메소드 호출
boardDAO.updateReadcount(num);

//BoardDTO 리턴할 형, getBoard()(int num) 메소드 정의
//BoardDTO boardDTO = BoardDTO getBoard(num값) 메소드 호출
BoardDTO getBoard = boardDAO.getBoard(num);

//로그인 표시값 세션에서 가져오기
String id = (String)session.getAttribute("id");
%>


<h1>board/content.jsp</h1>
<h1>글 내용 보기[아이디 : <%=id %>]</h1>
<table border="1">
<tr><td>글번호</td><td><%=getBoard.getNum() %></td></tr>
<tr><td>작성자</td><td><%=getBoard.getName() %></td></tr>
<tr><td>조회수</td><td><%=getBoard.getReadcount() %></td></tr>
<tr><td>작성날짜</td><td><%=getBoard.getDate() %></td></tr>
<tr><td>제목</td><td><%=getBoard.getContent() %></td></tr>
<tr><td>내용</td><td><%=getBoard.getContent() %></td></tr>
<tr><td colspan="2">
<%
//로그인 표시값이 있으면 
if(id!=null){
	//로그인 표시값, 글쓴이가 일치하면 글 수정, 글 삭제
	if(id.equals(getBoard.getName()) || id.equals("admin")){
		
	%>
	<a href="update.jsp?num=<%=getBoard.getNum()%>">글수정</a>
	<a href="delete.jsp?num=<%=getBoard.getNum()%>">글삭제</a>
	<%
	}
}
%>
<a href="list.jsp">목록</a></td></tr>
</table>
</body>
</html>