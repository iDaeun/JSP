<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Surfing Homepage</title>

    <link href="https://fonts.googleapis.com/css?family=Coiny&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
        }

        body {
            background-image: url(/SurfingHomepage/images/3.jpg);
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
            font-size: 6vw;
            /*font-family: 'Barriecito', cursive;*/
            /* font-family: 'Abril Fatface', cursive;*/
            font-family: 'Coiny', cursive;
        }

        #nav>ul {
            padding: 10px;
            text-align: center;
            list-style: none;
        }

        #nav>ul>li {
            padding: 0 20px;
            display: inline;
            /*font-family: 'Jua', sans-serif;*/
            font-family: 'Do Hyeon', sans-serif;
        }

        #nav a {
            display: inline-block;
            font-size: 25px;
            padding: 0 5px;
            color: black;
        }

        #nav a:hover {
            /*            background-image: url(board1.jpg);
            background-size: 100%;*/
            /*font-weight: bold;*/
            font-size: 30px;
            background-color: rgba(245, 246, 250, 0.5);
            border-radius: 100%;
        }

        #context {
            clear: both;
        }

        button {
            border: 4px solid gray;
            border-radius: 100%;
            padding: 7px;
            margin: 5px;
            float: right;
            font-family: 'Do Hyeon', sans-serif;
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script>
        /*        $(document).ready(function() {

            $('.nav').click(function() {
                $(this).attr('src', 'board.jpg')
            })

        });*/
    </script>
</head>

<body>

    <div id="main_wrap">
        <!-- header 시작 -->
        <div id="header">
            <h1>Let's Go Surfing!</h1>
        </div>
        <!-- header 끝 -->

        <!-- nav 시작 -->
        <div id="nav">
            <ul>
                <li><a class="nav" href="#">로그인</a></li>
                <li><a class="nav" href="#">회원가입</a></li>
                <li><a class="nav" href="#">수업수강</a></li>
                <li><a class="nav" href="#">관리자페이지</a></li>
            </ul>
        </div>
        <!-- nav 끝 -->

        <!-- context 시작 -->
        <div id="context">
            <div id="ct">
                메인페이지 입니다!
            </div>
        </div>
        <!-- context 끝 -->

        <!-- footer 시작 -->
        <div id="footer">
            <button><a href="http://www.naver.com">로그아웃</a></button>
            <button><a href="#">회원탈퇴</a></button>
        </div>
        <!-- footer 끝 -->
    </div>
</body></html>
