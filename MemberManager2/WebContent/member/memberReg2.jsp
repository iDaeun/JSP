<%@page import="surfing.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
    
<!-- 자바빈 사용 -->
<jsp:useBean id="member" class="surfing.model.MemberInfo"/>
<jsp:setProperty property="*" name="member"/>
	
	<%
		if(member.getPhoto() == null){
			member.setPhoto("noimg.jpg");
		}
	
	//***내장객체에 회원정보 객체를 저장
	application.setAttribute(member.getId(), member);
	
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
</head>

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
<!-- 자바빈 -->
	<h3>회원가입요청 처리 페이지</h3>
	<hr>
	<!-- EL -->
	표현식: <%=member.makeHtmlDiv() %>
	EL: ${member.makeHtmlDiv()}
<!-- contents 끝 -->	

<!-- footer 시작 -->
<%@include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</div>
</body>
</html>