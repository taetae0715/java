<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    String name = "조태정";
    int age = 29;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>메인 페이지</title>
<style>
</style>
</head>
<body>
	<h1>메인 페이지</h1>
	<h2>저의 이름은 <%=name %>이며, 나이는 <%=age %>세입니다.</h2>
	<p>여기는 메인 페이지 테스트 문장 구간입니다.</p>
	<h3>목록 보기</h3>
	<nav>
		<ul>
			<li><span>오라클</span>
				<ul>
					<li><a href="oracleWebList.jsp">오라클 목록 보기</a></li>
					<li><a href="oracleWebInsert.jsp">오라클 데이터 추가</a></li>
				</ul>
			</li>
			<li><span>마이에스큐엘</span>
				<ul>
					<li><a href="mysqlWebList.jsp">마이에스큐엘 목록 보기</a></li>
					<li><a href="mysqlWebInsert.jsp">마이에스큐엘 데이터 추가</a></li>
				</ul>
			</li>
			<li><span>마리아디비</span>
				<ul>
					<li><a href="mariaDBWebList.jsp">마리아디비 목록 보기</a></li>
					<li><a href="mariaDBWebInsert.jsp">마리아디비 데이터 추가</a></li>
				</ul>
			</li>
			<li><span>포스트그리</span>
				<ul>
					<li><a href="postgreWebList.jsp">포스트그리 목록 보기</a></li>
					<li><a href="postgreWebInsert.jsp">포스트그리 데이터 추가</a></li>
				</ul>
		</ul>
	</nav>
</body>
</html>