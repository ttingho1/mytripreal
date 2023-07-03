<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호텔 - 호앤삐</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/static/css/myBootstrap.min.css">
    <!--For Plugins external css-->
    <link rel="stylesheet" href="resources/static/css/plugins.css">
    <link rel="stylesheet" href="resources/static/css/login.css">
    <!--Theme custom css -->
    <link rel="stylesheet" href="resources/static/css/style.css">
    <link rel="stylesheet" href="resources/static/css/reset.css">
    <script src="resources/static/js/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    <link rel="stylesheet" href="resources/static/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="resources/static/js/user.js"></script>
    <style>
        #bg_wrap {
            background-image: url('/resources/static/images/img_bg_login.png');
            background-repeat: no-repeat;
            background-size: cover;
            height: 100lvh;
        }
    </style>
</head>
<body data-spy="scroll" data-target="#main-navbar">
<div id="bg_wrap">
    <section>
        <div class="loginbox" style="width:350px;">
            <form action="/userUpdate" method="post">
                <div class="title" style="font-size:25px;">비밀번호 확인을 해주세요</div>
                <div class="input-box underline">
                    <input type="password" name="password" id="password" placeholder="현재 비밀번호">
                    <div class="underline"></div>
                </div>
                <button type="submit" class="input-box button">확인</button>
            </form>
        </div>
    </section>
</div>
<script src="resources/static/js/bootstrap.js"></script>
<script src="resources/static/js/plugins.js"></script>
<script src="resources/static/js/main.js"></script>
</body>
</html>