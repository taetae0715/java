<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>강의 정보 수정</title>
<style>
</style>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String DRIVER = "org.mariadb.jdbc.Driver";
		String URL = "jdbc:mariadb://127.0.0.1:3308/company";
		String USER = "root";
		String PASS = "1234";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		String id = request.getParameter("id");
		
		String lecturer = "";
		String name = "";
		int credit = 0;
		int week = 0;
		int start_hour = 0;
		int end_end = 0;
		
		try {
			Class.forName(DRIVER); 
			try {
				conn = DriverManager.getConnection(URL,USER,PASS);
				sql = "select * from coures_tbl where id=?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						name = rs.getString("name");
						lecturer = rs.getString("lecturer");
						credit = rs.getInt("credit");
						week = rs.getInt("week");
						start_hour = rs.getInt("start_hour");
						end_end = rs.getInt("end_end");
					}
					
					rs.close();
					pstmt.close();
					conn.close();
					
				} catch(SQLException e){
					System.out.println("SQL 구문 실행 실패"+e);
				}
			} catch(SQLException e){
				System.out.println("연결 실패"+e);
			}
		} catch(ClassCastException e){
			System.out.println("드라이버 로딩 실패"+e);
		}
	%>
	<nav>
		<a href="index.jsp">메인으로</a>
		<a href="mariaDBWebList.jsp">강의 목록</a>
	</nav>
	<hr>
	<h2>강의 정보 수정</h2>
	<hr>
	<form action="mariaDBWebUpdatePro.jsp" method="post">
		<table>
			<tbody>
				<tr>
					<th>과정코드</th>
					<td><input type="text" name="id" value="<%=id%>" readonly></td>
				</tr>
				<tr>
					<th>과정명</th>
					<td><input type="text" name="name" value="<%=name %>" required></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input type="text" name="credit" value="<%=credit %>" required></td>
				</tr>
				<tr>
					<th>강사코드</th>
					<td><input type="text" name="lecturer" value="<%=lecturer %>" required></td>
				</tr>
				<tr>
					<th>수업일</th>
					<td><input type="text" name="week" value="<%=week %>" required></td>
				</tr>
				<tr>
					<th>시작시간</th>
					<td><input type="text" name="start_hour" value="<%=start_hour %>" required></td>
				</tr>
				<tr>
					<th>종료시간</th>
					<td><input type="text" name="end_end" value="<%=end_end %>" required></td>
				</tr>
				
				<tr><td colspan="2"></td></tr>
				<tr><td colspan="2">
					<input type="submit" value="수정"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
					<a href="mariaDBWebDel.jsp?id=<%=id %>">강의 삭제</a>
					</td></tr>
			</tbody>
		</table>
	</form>
</body>
</html>