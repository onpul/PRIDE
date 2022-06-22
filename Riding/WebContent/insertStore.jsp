<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertStore</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String addr = request.getParameter("addr");
	String subaddr = request.getParameter("subaddr");
	String latitude = request.getParameter("latitude");
	String longitude = request.getParameter("longitude");
	
	//JDBC 참조 변수 준비
	Connection con = null;
	PreparedStatement pstmt = null;
	String url = "jdbc:oracle:thin:@211.238.142.157:1521:xe";
	String user = "TEAM1", pw="java006$";
	
	//JDBC 드라이버 로딩
	Class.forName("oracle.jdbc.OracleDriver");
	
	//DB 연결
	con = DriverManager.getConnection(url, user, pw);
	
	//sql문 준비
	String sql = "INSERT INTO RESTAURANT(RESTAURANT_ID, USER_ID, LATITUDE, LONGITUDE"
			+ ",RESTA_NAME, REGISTER_DATE, ADDRESS, DETAIL_ADDRESS)"
			+ "VALUES(SEQ_RESTAURANT.NEXTVAL, ?, ? , ? , ? , SYSDATE, ? , ?)";
	
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, writer);
	pstmt.setString(2, latitude);
	pstmt.setString(3, longitude);
	pstmt.setString(4, title);
	pstmt.setString(5, addr);
	pstmt.setString(6, subaddr);
	
	
	
	pstmt.executeUpdate();
	
	

	pstmt.close();
	con.close();	
	
%>
<script>
	
alert("저장 성공");
location.href = "RegisterStore.jsp";

</script>

</body>
</html>