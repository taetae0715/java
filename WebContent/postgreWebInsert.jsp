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
		<a href="postgreWebList.jsp">사원 목록</a>
	</nav>
	<h2>사원 정보 등록</h2>
	<form action="postgreWebInsertPro.jsp" method="post">
		<label for="empno">사원번호</label>:
		<input type="text" name="empno" id="empno" required placeholder="사원번호 4자리"><br><br>
		
		<label for="empname">사원명</label>&nbsp;&nbsp;:
		<input type="text" name="empname" id="empname" required><br><br>
		
		<label for="tel1">tel1</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
		<input type="text" name="tel1" id="tel1" placeholder="ex) 시작번호"><br><br>
		
		<label for="tel2">tel2</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
		<input type="text" name="tel2" id="tel2" placeholder="ex) 중간번호"><br><br>
		
		<label for="tel3">tel3</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
		<input type="text" name="tel3" id="tel3" placeholder="ex) 끝번호"><br><br>
		
		<label for="deptcode">부서코드</label>:
		<input type="text" name="deptcode" id="deptcode" placeholder="ex) 10~60 10단위 기입"><br><br>
		
		<label for="position">직급코드</label>:
		<input type="text" name="position" id="position" required placeholder="ex) 1~6"><br><br>
		
		<input type="submit" value="사원 등록">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="초기화">
	</form>
</body>
</html>