<!-- 231221 -->

<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/01writePro.jsp</title>
</head>
<body>
<h1>board/writePro.jsp</h1>
<%
//사용자가 입력한 글 내용을 서버에 전달하면 request 저장
//requset 한글처리
request.setCharacterEncoding("utf-8");
//request에서 파라미터(태그)값(name, subject, content)을 가져와서 변수에 저장
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String content = request.getParameter("content");


//Board DAO 객체생성
BoardDAO boardDAO = new BoardDAO();


//int형 리턴할 형 getMaxNum()메소드 정의


//num, readcount, date 구하기
//max(num)+1
int num = boardDAO.getMaxNum()+1;

//조회수(readcount) 초기값은 0
int readcount = 0;
//날짜(date) 현 시스템 날짜 설정
Timestamp date = new Timestamp(System.currentTimeMillis());


//게시판내용을 저장하는 자바파일 준비
//폴더(패키지) board 파일이름 BoardDTO
//멤버변수 정의(private) 데이터 은닉 → 접근할 수 있는 setter, getter생성
//BoardDTO 객체생성(기억장소 할당)
//set메소드 호출(멤버 변수 기억장소에 파라미터(태그)값을 저장)
BoardDTO boardDTO = new BoardDTO();
System.out.println("BoardDTO 주소 : " + boardDTO);
boardDTO.setName(name);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
boardDTO.setNum(num);
boardDTO.setReadcount(readcount);
boardDTO.setDate(date);


//게시판 데이터베이스 작업을 하는 자바파일준비
//폴더(패키지) board 파일이름 BoardDAO
//리턴값 없음 insertBoard(MemberDTO 변수) 메소드 정의()
//insertBoard(BoardDTO 주소) 메소드 호출
System.out.println("BoardDAO 주소 : " + boardDAO);
boardDAO.insertBoard(boardDTO);

//글목록 이동
response.sendRedirect("list.jsp");




%>
</body>
</html>