<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	String DRIVER = "org.mariadb.jdbc.Driver";
	String URL = "jdbc:mariadb://127.0.0.1:3308/company";
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
			sql = "select * from coures_tbl order by start_hour";
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마리아디비 데이터베이스 테이블 목록 조회</title>
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
	<h1>강의 정보 테이블</h1>
	<hr>
	<nav>
		<a href="index.jsp">메인 목록</a>
		<a href="mariaDBWebInsert.jsp">신규 과정 추가</a>
	</nav>
	<hr>
	<table>
		<thead>
			<tr>
			<th>과정코드</th><th>과정명</th><th>학점</th><th>강사코드</th><th>수업일</th><th>수업시간</th>
			</tr>		
		</thead>
		<tbody>
<%
							while(rs.next()){
								//요일 표시
								String w = "";
								if(rs.getInt("week")==1) {w = "월";} 
								else if(rs.getInt("week")==2) {w = "화";} 
								else if(rs.getInt("week")==3) {w = "수";} 
								else if(rs.getInt("week")==4) {w = "목";} 
								else if(rs.getInt("week")==5) {w = "금";} 
								else {w = "해당없음";}
%>
			<tr>
				<td>
					<a href="mariaDBWebUpdate.jsp?id=<%=rs.getString("id") %>">
						<%=rs.getString("id") %></a>
				</td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getInt("credit") %>학점</td>
				<td><%=rs.getString("lecturer") %></td>
				<td><%=w %></td>
				<td><%=rs.getInt("start_hour") %> ~ <%=rs.getInt("end_end") %></td>
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