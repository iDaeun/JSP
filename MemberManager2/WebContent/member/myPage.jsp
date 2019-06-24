<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="loginInfo" class="member.memberInfo" scope="session"/>
    
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
	<h1>로그인된 회원 정보</h1>
<h3>
	<%= loginInfo %>
</h3>
</div>
<!-- contents 끝 -->
	

<!-- footer 시작 -->
<%@include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</div>
</body>
</html>