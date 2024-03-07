<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/form4.jsp</title>
</head>
<body>
<h1>jsp1/form4.jsp</h1>
<form action="formPro4.jsp" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pw"><br>
성별 : <input type="radio" name="gender" value="남"> 남성
<input type="radio" name="gender" value="여"> 여성<br>
<!-- radio name을 같게 하면 그룹으로 묶어서 둘 중 하나 선택가능 -->
취미 : <input type="checkbox" name="hobby" value="게임">게임
<input type="checkbox" name="hobby" value="여행">여행
<input type="checkbox" name="hobby" value="축구">축구<br>
<!-- checkbox name이 같더라도 여러 개 선택 가능 -->
등급 : <select name="grade">
		<option value="1">1등급</option>
		<option value="2">2등급</option>
		<option value="3">3등급</option>
</select><br>
자기소개 : <textarea name="intro" rows="5" cols="10">value값</textarea><br>
<input type="submit" value="회원가입"> 
</form>
</body>
</html>