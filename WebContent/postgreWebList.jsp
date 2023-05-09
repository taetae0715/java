<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	String DRIVER = "org.postgresql.Driver";
	String URL = "jdbc:postgresql://localhost/sample";
	String USER = "postgres";
	String PASS = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	try {
		Class.forName(DRIVER); 
		try {
			conn = DriverManager.getConnection(URL,USER,PASS);
			sql = "select * from tbl_emp_202108 order by empno";
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>포스트그리 데이터베이스 테이블 목록 조회</title>
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
	<h1>사원정보 테이블</h1>
	<hr>
	<nav>
		<a href="index.jsp">메인 목록</a>
		<a href="postgreWebInsert.jsp">사원 등록</a>
	</nav>
	<hr>
	<table>
		<thead>
			<tr><th>사원번호</th><th>사원명</th><th>부서코드</th><th>전화번호</th></tr>		
		</thead>
		<tbody>
<%
							while(rs.next()){
%>
			<tr>
				<td>
					<a href="postgreWebUpdate.jsp?empno=<%=rs.getString("empno") %>">
						<%=rs.getString("empno") %>
					</a>
				</td>
				<td><%=rs.getString("empname") %></td>
				<td><%=rs.getString("deptcode") %></td>
				<td><%=rs.getString("tel1") %>-<%=rs.getString("tel2") %>-<%=rs.getInt("tel3") %></td>
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