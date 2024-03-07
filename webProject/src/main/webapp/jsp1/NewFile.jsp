<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewFile</title>
</head>
<body>
<h1>회원가입</h1>

<!-- <form action="NewFile1.jsp" method="get"> -->
<!-- 아이디 : <input type="text" name="id"> -->
<!-- 비밀번호 : <input type="password" name="pw"> -->
<!-- <input type="submit" value="로그인"> -->
<!-- </form> -->

<!-- <form action="NewFile1.jsp" method="get"> -->
<!-- 이름 : <input type="text" name="name"> -->
<!-- 나이 : <input type="text" name="age"> -->
<!-- <input type="submit" value="전송"> -->
<!-- </form> -->

<!-- <form action="NewFile1.jsp" method="post"> -->
<!-- 이름 : <input type="text" name="name"> -->
<!-- 나이 : <input type="text" name="age"> -->
<!-- <input type="submit" value="전송"> -->
<!-- </form> -->

<form action="NewFile1.jsp" method="post">
<h1>회원 가입</h1>
이름 : <input type="text" name="name" placeholder="영문,한글,숫자 15자이내" maxlength="15"><br>
비밀번호 : <input type="password" name="pw" placeholder="숫자,특수문자 포함 30자이내" maxlength="30"><br>
성별 : <input type="radio" name="gender" value="남자">남자
<input type="radio" name="gender" value="여자">여자<br>
취미 : <input type="checkbox" name="hobby" value="운동">운동
<input type="checkbox" name="hobby" value="독서">독서
<input type="checkbox" name="hobby" value="공부">공부<br>
등급 : 
<select name="grade">
<option value="1">1등급</option>
<option value="2">2등급</option>
<option value="3">3등급</option>
<option value="4">4등급</option>
</select><br>
특이사항 : <textarea name="extra" rows="8" cols="15">value값</textarea><br>
<input type="submit" value="완료">
</form>
</body>
</html>