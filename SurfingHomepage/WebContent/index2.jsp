<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Library Homepage</title>

<!-- css연결 -->
<!-- <link href="css/default.css" rel="stylesheet" type="text/css"> -->
<!-- 구글폰트 -->

<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

body {
	background-image: url(/SurfingHomepage/css/LImages/5.jpg);
	background-size: 100% 1000px;
	background-repeat: no-repeat;
	max-width: 960px;
	min-width: 500px;
	margin: 0 auto;
}

#main_wrap {
	padding-top: 20px;
}

h1 {
	text-align: center;
	font-size: 5vw;
	margin: 15px;
}

h1>a{
	color: white;
}

#nav>ul {
	padding: 10px;
	text-align: center;
	list-style: none;
}

#nav>ul>li {
	padding: 20px 10px;
	display: inline;
}

#nav a {
	display: inline-block;
	font-size: 25px;
	padding: 0 5px;
	color: black;
	background-color: rgba(245, 246, 250, 0.5);
}

#nav a:hover {
	font-weight: bold;
}

#context {
	clear: both;
}

button {
	padding: 7px;
	margin: 5px;
	float: right;
}

button>a {
	color: black;
	font-size: 15px;
}

#context {
	padding: 50px;
}

#ct {
	width: 50%;
	margin: 0 auto;
}

#footer {
	margin-top: 20px;
}
</style>

</head>

<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<div id="header">
			<h1>
				<a href=" <c:url value='/' />">Welcome to BIT Library</a>
			</h1>
		</div>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<div id="nav">
			<ul>
				<li><a class="nav">로그인</a></li>
				<li><a class="nav">회원가입</a></li>
				<li><a class="nav">도서검색</a></li>
				<li><a class="nav">도서신청</a></li>
				<li><a class="nav">열람실신청</a></li>
				<li><a class="nav">건의사항</a></li>
				<li><a class="nav">마이페이지</a></li>
				<li><a class="nav">관리자페이지</a></li>
			</ul>
		</div>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		<div id="context">
			<div id="ct">@@메인페이지@@</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<div id="footer">
			<button>
				<a>로그아웃</a>
			</button>
			<button>
				<a>회원탈퇴</a>
			</button>
		</div>
		<!-- footer 끝 -->
	</div>
</body>
</html>
