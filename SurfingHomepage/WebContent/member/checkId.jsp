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
 			Enumeration<String> names = application.getAttributeNames();
 			while(names.hasMoreElements()){
 				String name = (String)names.nextElement();
 				if(application.getAttribute(name) == request.getParameter("id")) { %>
 					alert('동일한 아이디가 있습니다!');	
 					$(this).onfocus();
 			<%	
 				break;
 				} else {	%>
 					alert('사용가능한 아이디입니다!');	
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