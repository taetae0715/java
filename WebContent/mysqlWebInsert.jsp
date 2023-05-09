<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<nav>
		<a href="index.jsp">메인 목록</a>
		<a href="mysqlWebList.jsp">회원 목록</a>
	</nav>
	<h2>회원 등록</h2>
	<form action="mysqlInsertPro.jsp" method="post">
		<label for="id">아이디</label>&nbsp;&nbsp;&nbsp;:
		<input type="text" name="id" id="id" required><br><br>
		<label for="pw">비밀번호</label>:
		<input type="password" name="pw" id="pw" required><br><br>
		<label for="name">이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
		<input type="text" name="name" id="name" required><br><br>
		<input type="submit" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="초기화">
	</form>
</body>
</html>