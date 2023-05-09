<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>수강생 정보 수정</title>
<style>
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");	
		response.setContentType("text/html; charset=utf-8");
		String c_no = request.getParameter("c_no");
		
		String DRIVER = "oracle.jdbc.driver.OracleDriver";
		String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		String USER = "system";
		String PASS = "1234";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		String name = "";
		String phone = "";
		String address = "";
		int seq = 0;
		
		try {
			Class.forName(DRIVER); 
			try {
				conn = DriverManager.getConnection(URL,USER,PASS);
				sql = "select * from TBL_MEMBER_202201 where c_no=?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, c_no);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						phone = rs.getString("phone");
						address = rs.getString("address");
						seq = rs.getInt("member_seq");
						name = rs.getString("name");
					}
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
	<nav>
		<a href="index.jsp">메인으로</a>
		<a href="oracleWebList.jsp">수강생 목록</a>
	</nav>
	<hr>
	<h2>수강생 정보 수정</h2>
	<hr>
	<form action="oracleWebUpdatePro.jsp" method="post">
		<table>
			<tbody>
				<tr>
					<th>순번</th><td><%=seq %></td>
				</tr>
				<tr>
					<th>수강코드</th>
					<td><%=c_no %></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=name %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=phone %></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><%=address %></td>
				</tr>
				<tr><td colspan="2"></td></tr>
				<tr><td colspan="2">
					<input type="submit" value="수정"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
					<a href="oracleWebDel.jsp?c_no=<%=c_no %>">수강 삭제</a>
					</td></tr>
			</tbody>
		</table>
	</form>
</body>
</html>