<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");	
	response.setContentType("text/html; charset=utf-8");
	
	String c_no = request.getParameter("c_no");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String regist_date = request.getParameter("regist_date");
	String c_type = request.getParameter("c_type");

	String DRIVER = "oracle.jdbc.driver.OracleDriver";
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String USER = "system";
	String PASS = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	int a = 0;
	
	try {
		Class.forName(DRIVER); 
		try {
			conn = DriverManager.getConnection(URL,USER,PASS);
			sql = "insert into TBL_MEMBER_202201 values(member_seq.nextval, ?, ?, ?, ?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("c_no"));
				pstmt.setString(2, request.getParameter("name"));
				pstmt.setString(3, request.getParameter("phone"));
				pstmt.setString(4, request.getParameter("address"));
				pstmt.setString(5, request.getParameter("regist_date"));
				pstmt.setString(6, request.getParameter("c_type"));
				
				a = pstmt.executeUpdate();
				if(a>0){
					System.out.println("수강생 등록 성공");
				} else {
					System.out.println("수강생 등록 실패");
				}
				
				pstmt.close();
				conn.close();
				
				response.sendRedirect("oracleWebList.jsp");
				
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