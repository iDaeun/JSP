<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <jsp:useBean id="loginInfo" class="member.memberInfo" scope="session"/> --%>
	
	<%
		LoginInfo loginInfo = (LoginInfo)session.getAttribute("loginInfo");
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<!-- css파일 연결해주기 -->
<link href="/m2/css/default.css" rel="stylesheet" type="text/css">
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Merienda+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<body>
<div id="main_wrap">
<!-- 해더 시작 , 상대경로 -->
<%@include file="../frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- nav 시작 -->
<%@include file="../frame/nav.jsp" %>
<!-- nav 끝 -->

<!-- contents 시작 -->
<div id="contents">
	
		<% if(loginInfo != null){ %>	
		<h2>회원 정보 페이지</h2>
		<hr>
		
			<img src="../images/<%=loginInfo.getuPhoto() %>">
			<h4>이름: <%=loginInfo.getuName() %></h4>
			<h4>아이디: <%=loginInfo.getuId() %></h4>
			
			<%} else { %>
			
			<script>
				alert('로그인 후 이용가능한 페이지입니다');
				location.href="login.jsp";
			</script>
			
			<%} %>
</div>
<!-- contents 끝 -->
	

<!-- footer 시작 -->
<%@include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</div>
</body>
</html>