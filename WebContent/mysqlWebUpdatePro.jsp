<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
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
			sql = "update test2 set pw=?, name=? where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pw);
				pstmt.setString(2, name);
				pstmt.setString(3, id);
				
				a = pstmt.executeUpdate();
				if(a>0){
					System.out.println("수정 성공");
				} else {
					System.out.println("수정 실패");
				}
				
				pstmt.close();
				conn.close();
				response.sendRedirect("mysqlWebList.jsp");
				//response.sendRedirect("index.jsp");
			} catch(SQLException e){
				System.out.println("SQL 오류~!"+e);
			}
		} catch(SQLException e){
			System.out.println("연결 실패~!"+e);
		}
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로딩 실패~!"+e);
	}
%>