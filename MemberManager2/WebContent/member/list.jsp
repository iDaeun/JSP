<%@page import="member.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- test용 list -->  
    <%
    Enumeration<String> e = application.getAttributeNames();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<%
	
		while(e.hasMoreElements()){
			
			String name = e.nextElement();
			//name값으로 객체 받아오기
			Object obj = application.getAttribute(name);
			//형변환 검사를 통해 memberInfo의 객체인지 확인하기
			if(obj instanceof MemberInfo){
				//아이디값 + 객체의 toString()
				out.println(name+":"+obj+"<br>");
			}
		}
	
	%>

</body>
</html>