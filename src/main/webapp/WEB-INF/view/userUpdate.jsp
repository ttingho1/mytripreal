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
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
        #bg_wrap {
            background-image: url('/resources/static/images/img_bg_login.png');
            background-repeat: no-repeat;
            background-size: cover;
            height: 100lvh;
        }

        .loginbox .hp {
        display: flex;
        width: 100%;
        text-align: center;
        margin-top: 10px;
        }
    </style>
    <script>
        // 우편번호 찾기 api
        function DaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    let fullRoadAddr = data.roadAddress;
                    let extraRoadAddr = '';
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    if (fullRoadAddr !== '') {
                        fullRoadAddr += extraRoadAddr;
                    }
                    document.getElementById('zipCode').value = data.zonecode;
                    document.getElementById('address1').value = fullRoadAddr;
                    document.getElementById('address2').focus();

                }
            }).open();
        };

        // 비밀번호 체크
        $(function(){
            // 안전한 비밀번호 확인 : 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력
            $('#password').keyup(function(){
                $('#chkNotice').html('');
                $('#chkNoticeB').html('');
                if(!$('#password').val().match((/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/))){
                    $('#chkNoticeB').html('안전하지않은 비밀번호 입니다!<br><br>');
                    $('#chkNoticeB').css({'color':'red','margin-top':'-17px','margin-bottom':'-43px'});
                }else{
                    $('#chkNoticeB').html('안전한 비밀번호 입니다!<br><br>');
                    $('#chkNoticeB').css({'color':'green','margin-top':'-17px','margin-bottom':'-43px'});
                }
            });

            // 비밀번호 일치 여부 확인
            $('#password2').keyup(function(){
                if($('#password').val() != $('#password2').val()){
                    $('#chkNotice').html('비밀번호가 일치하지 않습니다!<br><br>');
                    $('#chkNotice').css({'color':'red','margin-top':'-17px','margin-bottom':'-13px'});
                } else{
                    $('#chkNotice').html('비밀번호가 일치합니다!<br><br>');
                    $('#chkNotice').css({'color':'green','margin-top':'-17px','margin-bottom':'-13px'});
                }
            });
        });

        // 비밀번호 일치/불일치 알림
var test = {
    passwd : function (e) {
        if(  $("#password").val() != $("#password2").val()  ) {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }
        $("#frm").submit();

    },

}





    </script>
</head>
<body data-spy="scroll" data-target="#main-navbar">
    <div id="bg_wrap">
        <section>
            <div class="loginbox" style="top:90px;">
                <form id="frm" action="userUpdate.do" method="post">
                    <div class="title">회원정보수정</div>
                    <div class="input-box">
                        <input type="password" name="password" id="password" placeholder="새 비밀번호*" required>
                        <div class="underline"></div>
                    </div>
                    <div id="chkNoticeB" size="2"></div>
                    <div class="input-box">
                        <input type="password" name="password2" id="password2" placeholder="비밀번호 확인*" required>
                        <div class="underline"></div>
                    </div>
                    <div id="chkNotice" size="2"></div>
                    <div class="hp">
                        <input type="text" name="hp1" id="hp1" required maxlength="3" value="${userVo.hp1}" style="width:33%; height: 40px; text-align: center; " oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        <div class="underline"></div>
                        <input type="text" name="hp2" id="hp2" required maxlength="4" value="${userVo.hp2}" style="width:33%; height: 40px; text-align: center;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        <div class="underline"></div>
                        <input type="text" name="hp3" id="hp3" required maxlength="4" value="${userVo.hp3}" style="width:33%; height: 40px; text-align: center;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        <div class="underline"></div>
                    </div>
                    <div class="input-box zipCode-inputBox cf" style="background-color: lightslategray;">
                        <input type="text" name="zipCode" id="zipCode" class="zipcode-input" value="${userVo.zipCode}" placeholder="우편번호*" required style="width: 55%;">
                        <input type="button" onclick="DaumPostcode()" class="zipcodeButton" value="우편번호 찾기" style="width: 45%; color: black; background-color:lightgray;">
                        <div class="underline"></div>
                    </div>
                    <div class="input-box">
                        <input type="text" name="address1" id="address1" value="${userVo.address1}" onclick="DaumPostcode();" placeholder="주소*" required>
                        <div class="underline"></div>
                    </div>
                    <div class="input-box">
                        <input type="text" name="address2" id="address2" value="${userVo.address2}" placeholder="상세주소*" required>
                        <div class="underline"></div>
                    </div>
                    <input type="button" class="input-box button" value="변경하기" onclick="test.passwd();">
                </form>

            </div>
        </section>
    </div>
    <script src="resources/static/js/bootstrap.js"></script>
    <script src="resources/static/js/plugins.js"></script>
    <script src="resources/static/js/main.js"></script>
</body>
</html>