<%@page import="member.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
 			<%
 			Enumeration names = application.getAttributeNames();
 			while(names.hasMoreElements()){
 				String name = (String)names.nextElement();
 				MemberInfo memberInfo = (MemberInfo)application.getAttribute(name);
 				if(memberInfo.getId() == request.getParameter("id")) { %>
 					alert('동일한 아이디가 있습니다!');
 					history.go(-1);
 			<%	
 				break;
 				} else {	%>
 					alert('사용가능한 아이디입니다!');	
 					history.go(-1);
 			<%		
 				break;
 				}
 			}
 			%>
</script>


<style>
</style>
</head>
<body>

</body>
</html>