<%@page import="member.LoginInfo1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	LoginInfo1 li = (LoginInfo1)session.getAttribute("loginInfo");
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

body {
	background-image: url(/SurfingHomepage/css/images/5.jpg);
	background-size: 100% 1000px;
	background-repeat: no-repeat;
	max-width: 960px;
	min-width: 500px;
	margin: 0 auto;
}

#wrap {
	margin: 50px;
}

h1 {
	text-align: center;
	margin: 10px;
}
</style>
</head>
<body>

	<div id="wrap">
		<h1>[탈퇴]비밀번호를 다시 입력해주세요</h1>
		<form action="deleteMem.jsp" method="post">
		아이디 <input type="text" name="id" value="<%=li.getId()%>"> 
		비밀번호 <input type="password"	name="pw"> 
		<input type="submit" value="입력">
		</form>
	</div>
</body>
</html>
