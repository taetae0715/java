<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>    
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String DRIVER = "org.mariadb.jdbc.Driver";
	String URL = "jdbc:mariadb://127.0.0.1:3308/company";
	String USER = "root";
	String PASS = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "";
	int a = 0;
	
	try {
		Class.forName(DRIVER); 
		try {
			conn = DriverManager.getConnection(URL,USER,PASS);
			sql = "delete from coures_tbl where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("id"));
				a = pstmt.executeUpdate();
				
				if(a>0){
					System.out.println("강의 삭제 성공");
				} else {
					System.out.println("강의 삭제 실패");
				}
				pstmt.close();
				conn.close();
				response.sendRedirect("mariaDBWebList.jsp");
				
			} catch(SQLException e) {
				System.out.println("SQL 구문 실패");
			}
		} catch(SQLException e){
			System.out.println("연결 실패");
		}
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로딩 실패");
	}
	
%>