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
		<a href="oracleWebList.jsp">수강생 목록</a>
	</nav>
	<h2>수강생 정보 등록</h2>
	<form action="oracleInsertPro.jsp" method="post">
		<label for="c_no">학번코드</label>:
		<input type="text" name="c_no" id="c_no" required placeholder="학번 코드 5자리"><br><br>
		<label for="name">이름</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
		<input type="text" name="name" id="name" required><br><br>
		<label for="phone">전화번호</label>:
		<input type="tel" name="phone" id="phone" placeholder="공백,  -,  *  제외 11자리"><br><br>
		<label for="address">주소</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
		<input type="text" name="address" id="address" placeholder="ex) 고양시 덕양구"><br><br>
		<label for="regist_date">등록일</label>&nbsp;&nbsp;&nbsp;:
		<input type="text" name="regist_date" id="regist_date" required placeholder="ex) YYYYMMDD"><br><br>
		<label>타입</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
		<input type="radio" name="c_type" id="일반" checked>일반&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="c_type" id="vip">VIP<br><br>
		<input type="submit" value="수강 등록">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="초기화">
	</form>
</body>
</html>