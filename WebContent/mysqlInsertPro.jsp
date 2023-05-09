<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");	
	response.setContentType("text/html; charset=utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");

	String DRIVER = "com.mysql.cj.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/sample?serverTimezone=Asia/Seoul";
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
			sql = "insert into test2 values(?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("id"));
				pstmt.setString(2, request.getParameter("pw"));
				pstmt.setString(3, request.getParameter("name"));
				
				a = pstmt.executeUpdate();
				if(a>0){
					System.out.println("가입 성공");
				} else {
					System.out.println("가입 실패");
				}
				
				pstmt.close();
				conn.close();
				
				response.sendRedirect("mysqlWebList.jsp");
				
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