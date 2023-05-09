<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사원 정보 수정</title>
<style>
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String DRIVER = "org.postgresql.Driver";
		String URL = "jdbc:postgresql://localhost/sample";
		String USER = "postgres";
		String PASS = "1234";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		String empno = request.getParameter("empno");
		
		String empname = "";
		String tel1 = "";
		String tel2 = "";
		int tel3 = 0;
		String deptcode = "";
		String position = "";
		
		try {
			Class.forName(DRIVER);
			try {
				conn = DriverManager.getConnection(URL, USER, PASS);
				sql = "select * from tbl_emp_202108 where empno=?";
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, empno);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						empname = rs.getString("empname");
						tel1 = rs.getString("tel1");
						tel2 = rs.getString("tel2");
						tel3 = rs.getInt("tel3");
						deptcode = rs.getString("deptcode");
						position = rs.getString("position");
					}
					
					rs.close();
					pstmt.close();
					conn.close();
					
				} catch(SQLException e){
					System.out.println("SQL 구문 실행 실패");
				}
			} catch(SQLException e){
				System.out.println("연결 실패");
			}
		} catch(ClassCastException e){
			System.out.println("드라이버 로딩 실패");
		}
	%>
	<nav>
		<a href="index.jsp">메인으로</a>
		<a href="postgreWebList.jsp">사원 목록</a>
	</nav>
	<hr>
	<h2>사원 정보 수정</h2>
	<hr>
	<form action="postgreWebUpdatePro.jsp" method="post">
		<table>
			<tbody>
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="empno" value="<%=empno %>" readonly></td>
				</tr>
				<tr>
					<th>사원명</th>
					<td><input type="text" name="empname" value="<%=empname %>" required></td>
				</tr>
				<tr>
					<th>tel1</th>
					<td><input type="tel" name="tel1" value="<%=tel1 %>" required></td>
				</tr>
				<tr>
					<th>tel2</th>
					<td><input type="tel" name="tel2" value="<%=tel2 %>" required></td>
				</tr>
				<tr>
					<th>tel3</th>
					<td><input type="tel" name="tel3" value="<%=tel3 %>" required></td>
				</tr>
				<tr>
					<th>부서코드</th>
					<td><input type="text" name="deptcode" value="<%=deptcode %>" required></td>
				</tr>
				<tr>
					<th>직급코드</th>
					<td><input type="text" name="position" value="<%=position %>" required></td>
				</tr>
				
				<tr><td colspan="2"></td></tr>
				<tr><td colspan="2">
					<input type="submit" value="수정"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
					<a href="postgreWebDel.jsp?empno=<%=empno %>">사원 정보 삭제</a>
					</td></tr>
			</tbody>
		</table>
	</form>
</body>
</html>
