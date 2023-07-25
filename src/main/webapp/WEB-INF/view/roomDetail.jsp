<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>호텔 - 호앤삐</title>
    <link rel="stylesheet" href="resources/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/static/css/prettyPhoto.css">
    <link rel="stylesheet" href="resources/static/css/price-range.css">
    <link rel="stylesheet" href="resources/static/css/animate.css">
    <link rel="stylesheet" href="resources/static/css/main.css">
    <link rel="stylesheet" href="resources/static/css/responsive.css">
    <link rel="stylesheet" href="resources/static/css/font.css">
    <link rel="stylesheet" href="resources/static/css/reset.css">
    <link rel="stylesheet" href="resources/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/static/css/coffee.css">
    <link rel="stylesheet" href="resources/static/css/roomdetail.css">
    <%--데이트피커--%>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<style>
    /* 방 기본정보 */
    .roomInfo {
        width: 80%;
        margin: 50px auto 30px;
        border: 1px solid #c2bfb9;
        padding: 60px;
        background: #f9f9f9;

    }
    .roomInfo ul li {
        list-style: disc;
    }
    .roomInfoDetail {
        margin-top: 20px;
    }
    .roomInfoDetail h3 {
        margin: 20px 0 20px 0;
    }
    /* 예약하러가기 버튼 */
    .goReservBtn{
        border: none;
        width: 100%;
        height: 100px;
        line-height: 100px;
        margin-top: 30px;
        text-align: center;
        font-size: 2.3rem;
        background: #FE980F;
        color: white;
    }
</style>
<script>
    /* 문서로딩시 제이쿼리 실행시작 */

    var room;
    $(function(){
        // 방이미지 슬라이드 보기
        var bigPic = document.querySelector("#cup");
        console.log(bigPic);
        var smallPic = document.querySelectorAll(".small");
        console.log(smallPic);
        function changePic(){
            var newPic = this.src;
            console.log("작은이미지 클릭시" + newPic);
            bigPic.setAttribute("src",newPic);
        }


        var i;
        for(i=0; i<smallPic.length; i++){
            smallPic[i].addEventListener("click",changePic);
        }


    });

   





    /* 문서로딩시 제이쿼리 실행끝 */


</script>
<body>
<jsp:include page="common/header.jsp"/><!--header.jsp -->
<div id="contact-page" class="container">
    <div class="bg">
        <div class="row" style="margin-top:40px;">
            <div class="col-sm-4">
                <div class="contact-info">
                    <h2 class="title text-center">삼척 호앤삐호텔</h2>
                    <ul style="border:1px solid #c2bfb9; height:260px; padding:40px 50px 50px 50px; text-align:center; background: #f9f9f9; width: 100%;">
                        <h2 style="font-size: 1.3em;">사장님 한마디</h2>
                        <li style="text-align: left; margin-top:30px; font-size: 1.3rem;">
                            덕산해수욕장에서 오션뷰와 함께 일본식 호텔을 즐길수 있습니다.<br>
                            전 객실 실내 자이글 바베큐와 전 객실 욕조와 스파를 이용할 수 있습니다.
                        </li>
                    </ul>
                    <div class="goReservBtn">
                        <label for="goReservation" />
                            <a href="reservation" id="goReservation">예약하러가기</a>
                    </div>
                    <%--<input type="button" class="goReservBtn" value="예약하러가기" />--%>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="contact-form">
                    <h2 class="title text-center">${roomVo.room_name}</h2>
                    <div class="status alert alert-success" style="display: none"></div>
                    <div id="proc_pic">
                        <img src="${roomVo.main_image}" alt="커피이미지" id="cup" width="100%;" height="350px;">
                        <div id="small_pic" width="500px;" height="200px;">
                            <img src="${roomVo.sub_image1}" alt="썸네일이미지" class="small">
                            <img src="${roomVo.sub_image2}" alt="썸네일이미지" class="small">
                            <img src="${roomVo.sub_image3}" alt="썸네일이미지" class="small">
                            <img src="${roomVo.sub_image4}" alt="썸네일이미지" class="small">
                            <img src="${roomVo.sub_image5}" alt="썸네일이미지" class="small">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="roomInfo">
       <h2>기본정보</h2>
        <div class="roomInfoDetail">
            <h3>주변정보</h3>
            <ul>
                <li>덕산해변 차량2분</li>
                <li>덕산항 차량 3분</li>
                <li>맹방해변 차량4분</li>
            </ul>
            <h3>공지사항</h3>
            <ul>
                <li>개인화구 절대사용금지/사용시 퇴실조치</li>
                <li>전객실 금연</li>
                <li>각 객실 명시된 최대인원 초과시 입실 및 이용 불가하며 지인 및 방문객의 출입을 금하오니 이점 양해 부탁드립니다</li>
            </ul>
            <h3>기본 정보</h3>
            <ul>
                <li>입실 : 15:00 | 퇴실 : 11:00</li>
                <li>22시 이후 입실 시 사전문의 (필수)</li>
                <li>무료 Wi-Fi</li>
                <li>전 객실 금연</li>
                <li>주차 가능</li>
            </ul>
            <h3>인원 추가 정보</h3>
            <ul>
                <li>1인 10,000원 (36개월 이상~14세 미만), 20,000원 (14세 이상)</li>
                <li>영유아 인원수 포함 / 최대인원 초과불가</li>
                <li>현장 결제</li>
            </ul>
            <h3>펜션 서비스</h3>
            <ul>
                <li>시설 이용문의 및 비용 별도 펜션문의</li>
            </ul>
            <h3>바비큐 시설</h3>
            <ul>
                <li>자이글 대여 : 1SET 15,000원</li>
                <li>이용시간 : 15:00~22:00</li>
                <li>숯불 바비큐 이용불가</li>
                <li>현장 결제</li>
            </ul>
        </div>
    </div>
</div><!--/#contact-page-->
<jsp:include page="common/footer.jsp"/><!--footer.jsp -->
<script src="resources/static/js/bootstrap.min.js"></script>
<script src="resources/static/js/jquery.scrollUp.min.js"></script>
<script src="resources/static/js/price-range.js"></script>
<script src="resources/static/js/jquery.prettyPhoto.js"></script>
<script src="resources/static/js/main.js"></script>
</body>
</html>