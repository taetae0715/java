<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	String DRIVER = "com.mysql.cj.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/sample?serverTimezone=Asia/Seoul";
	String USER = "root";
	String PASS = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	try {
		Class.forName(DRIVER); 
		try {
			conn = DriverManager.getConnection(URL,USER,PASS);
			sql = "select * from test2";
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이에스큐엘 데이터베이스 테이블 목록 조회</title>
<style>
table { display:table; width:800px; margin:10px auto; 
border-bottom:1px solid #333; 
border-collapse:collapse; }
tr { display:table-row; }
th, td { display:table-cell; border-top:1px solid #333;
text-align:center; line-height:36px; }
th { background-color:#333; color:#fff; }
</style>
</head>
<body>
	<h1>회원 정보 테이블</h1>
	<hr>
	<nav>
		<a href="index.jsp">메인 목록</a>
		<a href="mysqlWebInsert.jsp">회원 등록</a>
	</nav>
	<hr>
	<table>
		<thead>
			<tr><th>아이디</th><th>비밀번호</th><th>이름</th></tr>		
		</thead>
		<tbody>
<%
							while(rs.next()){
					String p = rs.getString("pw").substring(0, 1);
%>
			<tr>
				<td>
					<a href="mysqlWebUpdate.jsp?id=<%=rs.getString("id") %>">
						<%=rs.getString("id") %>
					</a>
				</td>
				<td><%=p %>***</td>
				<td><%=rs.getString("name") %></td>
			</tr>
<%
						}
%>		
		</tbody>
	</table>					
</body>
</html>
<%
							rs.close();
							pstmt.close();
							conn.close();
					} catch (SQLException e) {
						System.out.println("SQL 전송 실패"+e);
					}
				} catch (SQLException e) {
					System.out.println("DB 연결 실패"+e);
				}
		} catch (ClassNotFoundException e) {
			System.out.println("DRIVER 로딩 실패"+e);
		}
%>