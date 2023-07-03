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
    <link rel="stylesheet" href="resources/static/css/reset.css">
    <!--Theme custom css -->
    <link rel="stylesheet" href="resources/static/css/style.css">
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
        .cert_emailText {
            font-size: 13px;
            background: rgba(247, 225, 225, 0.842);
            padding: 10px
        }
    </style>
</head>
<body data-spy="scroll" data-target="#main-navbar">
    <div id="bg_wrap">
        <section>
            <div class="loginbox">
                <form action="#none">
                    <div class="title">비밀번호 재설정</div>
                    <div class="cert_emailText">
                        <h3 style="font-size:16px;"><strong>유의사항</strong></h3>
                        <ul>
                            <li>- 비밀번호유의사항1</li>
                            <li>- 비밀번호유의사항2</li>
                            <li>- 비밀번호유의사항3</li>
                        </ul>
                    </div>
                    <div class="input-box underline">
                        <input type="text" name="passwordOne" placeholder="새 비밀번호" required>
                    <div class="underline"></div>
                    </div>
                    <div class="input-box underline">
                      <input type="text" name="passwordTwo" placeholder="새 비밀번호확인" required>
                      <div class="underline"></div>
                    </div>
                </form>
                <button type="submit" class="input-box button">변경하기</button>
            </div>
        </section>
    </div>
    <script src="resources/static/js/bootstrap.js"></script>
    <script src="resources/static/js/plugins.js"></script>
    <script src="resources/static/js/main.js"></script>
</body>
</html>