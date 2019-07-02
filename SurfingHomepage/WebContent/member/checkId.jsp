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
				
 				if(name != null && name.contains("\\@")){
	 				MemberInfo memberInfo = (MemberInfo)application.getAttribute(name);
	 				/* null확인 + @로 걸러주기 */
	 				
		 				if(memberInfo.getId().equals(request.getParameter("id"))) { %> /* equals */
		 					alert('동일한 아이디가 있습니다!');
		 					history.go(-1);
		 			<%	
		 				} else {	%>
		 					alert('사용가능한 아이디입니다!');	
		 					history.go(-1);
		 			<%		
		 				}
		 			}
	 			}
		 			%>
</script>

</head>
<body>

</body>
</html>