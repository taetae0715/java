<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마리아디비 신규 과정 등록하기</title>
<style>
</style>
</head>
<body>
	<nav>
		<a href="index.jsp">메인 목록</a>
		<a href="mariaDBWebList.jsp">강의 목록</a>
	</nav>
	<h2>신규 과정 등록</h2>
	<form action="mariaDBWebInsertPro.jsp" method="post">
		<label for="id">과정코드</label>:
		<input type="text" name="id" id="id" required placeholder="과정코드 4자리"><br><br>
		
		<label for="name">과정명</label>&nbsp;&nbsp;:
		<input type="text" name="name" id="name" required><br><br>
		
		<label for="credit">학점</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
		<input type="text" name="credit" id="credit" placeholder="ex) 1 ~3 "><br><br>
		
		<label for="lecturer">강사코드</label>:
		<input type="text" name="lecturer" id="lecturer" placeholder="ex) 1 ~ 5"><br><br>
		
		<label for="week">수업일</label>&nbsp;&nbsp;:
		<input type="text" name="week" id="week" placeholder="ex) 월 1 ~ 금 5"><br><br>
		
		<label for="start_hour">시작시간</label>:
		<input type="text" name="start_hour" id="start_hour" placeholder="ex) 9시일 경우 900"><br><br>
		
		<label for="end_end">종료시간</label>:
		<input type="text" name="end_end" id="end_end" placeholder="ex) 13시일 경우 1300"><br><br>
		
		<input type="submit" value="과정 등록">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="초기화">
	</form>
</body>
</html>