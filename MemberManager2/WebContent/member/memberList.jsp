<%@page import="surfing.model.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원 리스트  -->   
    <%
    Enumeration<String> e = application.getAttributeNames();
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
			<td>이미지</td>
			<td>관리</td>
		</tr>
		
		<!-- 리스트 반복 시작 -->
		<%
		int cnt = 0;
		
		while(e.hasMoreElements()){
			
			String name = e.nextElement();
			//name값으로 객체 받아오기
			Object obj = application.getAttribute(name);
			//형변환 검사를 통해 memberInfo의 객체인지 확인하기
			if(obj instanceof MemberInfo){
				MemberInfo member = (MemberInfo)obj;
			%>
				
				<tr>
					<td><%=++cnt %></td>
					<td><%=member.getId() %></td>
					<td><%=member.getName() %></td>
					<td><%=member.getPw() %></td>
					<td><img class="sumnail" alt="회원사진" src="../images/<%=member.getPhoto()%>"></td>
					<td><a href="#">수정</a> | <a href="#">삭제</a></td>
				</tr>
				
			<%
			}
		}
	
		%>
		<!-- 리스트 반복 끝 -->
	</table>
<!-- contents 끝 -->
	

<!-- footer 시작 -->
<%@include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</div>
</body>
</html>