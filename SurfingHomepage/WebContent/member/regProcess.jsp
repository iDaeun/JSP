<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- 	회원가입 데이터 받아 처리하기 => 정보<member.java>에 저장, application속성에 저장 
		▶ <RegProcess.jsp> 
		1) 전달받은 정보 <member.java>에 저장
		2) 흐름상 정보 유지를 위해 회원정보는 application속성에 저장
		3) 회원가입된 정보 출력하기
		4) 로그인 페이지로 이동 -->
		
		<!-- 1) 전달받은 정보 <member.java>에 저장 -->
		<jsp:useBean id="member" class="member.MemberInfo"/>
		<jsp:setProperty property="*" name="member"/>
		
		<!-- 2) 흐름상 정보 유지를 위해 회원정보는 application속성에 저장 -->
		<%
			if(member.getPhoto() == null){
				member.setPhoto("noimg");
			}
		
		application.setAttribute(member.getId(), member);
		out.print("<h1>저장완료!</h1>");
		%>
		
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Surfing Homepage</title>
    
	<!-- css연결 -->
	<link href="../css/default.css" rel="stylesheet" type="text/css">
	<!-- 구글폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Coiny&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    
    <style>
      
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script>

    </script>
</head>

<body>

    <div id="main_wrap">
        <!-- header 시작 -->
		<%@include file="../frame/header.jsp" %>
        <!-- header 끝 -->

        <!-- nav 시작 -->
		<%@include file="../frame/nav.jsp" %>
        <!-- nav 끝 -->

        <!-- context 시작 -->
        <div id="context">
            <div id="ct">
		        <!-- 3) 회원가입된 정보 출력하기 -->
				<h2>성공적으로 가입되었습니다!</h2>
				<h2>가입정보:</h2>
				${member.html()}
		
		<!-- 4) 로그인 페이지로 이동 -->
		<a href="loginForm.jsp">로그인하러가기</a>
		
            </div>
        </div>
        <!-- context 끝 -->

        <!-- footer 시작 -->
		<%@include file="../frame/footer.jsp" %>
        <!-- footer 끝 -->
    </div>
</body></html>