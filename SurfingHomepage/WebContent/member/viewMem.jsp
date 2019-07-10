<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String idx = request.getParameter("idx");
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
  	//JDBC_URL
  	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
  	String user = "scott";
  	String pw = "tiger";
  	
  	try{
  		// 1. 드라이버 로드
  		Class.forName("oracle.jdbc.driver.OracleDriver");
  		
  		// 2. DB 연결 : 커넥션
  		conn = DriverManager.getConnection(jdbcUrl, user, pw);
  		
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	}
	
	body{
		background-image: url(/SurfingHomepage/css/images/5.jpg);
		background-size: 100% 1000px;
		background-repeat: no-repeat;
		max-width: 960px;
		min-width: 500px;
		margin: 0 auto;
	}
	
	#wrap{
		margin : 50px;
	}
	
	h1 {
		text-align: center;
		margin: 10px;
	}
	
	table{
		width : 80%;
		margin : 0 auto;
		border : 0;
		border-collapse: collapse;
	}
	
	table td{
		padding : 3px;
		border : 1px solid black;
	}

	table tr:first-child>td {
		text-align : center;
		font-weight: bold;
	}
	
</style>
</head>
<body>

<div id="wrap">
<h1>회원 정보</h1>

<table>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>사진</td>
		<td>레벨</td>
		<td>가입날짜</td>
	</tr>
	
	<!-- table 행 반복 시작 -->
	<%
		// 3. statement 객체 생성
		stmt = conn.createStatement();
		
		String sql = "select * from SurfingMemberInfo where idx=" + idx;
		
		// 4. sql 실행
		rs = stmt.executeQuery(sql);
		
		// 5. 결과 출력
		while (rs.next()){
	%>
	
	<tr>
		<td><%=rs.getInt(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getInt(7) %></td>
		<td><%=rs.getDate(8) %></td>
	</tr>
	
	<%
		}
	%>
	<!-- table 행 반복 끝 -->
</table>
</div>
</body>
</html>
<%
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		//6. 사용객체 close(): rs, stmt, conn
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
%>