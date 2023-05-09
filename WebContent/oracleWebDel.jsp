<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>    
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	String c_no = request.getParameter("c_no");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	int a = 0;
	
	try {
		Class.forName(driver);
		try {
			conn = DriverManager.getConnection(url, user, pass);
			sql = "delete from TBL_MEMBER_202201 where c_no=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, c_no);
				a = pstmt.executeUpdate();
				if(a>0){
					System.out.println("정보 삭제 성공");
				} else {
					System.out.println("정보 삭제 실패");
				}
				pstmt.close();
				conn.close();
				response.sendRedirect("oracleWebList.jsp");
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