<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="nav">
	<ul>
		<li><a class="nav" href="<c:url value='/member/loginForm.jsp' />">로그인</a></li>
		<li><a class="nav" href="<c:url value='/member/regForm.jsp' />">회원가입</a></li>
		<li><a class="nav" href="<c:url value='/member/classList.jsp' />">수업수강</a></li>
		<li><a class="nav" href="<c:url value='/member/smiList.jsp' />">관리자페이지</a></li>
	</ul>
</div>