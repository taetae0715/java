<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	int tel3 = Integer.parseInt(request.getParameter("tel3"));
	
	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/sample";
	String user = "postgres";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	int a = 0;
	
	try {
		Class.forName(driver);
		try {
			conn = DriverManager.getConnection(url, user, pass);
			sql = "update tbl_emp_202108 set empname=?, tel1=?, tel2=?, tel3=?, deptcode=?, position=? where empno=?";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, request.getParameter("empname"));
				
				pstmt.setString(2, request.getParameter("tel1"));
				pstmt.setString(3, request.getParameter("tel2"));
				pstmt.setInt(4, tel3);
				
				pstmt.setString(5,  ("deptcode"));
				pstmt.setString(6,  request.getParameter("position"));
				
				pstmt.setString(7, request.getParameter("empno"));
				
				a = pstmt.executeUpdate();
				
				if(a>0){
					System.out.println("사원 정보 수정 성공");
				} else {
					System.out.println("사원 정보 수정 실패");
				}
				
				pstmt.close();
				conn.close();
				response.sendRedirect("postgreWebList.jsp");
				//response.sendRedirect("index.jsp");
			} catch(SQLException e){
				System.out.println("SQL 오류"+e);
			}
		} catch(SQLException e){
			System.out.println("DB 연결 실패"+e);
		}
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로딩 실패"+e);
	}
%>