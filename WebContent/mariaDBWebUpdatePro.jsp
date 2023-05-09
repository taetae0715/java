<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	int credit = Integer.parseInt(request.getParameter("credit"));
	int week = Integer.parseInt(request.getParameter("week"));
	int start_hour = Integer.parseInt(request.getParameter("start_hour"));
	int end_end = Integer.parseInt(request.getParameter("end_end"));
	
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
			sql = "update coures_tbl set name=?, credit=?, lecturer=?, week=?, start_hour=?, end_end=? where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, request.getParameter("name"));
				pstmt.setInt(2, credit);
				pstmt.setString(3, request.getParameter("lecturer"));
				pstmt.setInt(4, week);
				pstmt.setInt(5, start_hour);
				pstmt.setInt(6, end_end);
				pstmt.setString(7, request.getParameter("id"));
				
				a = pstmt.executeUpdate();
				
				if(a>0){
					System.out.println("강의 정보 수정 성공");
				} else {
					System.out.println("강의 정보 수정 실패");
				}
				
				pstmt.close();
				conn.close();
				response.sendRedirect("mariaDBWebList.jsp");
				
			} catch(SQLException x) {
				System.out.println("SQL 구문 실패"+x);
			}
		} catch(SQLException x){
			System.out.println("연결 실패"+x);
		}
	} catch(ClassNotFoundException x){
		System.out.println("드라이버 로딩 실패"+x);
	}
%>