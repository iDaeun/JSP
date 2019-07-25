<%@page import="surfing.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- <jsp:useBean id="loginInfo" class="member.memberInfo" scope="session"/> --%>
 
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
	
		<h2>회원 정보 페이지</h2>
		<!-- null이 아닐때 -->
		<c:if test="${loginInfo ne null}">
		${sessionScope.loginInfo }
		<hr>
			<img src="../images/${loginInfo.uPhoto}">
			<h4>이름: ${loginInfo.uName}</h4>
			<h4>아이디: ${loginInfo.uId}</h4>
			<h4>가입일시: <fmt:formatDate value="${loginInfo.regDate}" type="both" pattern="yyyy.MM.dd H:mm:ss"/></h4>
		</c:if>
		
		<!-- null일때 -->	
		<c:if test="${loginInfo eq null}">	
			<script>
				alert('로그인 후 이용가능한 페이지입니다');
				/* 여기서 왜 request.getContextPath()쓰면 홈으로 가질 못하는지? */
						/* => 갈 수 있 따 !!! */
				location.href="<%= request.getContextPath() %>";
			</script>
		</c:if>
</div>
<!-- contents 끝 -->
	

<!-- footer 시작 -->
<%@include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</div>
</body>
</html>