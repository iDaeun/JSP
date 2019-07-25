<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <!-- 
    	데이터 입력 (id, pw, name, pNum, photo, level)	
		▶ <RegForm.jsp> 
		아이디 입력 후 [중복확인]버튼 -> application에 저장된 아이디가 있는지 확인
		1) 있는 경우: 다른 아이디 입력 요청
		2) 없는 경우: 계속 회원가입 진행
     -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

	<!-- css연결 -->
	<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
	<!-- 구글폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Coiny&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
</style>

<!--      <script type="text/javascript">
     		이렇게 하면 왜 페이지가 안넘어가지이.....ㅠ_ㅠ??
	function submit(index){
		if (index == 1){
			document.regForm.action = "checkId.jsp";
		}
		if (index == 2){
			document.regForm.action = "regProcess.jsp";
		}
		/* document.regForm.submit(); */
	}
     	
     </script>
 -->
</head>
<body>

    <div id="main_wrap">
        <!-- header 시작 -->
		<%@include file="frame/header.jsp" %>
        <!-- header 끝 -->

        <!-- nav 시작 -->
		<%@include file="frame/nav.jsp" %>
        <!-- nav 끝 -->

        <!-- context 시작 -->
        <div id="context">
            <div id="ct">
                <h2>REGISTER PAGE</h2>
					
				<form action="regProcess" method="post" enctype="multipart/form-data">
					<table>
                	<tr>
                		<td>아이디</td>
                		<td>
                		<input type="text" name="id">
                		<!-- <input type="submit" value="중복체크" onclick="javascript: form.action='checkId.jsp';" />  --> 
                		
                		</td>
                	</tr>
                	<tr>
                		<td>비밀번호</td>
                		<td><input type="password" name="pw"></td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td><input type="text" name="name"></td>
                	</tr>
                	<tr>
                		<td>전화번호</td>
                		<td><input type="text" name="pNum"></td>
                	</tr>
                	<tr>
                		<td>사진</td>
                		<td><input type="file" name="photo"></td>
                	</tr>
                	<tr>
                		<td>레벨</td>
                		<td><input type="range" name="level" min="1" max="10" value="0" oninput="document.getElementById('value1').innerHTML=this.value;">
                		<span id="value1"></span>
                		</td>
                	</tr>
                	<tr>
                		<td></td>
                		<td><input type="submit" value="가입하기" /></td>
                	</tr>
                </table>
               </form>
            </div>
        </div>
        <!-- context 끝 -->

        <!-- footer 시작 -->
		<%@include file="frame/footer.jsp" %>
        <!-- footer 끝 -->
    </div>
        
</body></html>