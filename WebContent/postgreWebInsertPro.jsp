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
			sql = "insert into tbl_emp_202108 values (?, ?, ?, ?, ?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, request.getParameter("empno"));
				pstmt.setString(2, request.getParameter("empname"));
				
				pstmt.setString(3, request.getParameter("tel1"));
				pstmt.setString(4, request.getParameter("tel2"));
				pstmt.setInt(5, tel3);
				
				pstmt.setString(6,  request.getParameter("deptcode"));
				pstmt.setString(7,  request.getParameter("position"));
				
				a = pstmt.executeUpdate();
				if(a>0){
					System.out.println("사원 등록 성공");
				} else {
					System.out.println("사원 등록 실패");
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