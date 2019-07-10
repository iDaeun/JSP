<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="Login" class="member.LoginInfo" />
    
    <%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    int resultCnt = 0;
    
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
	
	
	
</style>
</head>
<body>

<div id="wrap">
<h1>회원 탈퇴 완료</h1>


	<%
		// 3. statement 객체 생성
		stmt = conn.createStatement();
		
		String sql = "delete from SurfingMemberInfo where id ="+ Login.getId();
		// 4. 로그인되어있는 아이디값 참고 -> DB에서 정보 삭제
		resultCnt = stmt.executeUpdate(sql);
		
		
	%>
	
	<h3><%=resultCnt %>개 행이 삭제되었습니다</h3>
	<a href="<%=request.getContextPath()%>">메인 페이지로 돌아가기</a>

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