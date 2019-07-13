<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int resultCnt = 0;
    
  	try{
  		// 1. 드라이버 로드
  		Class.forName("oracle.jdbc.driver.OracleDriver");
  		
  		// 2. DB 연결 : 커넥션
  		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
  		
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
 
	<%
		// 3. Preparedstatement 객체 생성
		String sql = "select pw from SurfingMemberInfo where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		// 4. 해당 아이디의 pw가 일치한지 확인
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String pwCheck = rs.getString(1);
			if(pwCheck.equals(pw)){
				// 일치 -> delete 진행
				String sql1 = "delete from SurfingMemberInfo where id = ?";
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, id);
				resultCnt = pstmt.executeUpdate();
				%>
				<!-- delete 완료 후 메인페이지로 이동 -->
				<script>
				alert('회원탈퇴 완료');
				alert('<%=resultCnt%>행이 삭제되었습니다');
				location.href = '<%=request.getContextPath()%>'
				</script>
				<%
			} else {
				// 불일치 -> 회원탈퇴 페이지 -> 다시 요청
				%>
				<script>
				alert('비밀번호가 불일치, 다시 입력해 주세요!');
				location.href = 'deleteMemForm.jsp';
				</script>
				<%
			}
		} else {
			// 불일치 -> 회원탈퇴 페이지 -> 다시 요청
			%>
			<script>
			alert('비밀번호가 불일치, 다시 입력해 주세요!');
			location.href = 'deleteMemForm.jsp';
			</script>
			<%
		}
		
		
		
		
		
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

		if (pstmt != null) {
			try {
				pstmt.close();
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