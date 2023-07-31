<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
<script>
	/* 문서로딩시 제이쿼리 실행시작 */

	var room;
	$(function(){
		/*
		$('.big-calendar').hide(); // 캘린더 숨기기(기본)
		// 캘린더 보이고 끄기
		$('.small-calendar').click(function(){
			$('.big-calendar').show();
		})
		$('.close-calendar').click(function(){
			$('.big-calendar').hide();
		})
		 */

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

		// 커스텀중
		var cur_room="room1";
		var margin=0;
		var sw=true;
		var listcnt=0;
		var curimgnum=0;
		var slidesw=true;
		var pay;

		function checkout_room(room){

			$('.remaining_table').html('<tr><th>번호</th>');
			$('.remaining_table tr').append('<th>객실명</th>');
			$('.remaining_table tr').append('<th>날짜</th>');
			$('.remaining_table tr').append('<th>남은객실</th></tr>');

			if(room[0].room_type=="room1"){
				type="스텐다드";
			}else if(room[0].room_type=="room2"){
				type="슈페리어";
			}else{
				type="디럭스";
			}
			for(var i=0; i<room.length;i++){

				$('.remaining_table').append('<tr class="'+room[i].room_seq+'">');
				$('.'+room[i].room_seq).append('<td>'+(i+1)+'</td>');
				$('.'+room[i].room_seq).append('<td>'+type+'</td>');
				$('.'+room[i].room_seq).append('<td>'+room[i].room_date+'</td>');
				$('.'+room[i].room_seq).append('<td>'+room[i].room_rem+'</td>');
				$('.remaining_table').append('</tr>');
			}
			$('.remaining_div').fadeIn('slow');
		}

		//계산기 기능
		function carcur(){
			var room=$('.room_select').text();
			var days=staydate();
			if(days==0)
				days=1;

		}

		// 머무르는 기간 함수
		function staydate(){
			var checkin_month=$('#checkin_date').val().substring(5,7);
			var checkin_day=$('#checkin_date').val().substring(8,10);
			var checkout_month=$('#checkout_date').val().substring(5,7);
			var checkout_day=$('#checkout_date').val().substring(8,10);
			var imsi=Number(checkout_day); //형변환 임시변수
			var leftmargin=0; //슬라이드 마진 변수


			if(checkin_month!=checkout_month){
				if(checkin_month=='01'||checkin_month=='03'){

					return 31-checkin_day+imsi;
				}else if(checkin_month=='02'){
					if($('#checkin_date').val().substring(0,4)%400==0){

						return 29-checkin_day+imsi;

					}else{

						return 28-checkin_day+imsi;
					}
				}else{

					return 30-checkin_day+imsi;
				}
			}else{
				return checkout_day-checkin_day;
			}


		}

		$('.remaining_div h3').click(function(){
			$('.remaining_div').fadeOut();
		})

		//룸박스 토글
		$('.person_select').click(function(){
			$('.room_dropbox').hide();
			$('.person_dropbox').toggle();
		})
		$('.person_dropbox div').click(function(){
			$('.person_select').text($(this).text());
			$('.person_dropbox').toggle();
		})
		$('.room_select').click(function(){
			$('.person_dropbox').hide();
			$('.room_dropbox').toggle();
		})
		$('.room_dropbox div').click(function(){
			$('.room_select').text($(this).text());
			$('.room_dropbox').toggle();
		})



		//데이트피커
		$.datepicker.regional['ko'] = {
			changeMonth: false,
			dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat: "yy-mm-dd",
			minDate:1,
			maxDate:31, //오늘 기준 최대 선택 가능 날짜
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		var currentDate = new Date();
		currentDate.setDate(currentDate.getDate()+1);
		$('#checkin_date').datepicker();
		$("#checkout_date").datepicker( "option", "minDate", 31 );

		$('#checkin_date').datepicker("option", "onClose", function ( selectedDate ) {
			$("#checkout_date").datepicker( "option", "minDate", selectedDate );
		});
		$( "#checkin_date" ).datepicker( "setDate", currentDate);
		$('#checkout_date').datepicker();
		$('#checkout_date').datepicker("option", "minDate", $("#checkin_date").val());
		$('#checkout_date').datepicker("option", "onClose", function ( selectedDate ) {
			$("#checkin_date").datepicker( "option", "maxDate", selectedDate );
		});


		$( "#checkout_date" ).datepicker( "setDate", 2); // 체크아웃 선택 시 디폴트로 pocus 되는 날짜/ ex ( "setDate", 5) 는 오늘로부터 5일 뒤


		// 숙박일 계산(처음로딩시)
		const checkIn = $("#checkin_date").val();
		const checkOut = $("#checkout_date").val();
		const getDateDiff = (d1, d2) => {
			const date1 = new Date(d1);
			const date2 = new Date(d2);
			const diffDate = date1.getTime() - date2.getTime();
			return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
		}
		// n박 출력
		$('.nightNum').html(getDateDiff(checkIn, checkOut)+'박');

		// 체크인, 체크아웃 날짜 변경시
		$( '#checkin_date, #checkout_date' ).change(function() {
			const newCheckIn = $( '#checkin_date' ).val();
			const newCheckOut = $( '#checkout_date' ).val();
			const getDateDiff = (d1, d2) => {
				const date1 = new Date(d1);
				const date2 = new Date(d2);
				const diffDate = date1.getTime() - date2.getTime();
				return Math.abs(diffDate / (1000 * 60 * 60 * 24)); // 밀리세컨 * 초 * 분 * 시 = 일
			}
			// n박 출력
			$('.nightNum').html(getDateDiff(newCheckIn, newCheckOut)+'박');
		});


	});
	/* 문서로딩시 제이쿼리 실행끝 */


	// 객실선택시 금액 표시
	function selectRoom(a){
		$('.totalPayment').text($(a).val());
	}

	// 예약하기 버튼 -> 결제페이지 이동
	function validate(){
		let frm = $('#frm');

		if($("input[name='roomSelect']:checked").val() == null){
			alert('방을 선택해주세요.');
			return;
		}
		$("input[name='room_No']").val($("input[name='roomSelect']:checked").attr('id'));
		frm.submit();
	}

	// (임시) 객실검색
	function search(){
		alert('검색기능 개발중');
		var e = window.event;
		e.preventDefault();
	}


</script>
<body>
<jsp:include page="common/header.jsp"/><!--header.jsp -->
<form class="jss99" id="frm" method="post" action="/payment">
	<input type="hidden" name="room_No" value="">
<section id="cart_items">
	<div class="container">
		<div class="jss20 bookingSection jss15">
			<div class="MuiGrid-root jss21 sectionHeader MuiGrid-container">숙박기간</div>
			<div class="MuiGrid-root jss22 sectionContainer MuiGrid-container">
					<div class="jss100">
						<div class="jss102">
							<div class="MuiFormControl-root MuiTextField-root jss125 MuiFormControl-fullWidth">
								<label class="MuiFormLabel-root MuiFormLabel-colorSecondary MuiInputLabel-root MuiInputLabel-formControl MuiInputLabel-animated MuiInputLabel-shrink MuiInputLabel-outlined Mui-disabled Mui-disabled MuiFormLabel-filled" data-shrink="true">입실일</label>
								<div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorSecondary MuiOutlinedInput-colorSecondary MuiInputBase-fullWidth MuiInputBase-formControl">
									<input type="text" aria-invalid="false" class="MuiInputBase-input MuiOutlinedInput-input"  name="checkin_date" id="checkin_date">
									<fieldset aria-hidden="true" class="jss131 MuiOutlinedInput-notchedOutline" style="padding-left: 8px;">
										<legend class="jss132" style="width: 55.25px;">
											<span>&ZeroWidthSpace;</span>
										</legend>
									</fieldset>
								</div>
							</div>
						</div>
						<!-- n박표시 -->
						<div class="jss105 nightNum jss103"></div>
						<div class="jss102">
							<div class="MuiFormControl-root MuiTextField-root jss125 MuiFormControl-fullWidth">
								<label class="MuiFormLabel-root MuiFormLabel-colorSecondary MuiInputLabel-root MuiInputLabel-formControl MuiInputLabel-animated MuiInputLabel-shrink MuiInputLabel-outlined Mui-disabled Mui-disabled MuiFormLabel-filled" data-shrink="true">퇴실일</label>
								<div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorSecondary MuiOutlinedInput-colorSecondary Mui-disabled Mui-disabled MuiInputBase-fullWidth MuiInputBase-formControl">
									<input aria-invalid="false" type="text" class="MuiInputBase-input MuiOutlinedInput-input Mui-disabled Mui-disabled" name="checkout_date" id="checkout_date">
									<fieldset aria-hidden="true" class="jss131 MuiOutlinedInput-notchedOutline" style="padding-left: 8px;">
										<legend class="jss132" style="width: 55.25px;">
											<span>&ZeroWidthSpace;</span>
										</legend>
									</fieldset>
								</div>
							</div>
						</div>
						<div class="jss101">
							<button class="btn btn-success btn-sm" onclick="search();">검색</button>
						</div>
					</div>
			</div>
		</div>
		<div class="review-payment">
			<h2>객실선택</h2>
		</div>
		<!-- 방 목록 -->
		<ul class="jss26 itemList">
			<c:forEach var="roomVo" items="${roomVo}">
				<li>
					<a class="jss28" href="#none">
						<div>
							<img src="${roomVo.main_image}" alt="방 이미지">
						</div>
						<div class="jss29">
							<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
								<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
								<path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"></path>
							</svg>
						</div>
					</a>
					<div class="jss30 itemInfo">
					<span class="jss137 jss135 jss134 jss149">
						<i class="jss136">
							예약가능
							<%--<c:if test="${roomVo.confirm_yn eq 'N'}">
								예약가능
							</c:if>
							<c:if test="${roomVo.confirm_yn eq 'Y'}">
								예약불가능
							</c:if>--%>
						</i>
					</span>
						<div class="jss31 itemTitle">${roomVo.room_name}</div>
						<div class="itemdetail">
							<div>
								기준${roomVo.person_min}명, 최대${roomVo.person_max}명
							</div>
							<div>
								<c:choose>
									<c:when test="${roomVo.room_type eq 1}">원룸형 / ${roomVo.room_size}평</c:when>
									<c:when test="${roomVo.room_type eq 2}">디럭스형 / ${roomVo.room_size}평</c:when>
									<c:otherwise>
										슈퍼디럭스형 / ${roomVo.room_size}평
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="jss34">
						<div class="jss35">
							<input type="radio" id="${roomVo.room_no}" name="roomSelect" class="jss36" value="${roomVo.room_fee}" onclick="selectRoom(this);">
							<label for="${roomVo.room_no}" class="jss37 selectItemLabel">
							<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
								<path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"></path>
							</svg>
							<span>선택</span>
						</div>
						<div class="jss38 priceArea">
							<div class="jss42 cost">${roomVo.room_fee}원</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
		<!-- /방 목록 -->
	</div>
	<div class="jss20 bookingSection">
		<div class="MuiGrid-root jss22 sectionContainer MuiGrid-container">
			<div class="jss45"></div>
		</div>
	</div>
	<div class="jss67 jss13">
		<div class="jss68">
			<div class="jss69">
				<span class="jss72">총 결제금액 : </span>
				<span class="jss70 totalPayment">0&nbsp;</span>원</div>
			<button class="MuiButton-contained jss74 jss71 MuiButton-containedPrimary " tabindex="0" type="button" style="background-color:#ea1f62; color: white; border-radius:5px;" onclick="validate();">
						<span class="MuiButton-label">
							<span>예약하기</span>
						</span>
				<span class="MuiTouchRipple-root"></span>
			</button>
		</div>
	</div>
	</div>
</section> <!--/#cart_items-->
</form>
<jsp:include page="common/footer.jsp"/><!--footer.jsp -->
<script src="resources/static/js/bootstrap.min.js"></script>
<script src="resources/static/js/jquery.scrollUp.min.js"></script>
<script src="resources/static/js/price-range.js"></script>
<script src="resources/static/js/jquery.prettyPhoto.js"></script>
<script src="resources/static/js/main.js"></script>
</body>
</html>