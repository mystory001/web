<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/formPro3.jsp</title>
</head>
<body>
<h1>jsp1/formPro3.jsp</h1>
<%
//method="post"형태로 데이터가 전송되어지면 특이한 방식으로 전송 → 먼저 request 한글처리 설정 
request.setCharacterEncoding("utf-8");

//http://localhost:8080/webProject/jsp1/formPro3.jsp?nikname=abc&age=20
//사용자가 입력한 정보를 서버에 전달되어지면 서버 request 기억 장소가 할당 
//→ request 기억 장소에 사용자가 입력한 요청 정보가 저장
//→ request기억 장소에 nickname=abc(값), age=20(값) 저장된 값을 가져와서 
//→ String 변수에 저장 → 변수를 출력
String nickname = request.getParameter("nickname");
String age = request.getParameter("age");
//문자열형(참조형)을 정수형(기본자료형)으로 변경하는 명령(메소드, 함수)
//Integer.parseInt(숫자형태의 문자열형) → 리턴할형 int형으로 리턴
int age1 = Integer.parseInt(age);
int age2 = Integer.parseInt(request.getParameter("age"));

//JSP 내장객체
//1) request JSP 내장객체 → HttpServletRequest 자바내장객체 → 기억장소할당(객체생성)
//	 웹 애플리케이션 서버(WAS) 자동으로 HttpServletRequest()
//	 → 클라이언트의 HTTP 요청정보를 저장하는 객체(HTTP 헤더정보, 파라미터(태그),...)
// 	 HttpServletRequest 자바내장객체 메소드()
// 	 request.getParameter("파라미터이름") → 리턴타입 String[] 배열
//	 → 파라미터 value값 여러개 저장해서 리턴
//2) resopnse JSP 내장객체 → HttpServletResponse 자바내장객체 → 기억장소할당
//	 → HTTP 요청에 대한 응답 정보를 저장하는 객체
//3) session JSP 내장객체 → HttpSession 자바내장객체 → 기억장소할당
//	 → 클라이언트의 세션 정보(연결 정보)를 저장한 객체
//4) pageContext JSP내장객체 → PageContext 자바내장객체 → 기억장소할당
//	 → 페이지 실행에 필요한 컨텍스트 정보(프로젝트 한 페이지 정보)를 저장한 객체
//5) out JSP내장객체 → JspWriter 자바내장객체 → 기억장소할당
//	 → 응답 페이지 전송을 위한 출력 스프림(출력 정보 저장) 객체
//6) application JSP내장객체 → ServletContext 자바내장객체 → 기억장소할당
//	 → 애플리케이션의 컨텍스트 정보(서버 정보)를 저장한 객체
//7) config, page, exception
%>

닉네임 : <%=nickname %> <br>
나이 : <%=age %> <br>
정수형 변경된 나이 : <%=age1 %><br>

나이 + 100(문자와 숫자 연결) : <%=age+100 %> <br>
정수형 변경된 나이 + 100(정수와 정수 더하기) : <%=age1+100 %><br>

<!-- 나이가 20세 이상이면 "나이 성인", 20세 미만이면 "나이 미성년" out.println -->
<%
if(age1>=20) {
	out.println(age1 + "세 성인");
} else {
	out.println(age1 + "세 미성년");
}
%><br>
-----------------------<br>
<%
if(age1>=20) {%>
<%=age1 %>세 성인 
<% } else {%>
<%=age1 %>세 미성년
<%}
%>



</body>
</html>