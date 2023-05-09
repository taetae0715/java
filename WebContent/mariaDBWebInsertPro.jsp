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
	
	int credit = Integer.parseInt(request.getParameter("credit"));
	int week = Integer.parseInt(request.getParameter("week"));
	int start = Integer.parseInt(request.getParameter("start_hour"));
	int end = Integer.parseInt(request.getParameter("end_end"));
			
	try {
		Class.forName(DRIVER); 
		try {
			conn = DriverManager.getConnection(URL,USER,PASS);
			sql = "insert into coures_tbl values (?, ?, ?, ?, ?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, request.getParameter("id"));
				pstmt.setString(2, request.getParameter("name"));
				pstmt.setInt(3, credit);
				pstmt.setString(4, request.getParameter("lecturer"));
				pstmt.setInt(5, week);
				pstmt.setInt(6, start);
				pstmt.setInt(7, end);
				
				a = pstmt.executeUpdate();
				
				if(a>0){
					System.out.println("강의 등록 성공~!");
				} else {
					System.out.println("강의 등록 실패~!");
				}
				
				pstmt.close();
				conn.close();
				response.sendRedirect("mariaDBWebList.jsp");
				//response.sendRedirect("index.jsp");
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