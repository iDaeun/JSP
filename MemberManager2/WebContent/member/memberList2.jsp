<%@page import="surfing.model.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 회원 리스트  -->   
    <%
    /* 
    application -> <Key,Value>형태로 저장됨
    application.getAttributeNames() => 회원가입때 저장한 정보 Key값(member.getId())순서없는 배열로 가져옴!
    Enumeration = iterator의 하위버전, 즉 같은 것! (hasNext, Next)
    application의 속성에 저장한다 -> "mListName"라는 이름으로 쓰기 위해
    */
    Enumeration<String> e = application.getAttributeNames();
    application.setAttribute("mListName", e);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img.sumnail{
		height : 25px;
		margin : 5px;
	}
	
	table{
		width : 80%;
		margin : 0 auto;
		border : 0;
		border-collapse: collapse;
	}
	
	table td{
		padding : 3px;
		border : 1px solid black;
	}
	
	table tr:first-child>td {
		text-align : center;
		background-color: #EEE;
		font-weight: bold;
	}
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
<!-- 해더 시작 -->

<!-- nav 시작 -->
<%@include file="../frame/nav.jsp" %>
<!-- nav 끝 -->

<!-- contents 시작 -->
	<h3>회원 리스트</h3>
	<hr>
	<table>
		<tr>
			<td>순번</td>
			<td>아이디</td>
			<td>이름</td>
			<td>비밀번호</td>
			<td>가입일</td>
			<td>이미지</td>
			<td>관리</td>
		</tr>
		
		<!-- 리스트 반복 시작 -->
		<!-- 
			위에 저장한 mListName으로 e배열 가져옴(String)
			forEach : ${mListName} (=e) 을 "mId"라는 변수에 하나하나 꺼내서 돌리기
				**forEach에서 var은 For문의 index와 같은 개념, 이름은 같아도 매번 돌때마다 안에 가져오는 정보는 다르다!!
			정보가 너무 많은 관계로 "@"로 데이터 걸러내기 (회원가입때 아이디는 이메일 형태임!)
			
			"mId"은 Key값, 우리는 Value(memberInfo객체)가 필요하다:
			${applicationScope[mId]} = array[index] 처럼 직접참조하여 Value를 가져옴 -> "mem"라는 변수에 넣기
			테이블: mem을 통해 memberInfo객체의 id, name, pw, registerDate, photo 가져오기
		 -->
		<c:forEach items="${mListName}" var="mId" varStatus="status">
		<c:if test="${fn:contains(mId,'@')}" >
									<!-- 객체영역 => MAP[key] 직접참조하기    <k,v>-->
		<c:set var="mem" value="${applicationScope[mId]}"/>
				<tr>
					<td>${status.count}</td>
					<td>${mem.id}</td>
					<td>${mem.name}</td>
					<td>${mem.pw} </td>
					<td><fmt:formatDate value="${mem.registerDate}" pattern="yyyy.MM.dd. H:mm"/></td>
					<td><img class="sumnail" alt="회원사진" src="../images/${mem.photo}"></td>
					<td><a href="#">수정</a> | <a href="#">삭제</a></td>
				</tr>
		</c:if>
		</c:forEach>		
		<!-- 리스트 반복 끝 -->
	</table>
<!-- contents 끝 -->
	

<!-- footer 시작 -->
<%@include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</div>
</body>
</html>