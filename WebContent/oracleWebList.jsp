<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	String DRIVER = "oracle.jdbc.driver.OracleDriver";
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String USER = "system";
	String PASS = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	try {
		Class.forName(DRIVER); 
		try {
			conn = DriverManager.getConnection(URL,USER,PASS);
			sql = "select * from tbl_member_202201";
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>오라클 데이터베이스 테이블 목록 조회</title>
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
	<h1>수강생 정보 테이블</h1>
	<hr>
	<nav>
		<a href="index.jsp">메인 목록</a>
		<a href="oracleWebInsert.jsp">수강 등록</a>
		
	</nav>
	<hr>
	<table>
		<thead>
			<tr>
				<th>순번</th>	<th>과정코드</th><th>과정명</th><th>강사명</th>
				<th>이름</th><th>전화번호</th><th>등록일</th>
			</tr>		
		</thead>
		<tbody>
<%
							while(rs.next()){
					String t1 = rs.getString("phone").substring(0, 3); //010
					String t2 = rs.getString("phone").substring(3, 7); //2222
					String t3 = rs.getString("phone").substring(7); //1111
					String tel = t1 + "-" + t2 + "-" + t3;
					
					String y = rs.getString("regist_date").substring(0, 4); //2022
					String m = rs.getString("regist_date").substring(4, 6); //01
					String d = rs.getString("regist_date").substring(6); //01
					String date1 = y + "-" + m + "-" + d; //2022-01-01
%>
			<tr>
				<td><%=rs.getInt("member_seq") %></td>
				
				<td><%=rs.getString("c_no") %></td>
				<td><%=rs.getString("c_no") %></td>
				<td>
					<a href="oracleWebUpdate.jsp?c_no=<%=rs.getString("c_no") %>">
						<%=rs.getString("name") %>님
					</a>
				</td>
				<td><%=tel %></td>
				<td><%=date1 %></td>
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