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
    <link href="resources/static/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/static/css/font.css">
    <link rel="stylesheet" href="resources/static/css/reset.css">
    <link rel="stylesheet" href="resources/static/css/reservation.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<script>
    // 문서로딩 후 제이쿼리 실행
    $(function(){
        /* 약관동의 시작 */

            // 약관동의 체크박스 전체체크
            $("#cbx_chkAll").click(function() {
                if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
                else $("input[name=chk]").prop("checked", false);
            });

            $("input[name=chk]").click(function() {
                var total = $("input[name=chk]").length;
                var checked = $("input[name=chk]:checked").length;

                if(total != checked) $("#cbx_chkAll").prop("checked", false);
                else $("#cbx_chkAll").prop("checked", true);
            });

        /* 약관동의 끝 */

        /* 예약정보입력 시작 */

            // 연락처 입력시 칸 자동이동
            $("#hp1").on("keyup",function(){
                var mch = $(this).val().match(/[0-9]/g)
                if( mch != null && mch.length == 3 )
                {
                    $('#hp2').focus();
                }
            });
            $("#hp2").on("keyup",function(){
                var mch = $(this).val().match(/[0-9]/g)
                if( mch != null && mch.length == 4 )
                {
                    $("#hp3").focus();
                }
            });

            // 예약번호(reservation_no) 히든값 (날짜 년/월/일 + 랜덤문자(숫자포함) 6자리) ex) 202307303ae011
            $("input[name='reservation_no']").attr('value', new Date().toISOString().substring(0,10).replace(/-/g,'') + Math.random().toString(16).substring(2,8));



        /* 예약정보입력 끝 */

        /* 선택객실목록 시작 */

            // 이용일 value 값 받기
            $("input[name='start_date']").attr('value', $("label[for='start_date']").text());
            $("input[name='end_date']").attr('value', $("label[for='end_date']").text());

            // 숙박일수 value 값 받기
            const checkIn = $("input[name='start_date']").val();
            const checkOut = $("input[name='end_date']").val();
            const getDateDiff = (d1, d2) => {
                const date1 = new Date(d1);
                const date2 = new Date(d2);
                const diffDate = date1.getTime() - date2.getTime();
                return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
            }

            // 숙박일수 계산을 통한 n박 출력
            $('.nightNum').html(getDateDiff(checkIn, checkOut)+'박');

            // 객실금액 value 값 받기
            $("input[name='pay_oneDay']").attr('value', $("label[for='pay_oneDay']").text());



        /* 선택객실목록 끝 */

        /* 결제정보 시작 */

            // 총 결제금액 value값 받기
            $("input[name='pay_total']").attr('value',$("label[for='pay_total']").text());

            // 총 결제금액 계산 (숙박일수 x 객실금액(1일))
            var nightNum = Number($('.nightNum').text().replace('박',''));
            var pay_OneDay = Number($("input[name='pay_oneDay']").attr('value', $("label[for='pay_oneDay']").text()).val());
            var pay_total = nightNum * pay_OneDay;
            $("input[name='pay_total']").attr('value', pay_total);
            $("label[for='pay_total']").text(pay_total);

        /* 결제정보 끝 */



    });
    // 문서로딩 후 제이쿼리 실행 끝


    // 뒤로가기 버튼
    function back(){
        location.href="/reservation";
    }

    // 결제하기 버튼클릭하기전 필수사항 null 체크
    var test = {
        paymentSend : function(e){
            // 약관동의
            if($("#cbx_chkAll").is(":checked") == false){
                alert('약관동의를 체크해주세요');
                return;
            }
            // 예약자명
            if($("#userName").val() == ""){
                alert('예약자명을 확인해주세요');
                $("#userName").focus();
                return;
            }
            // 연락처
            if($("#hp1").val() == ""){
                alert('연락처를 확인해주세요');
                $("#hp1").focus();
                return;
            }
            if($("#hp2").val() == ""){
                alert('연락처를 확인해주세요');
                $("#hp2").focus();
                return;
            }
            if($("#hp3").val() == ""){
                alert('연락처를 확인해주세요');
                $("#hp3").focus();
                return;
            }
            // 이메일
            if($("#userEmail").val() == ""){
                alert('이메일을 확인해주세요');
                $("#userEmail").focus();
                return;
            }
            // 결제수단
            if($("input[type=radio][name=pay_type]:checked").is(':checked') == false){
                alert('지불수단을 확인해주세요');
                $("input[name='pay_type']").focus();
                return;
            }

        }
    }
    // 결제하기 버튼클릭하기전 필수사항 null 체크 끝

</script>
<body>
<section>
    <div class="container">
        <div class="jss3">
            <div class="jss4">
                <%--<div>
                    <button class="jss7" onclick="back();">
                        <img class="jss144" src="resources/static/images/backleft.svg" alt="drag">
                        <span>뒤로가기</span>
                    </button>
                </div>--%>
                <div class="jss5">예약결제</div>
                <%--<div class="jss6">
                    <img src="https://via.placeholder.com/67x23" width="67" height="23" alt="">
                </div>--%>
            </div>
        </div>
        <div class="MuiGrid-root jss1 MuiGrid-container">
            <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12">
                <div>
                    <h3 class="jss36">선택객실목록</h3>
                    <div class="jss37">
                        <div class="jss8">
                            <div class="jss9">
                                <div class="jss10">
                                    <div>객실명</div>
                                    <div>이용일</div>
                                    <div>숙박일수</div>
                                    <div>객실금액(1일)</div>
                                </div>
                            </div>
                            <ul class="jss11">
                                <li>
                                    <div class="jss12">
                                        <div class="jss13" style="text-align: center;">
                                            <div class="jss14"><c:out value="${roomVo.room_no}"></c:out> 호</div>
                                            <div class="jss15" name="person">기준 : <c:out value="${roomVo.person_min}"></c:out>명 / 최대 : <c:out value="${roomVo.person_max}"></c:out>명</div>
                                        </div>
                                        <div></div>
                                    </div>
                                    <div class="jss12" data-item-title="이용일">
                                        <div class="jss13">
                                            <label for="start_date"><c:out value="${checkin_date}"></c:out></label>

                                            ~
                                            <label for="end_date"><c:out value="${checkout_date}"></c:out></label>

                                        </div>
                                    </div>
                                    <div class="jss12" data-item-title="숙박일수">
                                        <div class="jss13 nightNum">
                                            ? 박
                                        </div>
                                    </div>
                                    <div class="jss12" data-item-title="객실금액">
                                        <div class="jss13">
                                            <label for="pay_oneDay"><c:out value="${roomVo.room_fee}"></c:out></label>
                                            원


                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="jss20"></div>
            </div>
            <div class="MuiGrid-root MuiGrid-container MuiGrid-spacing-xs-5">
                <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-sm-12 MuiGrid-grid-md-6">
                    <div>
                        <h3 class="jss36">약관동의</h3>
                        <div class="jss37">
                            <div class="jss38">
                                <label class="MuiFormControlLabel-root">
                                        <span class="MuiButtonBase-root MuiIconButton-root jss40 MuiCheckbox-root MuiCheckbox-colorPrimary MuiIconButton-colorPrimary" aria-disabled="false">
                                            <span class="MuiIconButton-label">
                                                <input type="checkbox" class="jss43" id="cbx_chkAll" data-indeterminate="false" value>
                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                    <path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"></path>
                                                </svg>
                                            </span>
                                            <span class="MuiTouchRipple-root"></span>
                                        </span>
                                    <span class="MuiTypography-root MuiFormControlLabel-label MuiTypography-body1">전체동의</span>
                                </label>
                            </div>
                            <div class="jss38">
                                <label class="MuiFormControlLabel-root">
                                        <span class="MuiButtonBase-root MuiIconButton-root jss40 MuiCheckbox-root MuiCheckbox-colorPrimary MuiIconButton-colorPrimary" aria-disabled="false">
                                            <span class="MuiIconButton-label">
                                                <input type="checkbox" class="jss43" data-indeterminate="false" value name="chk">
                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                    <path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"></path>
                                                </svg>
                                            </span>
                                            <span class="MuiTouchRipple-root"></span>
                                        </span>
                                    <span class="MuiTypography-root MuiFormControlLabel-label MuiTypography-body1">(필수) 이용시 유의사항에 동의</span>
                                </label>
                            </div>
                            <div class="jss39">
                                <div>
                                    <div class="tui-editor-contents">
                                        <p>
                                            보호자 동반없는
                                            <span style="color:#ff6c00">미성년자는 예약 및 입실 불가합니다.</span>
                                        </p>
                                        <p>
                                            예약시 신청하신
                                            <span style="color:#ff6c00">인원이외에 추가인원은 입실이 거부될 수 있습니다.</span>
                                        </p>
                                        <p>예약인원 초과로 인한 입실 거부시 환불도 되지 않으니 유의하시기 바랍니다.</p>
                                        <p>예약후 펜션이나 객실 변경은 해당예약 취소후 다시 예약하셔야 합니다.</p>
                                        <p>
                                            예약변경을 위한
                                            <span style="color:#ff6c00">취소시에도 취소수수료가 부과</span>
                                            되오니 신중하게 예약하시기 바랍니다.
                                        </p>
                                        <p>최대인원이 2인인 커플전용룸의 경우 유아나 아동은 동반입실이 불가능합니다.</p>
                                        <p>
                                            <span style="color:#ff6c00">애완견 동반시 입실이 불가능</span>
                                            합니다.
                                        </p>
                                        <p>퇴실 시에는 내집같이 정돈을 부탁 드립니다.</p>
                                        <p>
                                            <strong>
                                                <span style="color:#ff0000">각 객실 명시된 최대인원초과시 입실 및 이용불가하며 지인 및 방문객의 출입을 금하오니 이점 양해 부탁드립니다.</span>
                                            </strong>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="jss38">
                                <label class="MuiFormControlLabel-root">
                                        <span class="MuiButtonBase-root MuiIconButton-root jss40 MuiCheckbox-root MuiCheckbox-colorPrimary MuiIconButton-colorPrimary" aria-disabled="false">
                                            <span class="MuiIconButton-label">
                                                <input class="jss43" type="checkbox" data-indeterminate="false" value name="chk">
                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                    <path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"></path>
                                                </svg>
                                            </span>
                                            <span class="MuiTouchRipple-root"></span>
                                        </span>
                                    <span class="MuiTypography-root MuiFormControlLabel-label MuiTypography-body1">(필수) 취소수수료(예약시점과 무관한 이용일 기준)에 동의</span>
                                </label>
                            </div>
                            <div class="jss39">
                                <div class="jss33">
                                    <p>예약취소는 구매한 사이트 "예약확인/취소" 에서 가능합니다.</p>
                                    <p>취소수수료는 예약시점과는 무관한 <span class="jss31">이용시작일 기준</span>입니다.</p>
                                    <p>환불시 <span class="jss31">결제하신 금액에서 취소수수료를 제외한 금액을 환불</span>해 드립니다.</p>
                                    <p>취소수수료는 결제금액이 아닌 예약금(객실요금+기타옵션요금) 기준으로 책정됩니다.</p>
                                    <p><span class="jss31">취소수수료가 100% 인 경우 전액 환불되지 않습니다.</span></p>
                                    <p>수수료 내역은 아래와 같습니다.</p>
                                </div>
                                <table class="jss29">
                                    <colgroup>
                                        <col>
                                        <col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>기준</th>
                                        <th>취소수수료</th>
                                        <th>환불율(%)</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>이용일 <b>당일</b> 취소시</td>
                                        <td>100%</td>
                                        <td>환불없음</td>
                                    </tr>
                                    <tr>
                                        <td>이용일 <b>1</b> 일전 취소시</td>
                                        <td>70%</td>
                                        <td>30% 환불</td>
                                    </tr>
                                    <tr>
                                        <td>이용일 <b>2</b> 일전 취소시</td>
                                        <td>50%</td>
                                        <td>50% 환불</td>
                                    </tr>
                                    <tr>
                                        <td>이용일 <b>3</b> 일전 취소시</td>
                                        <td>30%</td>
                                        <td>70% 환불</td>
                                    </tr>
                                    <tr>
                                        <td>이용일 <b>4</b> 일전 취소시</td>
                                        <td>20%</td>
                                        <td>80% 환불</td>
                                    </tr>
                                    <tr>
                                        <td>이용일 <b>5</b> 일전 취소시</td>
                                        <td>15%</td>
                                        <td>85% 환불</td>
                                    </tr>
                                    <tr>
                                        <td>이용일 <b>6</b> 일전 취소시</td>
                                        <td>10%</td>
                                        <td>90% 환불</td>
                                    </tr>
                                    <tr>
                                        <td>이용일 <b>7</b> 일전 취소시</td>
                                        <td>0%</td>
                                        <td>100% 환불</td>
                                    </tr>
                                    <tr class="jss30">
                                        <td>기본 취소 수수료</td>
                                        <td>0%</td>
                                        <td>100% 환불</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="jss38">
                                <label class="MuiFormControlLabel-root">
                                        <span class="MuiButtonBase-root MuiIconButton-root jss40 MuiCheckbox-root MuiCheckbox-colorPrimary MuiIconButton-colorPrimary" aria-disabled="false">
                                            <span class="MuiIconButton-label">
                                                <input class="jss43" type="checkbox" data-indeterminate="false" value="" name="chk">
                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                    <path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"></path>
                                                </svg>
                                            </span>
                                            <span class="MuiTouchRipple-root"></span>
                                        </span>
                                    <span class="MuiTypography-root MuiFormControlLabel-label MuiTypography-body1">(필수) 개인정보 수집 및 이용에 동의</span>
                                </label>
                            </div>
                            <div class="jss39">
                                <div class="jss28">
                                    <div class="jss33">주식회사 호앤삐는 숙박 예약에 필요한 최소한의 개인정보를 수집하고 있으며 동의받은 목적 외 용도로 사용하지 않습니다.</div>
                                    <div class="jss44 jss32 jss46">
                                        <table class="MuiTable-root jss45">
                                            <colgroup>
                                                <col style="width: 15%;">
                                                <col style="width: 35%;">
                                                <col style="width: 35%;">
                                                <col style="width: 15%;">
                                            </colgroup>
                                            <thead class="MuiTableHead-root jss48 jss49">
                                            <tr class="MuiTableRow-root">
                                                <th class="MuiTableCell-root MuiTableCell-head jss52 MuiTableCell-sizeSmall" scope="col">구분</th>
                                                <th class="MuiTableCell-root MuiTableCell-head jss52 MuiTableCell-sizeSmall" scope="col">수집∙이용목적</th>
                                                <th class="MuiTableCell-root MuiTableCell-head jss52 MuiTableCell-sizeSmall" scope="col">수집∙이용항목</th>
                                                <th class="MuiTableCell-root MuiTableCell-head jss52 MuiTableCell-sizeSmall" scope="col">보유 및 이용기간</th>
                                            </tr>
                                            </thead>
                                            <tbody class="MuiTableBody-root jss56 jss57">
                                            <tr class="MuiTableRow-root">
                                                <td class="MuiTableCell-root MuiTableCell-body jss61 MuiTableCell-sizeSmall">예약자(구매자)</td>
                                                <td class="MuiTableCell-root MuiTableCell-body jss61 MuiTableCell-sizeSmall">서비스 이용 및 계약의 이행, 본인 확인, 부정 이용 방지와 불만처리 등 민원처리</td>
                                                <td class="MuiTableCell-root MuiTableCell-body jss61 MuiTableCell-sizeSmall">
                                                    <div>필수 : 이름, 생년월일, 휴대전화번호</div>
                                                    <div>선택 : 이메일</div>
                                                </td>
                                                <td class="MuiTableCell-root MuiTableCell-body jss61 MuiTableCell-sizeSmall">
                                                    <span class="jss35">이용 종료 후 1년까지</span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="mt2">※ 동의를 거부할 수 있으나 거부 시 숙박 예약이 제한될 수 있습니다</div>
                                </div>
                            </div>
                            <div class="jss38">
                                <label class="MuiFormControlLabel-root">
                                        <span class="MuiButtonBase-root MuiIconButton-root jss40 MuiCheckbox-root MuiCheckbox-colorPrimary MuiIconButton-colorPrimary" aria-disabled="false">
                                            <span class="MuiIconButton-label">
                                                <input type="checkbox" class="jss43" data-indeterminate="false" value name="chk">
                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                    <path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"></path>
                                                </svg>
                                            </span>
                                            <span class="MuiTouchRipple-root"></span>
                                        </span>
                                    <span class="MuiTypography-root MuiFormControlLabel-label MuiTypography-body1">(필수) 개인정보 제3자제공에 동의</span>
                                </label>
                            </div>
                            <div class="jss39">
                                <div class="jss28">
                                    <div class="jss33">주식회사 김명호는 숙박 예약에 필요한 최소한의 개인정보를 제공하고 있으며 동의받은 목적 외 용도로 제공하지 않습니다.</div>
                                    <div class="jss44 jss32 jss46">
                                        <table class="MuiTable-root jss45">
                                            <colgroup>
                                                <col style="width: 15%;">
                                                <col style="width: 35%;">
                                                <col style="width: 35%;">
                                                <col style="width: 15%;">
                                            </colgroup>
                                            <thead class="MuiTableHead-root jss48 jss49">
                                            <tr class="MuiTableRow-root">
                                                <th class="MuiTableCell-root MuiTableCell-head jss52 MuiTableCell-sizeSmall" scope="col">제공받는 자</th>
                                                <th class="MuiTableCell-root MuiTableCell-head jss52 MuiTableCell-sizeSmall" scope="col">제공 목적</th>
                                                <th class="MuiTableCell-root MuiTableCell-head jss52 MuiTableCell-sizeSmall" scope="col">제공 정보</th>
                                                <th class="MuiTableCell-root MuiTableCell-head jss52 MuiTableCell-sizeSmall" scope="col">보유 및 이용기간</th>
                                            </tr>
                                            </thead>
                                            <tbody class="MuiTableBody-root jss56 jss57">
                                            <tr class="MuiTableRow-root">
                                                <td class="MuiTableCell-root MuiTableCell-body jss61 MuiTableCell-sizeSmall">
                                                    <span class="jss35">삼척 콩앤삐펜션</span>
                                                </td>
                                                <td class="MuiTableCell-root MuiTableCell-body jss61 MuiTableCell-sizeSmall">
                                                    <span class="jss35">예약 상품의 서비스 제공 및 계약의 이행을 위한 본인확인 및 미성년자 여부 확인</span>
                                                </td>
                                                <td class="MuiTableCell-root MuiTableCell-body jss61 MuiTableCell-sizeSmall">예약자(이름, 생년월일, 휴대전화번호, 이메일)</td>
                                                <td class="MuiTableCell-root MuiTableCell-body jss61 MuiTableCell-sizeSmall">
                                                    <span class="jss35">이용 종료 후 1년까지</span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="mt2">※ 동의를 거부할 수 있으나 거부 시 숙박 예약이 제한될 수 있습니다</div>
                                </div>
                            </div>
                            <div class="jss38">
                                <label class="MuiFormControlLabel-root">
                                        <span class="MuiButtonBase-root MuiIconButton-root jss40 MuiCheckbox-root MuiCheckbox-colorPrimary MuiIconButton-colorPrimary" aria-disabled="false">
                                            <span class="MuiIconButton-label">
                                                <input class="jss43" type="checkbox" data-indeterminate="false" value="" name="chk">
                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                    <path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"></path>
                                                </svg>
                                            </span>
                                            <span class="MuiTouchRipple-root"></span>
                                        </span>
                                    <span class="MuiTypography-root MuiFormControlLabel-label MuiTypography-body1">(필수) 이용자가 미성년자가 아니며 성인임에 동의</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-sm-12 MuiGrid-grid-md-6">
                    <div>
                        <h3 class="jss36">예약정보입력</h3>

                        <div class="jss37"><table class="MuiTable-root jss68">
                            <tbody>
                            <tr>
                                <th style="padding-top: 24px;">예약자명 <i class="jss69">*</i></th>
                                <td style="padding-top: 16px;">
                                    <div class="MuiFormControl-root MuiTextField-root jss71 jss75 MuiFormControl-marginNormal MuiFormControl-fullWidth">
                                        <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorSecondary MuiOutlinedInput-colorSecondary MuiInputBase-fullWidth MuiInputBase-formControl">
                                            <input aria-invalid="false" type="text" name="userName" id="userName" class="MuiInputBase-input MuiOutlinedInput-input" value="<c:out value="${userVo.userName}"></c:out>">
                                            <fieldset aria-hidden="true" class="jss77 MuiOutlinedInput-notchedOutline" style="padding-left: 30.375px;">
                                                <legend class="jss78" style="width: 0.01px;">
                                                    <span>&ZeroWidthSpace;</span>
                                                </legend>
                                            </fieldset>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>연락처<i class="jss69"> *</i></th>
                                <td>
                                    <div class="MuiGrid-root jss86 jss79 MuiGrid-container MuiGrid-spacing-xs-2">
                                        <div class="MuiGrid-root jss80 jss81 MuiGrid-item MuiGrid-grid-sm-4">
                                            <div class="MuiFormControl-root MuiTextField-root jss71 jss75 MuiFormControl-marginNormal MuiFormControl-fullWidth">
                                                <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorSecondary MuiOutlinedInput-colorSecondary MuiInputBase-fullWidth MuiInputBase-formControl">
                                                    <input aria-invalid="false" type="text" id="hp1" name="hp1" class="MuiInputBase-input MuiOutlinedInput-input" value="<c:out value="${userVo.hp1}"></c:out>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                    <fieldset aria-hidden="true" class="jss77 MuiOutlinedInput-notchedOutline" style="padding-left: 8px;">
                                                        <legend class="jss78" style="width: 0.01px;">
                                                            <span>&ZeroWidthSpace;</span>
                                                        </legend>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="MuiGrid-root jss80 jss81 MuiGrid-item MuiGrid-grid-sm-4">
                                            <div class="MuiFormControl-root MuiTextField-root jss71 jss75 MuiFormControl-marginNormal MuiFormControl-fullWidth">
                                                <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorSecondary MuiOutlinedInput-colorSecondary MuiInputBase-fullWidth MuiInputBase-formControl">
                                                    <input aria-invalid="false" type="text" id="hp2" name="hp2" class="MuiInputBase-input MuiOutlinedInput-input" value="<c:out value="${userVo.hp2}"></c:out>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                    <fieldset aria-hidden="true" class="jss77 MuiOutlinedInput-notchedOutline" style="padding-left: 8px;">
                                                        <legend class="jss78" style="width: 0.01px;">
                                                            <span>&ZeroWidthSpace;</span>
                                                        </legend>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="MuiGrid-root jss80 jss81 MuiGrid-item MuiGrid-grid-sm-4">
                                            <div class="MuiFormControl-root MuiTextField-root jss71 jss75 MuiFormControl-marginNormal MuiFormControl-fullWidth">
                                                <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorSecondary MuiOutlinedInput-colorSecondary MuiInputBase-fullWidth MuiInputBase-formControl">
                                                    <input aria-invalid="false" type="text" id="hp3" name="hp3" class="MuiInputBase-input MuiOutlinedInput-input" value="<c:out value="${userVo.hp3}"></c:out>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                    <fieldset aria-hidden="true" class="jss77 MuiOutlinedInput-notchedOutline" style="padding-left: 8px;">
                                                        <legend class="jss78" style="width: 0.01px;">
                                                            <span>&ZeroWidthSpace;</span>
                                                        </legend>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일<i class="jss69"> *</i></th>
                                <td>
                                    <div class="MuiFormControl-root MuiTextField-root jss71 MuiFormControl-marginDense MuiFormControl-fullWidth">
                                        <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorSecondary MuiOutlinedInput-colorSecondary MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                                            <input aria-invalid="false" type="text" name="userEmail" id="userEmail" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense" value="<c:out value="${userVo.userEmail}"></c:out>" placeholder="ex)test@naver.com">
                                            <fieldset aria-hidden="true" class="jss77 MuiOutlinedInput-notchedOutline" style="padding-left: 25.875px;">
                                                <legend class="jss78" style="width: 0.01px;">
                                                    <span>&ZeroWidthSpace;</span>
                                                </legend>
                                            </fieldset>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>예약요청사항</th>
                                <td>
                                    <div class="MuiFormControl-root MuiTextField-root jss71 MuiFormControl-marginNormal MuiFormControl-fullWidth">
                                        <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorSecondary MuiOutlinedInput-colorSecondary MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-multiline MuiOutlinedInput-multiline">
                                            <textarea aria-invalid="false" rows="4" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMultiline MuiOutlinedInput-inputMultiline" placeholder="요청사항(최대125자/한글)" name="etc"></textarea>
                                            <fieldset aria-hidden="true" class="jss77 MuiOutlinedInput-notchedOutline" style="padding-left: 67.875px;">
                                                <legend class="jss78" style="width: 0.01px;">
                                                    <span>&ZeroWidthSpace;</span>
                                                </legend>
                                            </fieldset>
                                        </div>
                                        <p class="MuiFormHelperText-root MuiFormHelperText-contained">기타 업소측에 요청하실 사항을 입력하세요.</p>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </div>
                    </div>
                    <div class="mt5"></div>
                    <div>
                        <div class="MuiGrid-root jss97 MuiGrid-container">
                            <h3>결제정보</h3>
                            <div class="jss113"></div>
                        </div>
                        <table class="MuiTable-root jss92">
                            <tbody>
                            <tr>
                                <th>총 결제 금액</th>
                                <td class="jss100">
                                    <label for="pay_total"><span class="jss101">?????</span></label>
                                    원

                                </td>
                            </tr>
                            <tr>
                                <th>결제 수단</th>
                                <td>
                                    <div class="MuiFormGroup-root MuiFormGroup-row" role="radiogroup"><div>
                                        <label class="MuiFormControlLabel-root">
                                                    <span class="MuiButtonBase-root MuiIconButton-root jss145 MuiRadio-root MuiRadio-colorPrimary MuiIconButton-colorPrimary" aria-disabled="false">
                                                        <span class="MuiIconButton-label">
                                                            <input class="jss148" type="radio" value="1" name="pay_type"><!-- 신용카드 -->
                                                            <div class="jss149">
                                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"></path>
                                                                </svg>
                                                                <svg class="MuiSvgIcon-root jss150" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                                    <path d="M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"></path>
                                                                </svg>
                                                            </div>
                                                        </span>
                                                        <span class="MuiTouchRipple-root"></span>
                                                    </span>
                                            <span class="MuiTypography-root MuiFormControlLabel-label MuiTypography-body1">신용카드</span>
                                        </label>
                                    </div>
                                        <div>
                                            <label class="MuiFormControlLabel-root">
                                                    <span class="MuiButtonBase-root MuiIconButton-root jss145 MuiRadio-root MuiRadio-colorPrimary MuiIconButton-colorPrimary" aria-disabled="false">
                                                        <span class="MuiIconButton-label">
                                                            <input class="jss148" type="radio" value="2" name="pay_type"><!-- 무통장 -->
                                                            <div class="jss149">
                                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"></path>
                                                                </svg>
                                                                <svg class="MuiSvgIcon-root jss150" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
                                                                    <path d="M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"></path>
                                                                </svg>
                                                            </div>
                                                        </span>
                                                        <span class="MuiTouchRipple-root"></span>
                                                    </span>
                                                <span class="MuiTypography-root MuiFormControlLabel-label MuiTypography-body1">무통장입금</span>
                                            </label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <!-- 컨트롤러로 전송 -->
                        <form action="#none" method="get">
                            <input type="hidden" name="start_date" id="start_date" class="jss21" value="">
                            <input type="hidden" name="end_date" id="end_date" class="jss21" value="">
                            <input type="hidden" name="pay_oneDay" id="pay_oneDay" value="">
                            <input type="hidden" name="reservation_no" id="reservation_no" value="">
                            <input type="hidden" name="pay_total" id="pay_total" value="">
                        </form>
                        <div class="MuiGrid-root jss86 jss99 MuiGrid-container MuiGrid-spacing-xs-2">
                            <div class="MuiGrid-root jss123 MuiGrid-item MuiGrid-grid-xs-6">
                                <button class="MuiButtonBase-root MuiButton-root MuiButton-outlined jss127 jss132 jss126 MuiButton-outlinedSecondary MuiButton-outlinedSizeLarge MuiButton-sizeLarge MuiButton-fullWidth" tabindex="0" type="button" onclick="back();">
                                    <span class="MuiButton-label">
                                        <span>취소(이전단계)</span>
                                    </span>
                                    <span class="MuiTouchRipple-root"></span>
                                </button>
                            </div>
                            <div class="MuiGrid-root jss123 MuiGrid-item MuiGrid-grid-xs-6">
                                <button class="MuiButtonBase-root MuiButton-root MuiButton-contained jss127 jss132 jss126 MuiButton-containedPrimary MuiButton-containedSizeLarge MuiButton-sizeLarge MuiButton-fullWidth" tabindex="0" type="button" onclick="test.paymentSend();">
                                    <span class="MuiButton-label">
                                        <span>결제하기</span>
                                    </span>
                                    <span class="MuiTouchRipple-root"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="resources/static/js/jquery.js"></script>
<script src="resources/static/js/bootstrap.min.js"></script>
<script src="resources/static/js/jquery.scrollUp.min.js"></script>
<script src="resources/static/js/price-range.js"></script>
<script src="resources/static/js/jquery.prettyPhoto.js"></script>
<script src="resources/static/js/main.js"></script>
</body>
</html>