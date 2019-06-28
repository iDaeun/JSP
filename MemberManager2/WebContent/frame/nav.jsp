<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
		<!-- JSTL url 태그 사용 -->
	<ul>	
		<!-- getContentPath = Content Root -->
		<li><a href="<c:url value='/' />">홈</a></li>
		<!-- 시스템에서 자동적으로 경로 설정해줌! -->
		<li><a href="<c:url value='/member/login.jsp' />">로그인</a></li>
		<li><a href="<c:url value='/member/memberRegForm.jsp' />">회원가입</a></li>
		<li><a href="<c:url value='/member/myPage.jsp' />">마이페이지1</a></li>
		<li><a href="<c:url value='/member/myPage2.jsp' />">마이페이지2</a></li>
		<li><a href="<c:url value='/member/memberList.jsp' />">회원리스트1</a></li>
		<li><a href="<c:url value='/member/memberList2.jsp' />">회원리스트2</a></li>
		<li><a href="<c:url value='/member/logout.jsp' />">로그아웃</a></li>
	</ul>
		
		<!-- EL 사용 -->
<%-- 	<ul>
		<!-- getContentPath = Content Root -->
		<li><a href="${pageContext.request.contextPath}">홈</a></li>
		<!-- 시스템에서 자동적으로 경로 설정해줌! -->
		<li><a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberRegForm.jsp">회원가입</a></li>
		<li><a href="${pageContext.request.contextPath}/member/myPage.jsp">마이페이지</a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberList.jsp">회원리스트</a></li>
		<li><a href="${pageContext.request.contextPath}/member/logout.jsp">LOGOUT</a></li>
	</ul> --%>
</div>