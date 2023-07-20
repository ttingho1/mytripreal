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
	<link rel="stylesheet" href="resources/static/css/itemdetail.css">
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

			var person=0;
			person=person_count();
			console.log(person);
			if(person>0){
				if(room=='스텐다드'){

					$('.stay_person').text("숙박인원 : "+person+"인");
					$('.stay_room').text("스텐다드 룸 :"+Math.ceil(person/2)+"개");
					$('.stay_date').text("머무는기간 : "+days+"일");
					$('.stay_pay').text("가격은 총 "+Math.ceil(person/2)*10*days+"만원 입니다.");
					$('.stay_pay').append("<br/><h4>이대로 결제하시겠어요?</h4>");

				}else if(room=='슈페리어'){
					if(person<4)
						person=4;
					$('.stay_person').text("숙박인원 : "+person+"인");
					$('.stay_room').text("스텐다드 룸 :"+Math.ceil(person/2)+"개");
					$('.stay_date').text("머무는기간 : "+days+"일");
					$('.stay_pay').text("가격은 총 "+Math.ceil(person/4)*19*days+"만원 입니다.");
					$('.stay_pay').append("<br/><h4>이대로 결제하시겠어요?</h4>");

				}else{
					if(person<8)
						person=6;

					$('.stay_person').text("숙박인원 : "+person+"인");
					$('.stay_room').text("스텐다드 룸 :"+Math.ceil(person/2)+"개");
					$('.stay_date').text("머무는기간 : "+days+"일");
					$('.stay_pay').text("가격은 총 "+Math.ceil(person/8)*36*days+"만원 입니다.");
					$('.stay_pay').append("<br/><h4>이대로 결제하시겠어요?</h4>");

				}

			}else{
				alert("숙박인원이 1인 이상이어야 합니다");
			}
		}

		//사람 수 체크 함수
		function person_count(){
			var person=$('.person_select').text();
			if(person=='성인 2인'){
				return 2;
			}else if(person=='성인 3~4인'){
				return 4;
			}else if(person=='성인 5~6인'){
				return 6;
			}else{
				return person;
			}
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

		//객실 예약 함수
		function book_insert(room,days,book_checkin,person,needrooms){

			var book_checkout=$('#checkout_date').val();
			if(days==0)
				days=1;

			var pay;
			if(room=='room1'){
				pay=Math.ceil(person/2)*10*days
			}else if(room=='room2'){
				pay=Math.ceil(person/4)*19*days
			}else{
				pay=Math.ceil(person/8)*36*days
			}
			$.ajax({
				url:'/bookinsert',
				type:'post',
				data:{'room':room,'pay':pay,'stay':days,'checkin':book_checkin,'checkout':book_checkout,'person':sessionid,'needrooms':needrooms},
				success:function(result){
					$('body').html(result);
				}
			})
		}

		//객실예약
		$(document).on('click','.room_submit',function(){
			$('.modal').fadeIn('slow');
			carcur();
		})
		$('.ok').click(function(){
			roomsubmit();
		})
		$('.no').click(function(){
			$('.modal').fadeOut('slow');

		})

		//남은객실 확인
		$('.remaining_btn').click(function(){
			if(cur_room=="room4")
				cur_room="room3";
			$.ajax({
				url:'/remainingrooms',
				type:'post',
				data:{'room':cur_room},
				success:function(result){
					checkout_room(result);
				}
			})
		})

		$('.person4').click(function(){
			$('.person_select').toggle();
			$('.toggle_person').toggle();
		})

		// 사람수 직접입력 기능
		$('#person_input').keyup(function(){
			if($('#person_input').val()>100){
				$('#person_input').val(100);
			}
			$('.person_select').text($('#person_input').val());

		})
		//룸 선택 시 함수
		function roomselect(data){
			slidesw=true;
			$('.imgbox').text("");
			$('.slider').text("");
			$.ajax({
				url:'/roomselect',
				type:'post',
				data:{'room':data},
				dataType:'json',
				success:function(result){
					listcnt=result.length;
					for(var i=0;i<result.length;i++){
						$('.imgbox').append('<img src="../img/'+data+'/'+result[i]+'">');
						$('.slider').append('<img id="'+i+'" src="../img/'+data+'/'+result[i]+'">');

						if(i==0){
							$('#'+curimgnum).attr('class','active_img');
						}
					}
				}
			})
		}

		//기본 룸 세팅
		roomselect("room1");
		//룸 선택 버튼 클릭 함수
		$('.btn_box button').click(function(){
			$('.btn_box button').css({'background':'#2c4162'});
			$(this).css({'background':'salmon'});
			margin=0;
			$('.imgbox').stop().animate({'margin-left':margin+'%'},500);
			cur_room=$(this).prop('id');
			curimgnum=0;
			roomselect(cur_room);
			$('.remaining_div').fadeOut('slow');


		});

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

		// 미완성 - 객실선택마다 총합계인데 String으로 돼있어서 애매함
		const room201 = $('.cost-80000').val();
		const room202 = $('.cost-90000').val();
		const room203 = $('.cost-100000').val();

		$('.cost-80000').click(function(){
			// alert('1');
			//getDateDiff(newCheckIn, newCheckOut);
			$('.totalPayment').html(room201);
		})
		$('.cost-90000').click(function(){
			// alert('2');
			$('.totalPayment').html(room202);
		})
		$('.cost-100000').click(function(){
			// alert('3');
			$('.totalPayment').html(room203);
		})


	});

	/* 문서로딩시 제이쿼리 실행끝 */


</script>
<body>
<jsp:include page="common/header.jsp"/><!--header.jsp -->
<section id="cart_items">
	<div class="container">
		<div class="jss20 bookingSection jss15">
			<div class="MuiGrid-root jss21 sectionHeader MuiGrid-container">숙박기간</div>
			<div class="MuiGrid-root jss22 sectionContainer MuiGrid-container">
				<form class="jss99">
					<div class="jss100">
						<div class="jss101">
							<svg class="MuiSvgIcon-root small-calendar" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
								<path d="M9 11H7v2h2v-2zm4 0h-2v2h2v-2zm4 0h-2v2h2v-2zm2-7h-1V2h-2v2H8V2H6v2H5c-1.11 0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V9h14v11z"></path>
							</svg>
						</div>
						<div class="jss102">
							<div class="MuiFormControl-root MuiTextField-root jss125 MuiFormControl-fullWidth">
								<label class="MuiFormLabel-root MuiFormLabel-colorSecondary MuiInputLabel-root MuiInputLabel-formControl MuiInputLabel-animated MuiInputLabel-shrink MuiInputLabel-outlined Mui-disabled Mui-disabled MuiFormLabel-filled" data-shrink="true">입실일</label>
								<div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorSecondary MuiOutlinedInput-colorSecondary MuiInputBase-fullWidth MuiInputBase-formControl">
									<input type="text" aria-invalid="false" class="MuiInputBase-input MuiOutlinedInput-input"  name="checkin" id="checkin_date">
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
									<input aria-invalid="false" type="text" class="MuiInputBase-input MuiOutlinedInput-input Mui-disabled Mui-disabled" name="checkout" id="checkout_date">
									<fieldset aria-hidden="true" class="jss131 MuiOutlinedInput-notchedOutline" style="padding-left: 8px;">
										<legend class="jss132" style="width: 55.25px;">
											<span>&ZeroWidthSpace;</span>
										</legend>
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="review-payment">
			<h2>객실선택</h2>
		</div>
		<!-- 캘린더팝업(임시) -->
		<!--<div class="jss106 big-calendar" tabindex="-1">
			<div class="jss107">
				<div class="jss108">
					2023-06-23
					~
					2023-06-24
					<span class="jss124">1박</span>
				</div>
				<div class="jss108 jss122"></div>
				<div class="jss111">"입실일 선택후, 퇴실일을 선택해주세요."</div>
				<button class="jss109">
					<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
						<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
					</svg>
				</button>
			</div>
			<div class="booking-date-picker-wrapper">
				<div class="jss110">
					<div role="application" aria-label="Calendar" class="DayPicker DayPicker_1 DayPicker__horizontal DayPicker__horizontal_2 DayPicker__withBorder DayPicker__withBorder_3" style="width: 605px;">
						<div>
							<div class style="width: 604px;">
								<div class="DayPicker_weekHeaders DayPicker_weekHeaders_1 DayPicker_weekHeaders__horizontal DayPicker_weekHeaders__horizontal_2">
									<div class="DayPicker_weekHeader DayPicker_weekHeader_1" style="left: 0px; padding: 0px 13px;">
										<ul class="DayPicker_weekHeader_ul DayPicker_weekHeader_ul_1">
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>일</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>월</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>화</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>수</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>목</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>금</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>토</small></li>
										</ul>
									</div>
									<div class="DayPicker_weekHeader DayPicker_weekHeader_1" style="left: 293px; padding: 0px 13px;">
										<ul class="DayPicker_weekHeader_ul DayPicker_weekHeader_ul_1">
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>일</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>월</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>화</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>수</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>목</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>금</small></li>
											<li class="DayPicker_weekHeader_li DayPicker_weekHeader_li_1" style="width: 35px;"><small>토</small></li>
										</ul>
									</div>
								</div>
								<div class="DayPicker_focusRegion DayPicker_focusRegion_1" role="region" tabindex="-1">
									<div class="test DayPickerNavigation DayPickerNavigation_1 DayPickerNavigation__horizontal DayPickerNavigation__horizontal_2">
										<div role="button" tabindex="0" class="DayPickerNavigation_button DayPickerNavigation_button_1 DayPickerNavigation_button__horizontal DayPickerNavigation_button__horizontal_2" aria-label="Move backward to switch to the previous month.">
											<div></div>
										</div>

										<div role="button" tabindex="0" class="DayPickerNavigation_button DayPickerNavigation_button_1 DayPickerNavigation_button__horizontal DayPickerNavigation_button__horizontal_2" aria-label="Move forward to switch to the next month.">
											<div></div>
										</div>
									</div>
									<div class="DayPicker_transitionContainer DayPicker_transitionContainer_1 DayPicker_transitionContainer__horizontal DayPicker_transitionContainer__horizontal_2" style="width: 604px; height: 358px;">
										<div class="CalendarMonthGrid CalendarMonthGrid_1 CalendarMonthGrid__horizontal CalendarMonthGrid__horizontal_2">
											<div class="CalendarMonthGrid_month__horizontal CalendarMonthGrid_month__horizontal_1 CalendarMonthGrid_month__hideForAnimation CalendarMonthGrid_month__hideForAnimation_2 CalendarMonthGrid_month__hidden CalendarMonthGrid_month__hidden_3">
												<div class="CalendarMonth CalendarMonth_1" data-visible="false" style="padding: 0px 13px;">
													<div class="CalendarMonth_caption CalendarMonth_caption_1">
														<strong>2023. 5</strong>
													</div>
													<table class="CalendarMonth_table CalendarMonth_table_1" role="presentation">
														<tbody>
														<tr>
															<td></td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 월요일, 2023년 5월 1일" tabindex="-1" style="width: 38px; height: 37px;">1</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 화요일, 2023년 5월 2일" tabindex="-1" style="width: 38px; height: 37px;">2</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 수요일, 2023년 5월 3일" tabindex="-1" style="width: 38px; height: 37px;">3</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 목요일, 2023년 5월 4일" tabindex="-1" style="width: 38px; height: 37px;">4</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 금요일, 2023년 5월 5일" tabindex="-1" style="width: 38px; height: 37px;">5</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 토요일, 2023년 5월 6일" tabindex="-1" style="width: 38px; height: 37px;">6</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 일요일, 2023년 5월 7일" tabindex="-1" style="width: 38px; height: 37px;">7</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 월요일, 2023년 5월 8일" tabindex="-1" style="width: 38px; height: 37px;">8</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 화요일, 2023년 5월 9일" tabindex="-1" style="width: 38px; height: 37px;">9</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 수요일, 2023년 5월 10일" tabindex="-1" style="width: 38px; height: 37px;">10</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 목요일, 2023년 5월 11일" tabindex="-1" style="width: 38px; height: 37px;">11</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 금요일, 2023년 5월 12일" tabindex="-1" style="width: 38px; height: 37px;">12</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 토요일, 2023년 5월 13일" tabindex="-1" style="width: 38px; height: 37px;">13</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 일요일, 2023년 5월 14일" tabindex="-1" style="width: 38px; height: 37px;">14</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 월요일, 2023년 5월 15일" tabindex="-1" style="width: 38px; height: 37px;">15</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 화요일, 2023년 5월 16일" tabindex="-1" style="width: 38px; height: 37px;">16</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 수요일, 2023년 5월 17일" tabindex="-1" style="width: 38px; height: 37px;">17</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 목요일, 2023년 5월 18일" tabindex="-1" style="width: 38px; height: 37px;">18</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 금요일, 2023년 5월 19일" tabindex="-1" style="width: 38px; height: 37px;">19</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 토요일, 2023년 5월 20일" tabindex="-1" style="width: 38px; height: 37px;">20</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 일요일, 2023년 5월 21일" tabindex="-1" style="width: 38px; height: 37px;">21</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 월요일, 2023년 5월 22일" tabindex="-1" style="width: 38px; height: 37px;">22</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 화요일, 2023년 5월 23일" tabindex="-1" style="width: 38px; height: 37px;">23</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 수요일, 2023년 5월 24일" tabindex="-1" style="width: 38px; height: 37px;">24</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 목요일, 2023년 5월 25일" tabindex="-1" style="width: 38px; height: 37px;">25</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 금요일, 2023년 5월 26일" tabindex="-1" style="width: 38px; height: 37px;">26</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 토요일, 2023년 5월 27일" tabindex="-1" style="width: 38px; height: 37px;">27</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 일요일, 2023년 5월 28일" tabindex="-1" style="width: 38px; height: 37px;">28</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 월요일, 2023년 5월 29일" tabindex="-1" style="width: 38px; height: 37px;">29</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 화요일, 2023년 5월 30일" tabindex="-1" style="width: 38px; height: 37px;">30</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 수요일, 2023년 5월 31일" tabindex="-1" style="width: 38px; height: 37px;">31</td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="CalendarMonthGrid_month__horizontal CalendarMonthGrid_month__horizontal_1">
												<div class="CalendarMonth CalendarMonth_1" data-visible="true" style="padding: 0px 13px;">
													<div class="CalendarMonth_caption CalendarMonth_caption_1">
														<strong>2023. 6</strong>
													</div>
													<table class="CalendarMonth_table CalendarMonth_table_1" role="presentation">
														<tbody>
														<tr>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 목요일, 2023년 6월 1일" tabindex="-1" style="width: 38px; height: 37px;">1</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 금요일, 2023년 6월 2일" tabindex="-1" style="width: 38px; height: 37px;">2</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 토요일, 2023년 6월 3일" tabindex="-1" style="width: 38px; height: 37px;">3</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 일요일, 2023년 6월 4일" tabindex="-1" style="width: 38px; height: 37px;">4</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 월요일, 2023년 6월 5일" tabindex="-1" style="width: 38px; height: 37px;">5</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 화요일, 2023년 6월 6일" tabindex="-1" style="width: 38px; height: 37px;">6</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 수요일, 2023년 6월 7일" tabindex="-1" style="width: 38px; height: 37px;">7</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 목요일, 2023년 6월 8일" tabindex="-1" style="width: 38px; height: 37px;">8</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 금요일, 2023년 6월 9일" tabindex="-1" style="width: 38px; height: 37px;">9</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 토요일, 2023년 6월 10일" tabindex="-1" style="width: 38px; height: 37px;">10</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 일요일, 2023년 6월 11일" tabindex="-1" style="width: 38px; height: 37px;">11</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 월요일, 2023년 6월 12일" tabindex="-1" style="width: 38px; height: 37px;">12</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 화요일, 2023년 6월 13일" tabindex="-1" style="width: 38px; height: 37px;">13</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 수요일, 2023년 6월 14일" tabindex="-1" style="width: 38px; height: 37px;">14</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 목요일, 2023년 6월 15일" tabindex="-1" style="width: 38px; height: 37px;">15</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_4" role="button" aria-label="Not available. 금요일, 2023년 6월 16일" tabindex="-1" style="width: 38px; height: 37px;">16</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 토요일, 2023년 6월 17일" tabindex="-1" style="width: 38px; height: 37px;">17</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__defaultCursor CalendarDay__defaultCursor_2 CalendarDay__default CalendarDay__default_3 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_4 CalendarDay__blocked_out_of_range CalendarDay__blocked_out_of_range_5" role="button" aria-label="Not available. 일요일, 2023년 6월 18일" tabindex="-1" style="width: 38px; height: 37px;">18</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__today CalendarDay__today_3" role="button" aria-label="Choose 월요일, 2023년 6월 19일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">19</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 6월 20일 as your check-in date. It's available." tabindex="-1" style="width: 38px; height: 37px;">20</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 6월 21일 as your check-in date. It's available." tabindex="-1" style="width: 38px; height: 37px;">21</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 6월 22일 as your check-in date. It's available." tabindex="-1" style="width: 38px; height: 37px;">22</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__selected_span CalendarDay__selected_span_3 CalendarDay__last_in_range CalendarDay__last_in_range_4 CalendarDay__selected_start CalendarDay__selected_start_5 CalendarDay__selected CalendarDay__selected_6" role="button" aria-label="Selected. 금요일, 2023년 6월 23일" tabindex="0" style="width: 38px; height: 37px;">23</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3 CalendarDay__selected_end CalendarDay__selected_end_4 CalendarDay__selected CalendarDay__selected_5" role="button" aria-label="Selected. 토요일, 2023년 6월 24일" tabindex="-1" style="width: 38px; height: 37px;">24</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 6월 25일 as your check-in date. It's available." tabindex="-1" style="width: 38px; height: 37px;">25</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 6월 26일 as your check-in date. It's available." tabindex="-1" style="width: 38px; height: 37px;">26</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 6월 27일 as your check-in date. It's available." tabindex="-1" style="width: 38px; height: 37px;">27</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 6월 28일 as your check-in date. It's available." tabindex="-1" style="width: 38px; height: 37px;">28</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 6월 29일 as your check-in date. It's available." tabindex="-1" style="width: 38px; height: 37px;">29</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 금요일, 2023년 6월 30일 as your check-in date. It's available." tabindex="-1" style="width: 38px; height: 37px;">30</td>
															<td></td>
														</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="CalendarMonthGrid_month__horizontal CalendarMonthGrid_month__horizontal_1">
												<div class="CalendarMonth CalendarMonth_1" data-visible="true" style="padding: 0px 13px;">
													<div class="CalendarMonth_caption CalendarMonth_caption_1">
														<strong>2023. 7</strong>
													</div>
													<table class="CalendarMonth_table CalendarMonth_table_1" role="presentation">
														<tbody>
														<tr>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3" role="button" aria-label="Choose 토요일, 2023년 7월 1일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">1</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 7월 2일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">2</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 7월 3일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">3</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 7월 4일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">4</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 7월 5일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">5</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 7월 6일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">6</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 금요일, 2023년 7월 7일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">7</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3" role="button" aria-label="Choose 토요일, 2023년 7월 8일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">8</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 7월 9일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">9</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 7월 10일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">10</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 7월 11일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">11</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 7월 12일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">12</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 7월 13일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">13</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 금요일, 2023년 7월 14일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">14</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3" role="button" aria-label="Choose 토요일, 2023년 7월 15일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">15</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 7월 16일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">16</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 7월 17일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">17</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 7월 18일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">18</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 7월 19일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">19</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 7월 20일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">20</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 금요일, 2023년 7월 21일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">21</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3" role="button" aria-label="Choose 토요일, 2023년 7월 22일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">22</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 7월 23일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">23</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 7월 24일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">24</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 7월 25일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">25</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 7월 26일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">26</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 7월 27일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">27</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 금요일, 2023년 7월 28일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">28</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3" role="button" aria-label="Choose 토요일, 2023년 7월 29일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">29</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 7월 30일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">30</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 7월 31일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">31</td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="CalendarMonthGrid_month__horizontal CalendarMonthGrid_month__horizontal_1 CalendarMonthGrid_month__hidden CalendarMonthGrid_month__hidden_2">
												<div class="CalendarMonth CalendarMonth_1" data-visible="false" style="padding: 0px 13px;">
													<div class="CalendarMonth_caption CalendarMonth_caption_1">
														<strong>2023. 8</strong>
													</div>
													<table class="CalendarMonth_table CalendarMonth_table_1" role="presentation">
														<tbody>
														<tr>
															<td></td>
															<td></td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 8월 1일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">1</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 8월 2일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">2</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 8월 3일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">3</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 금요일, 2023년 8월 4일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">4</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3" role="button" aria-label="Choose 토요일, 2023년 8월 5일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">5</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 8월 6일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">6</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 8월 7일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">7</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 8월 8일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">8</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 8월 9일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">9</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 8월 10일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">10</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 금요일, 2023년 8월 11일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">11</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3" role="button" aria-label="Choose 토요일, 2023년 8월 12일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">12</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 8월 13일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">13</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 8월 14일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">14</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__highlighted_calendar CalendarDay__highlighted_calendar_3" role="button" aria-label="Choose 화요일, 2023년 8월 15일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">15</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 8월 16일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">16</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 8월 17일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">17</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 금요일, 2023년 8월 18일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">18</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3" role="button" aria-label="Choose 토요일, 2023년 8월 19일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">19</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 8월 20일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">20</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 8월 21일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">21</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 8월 22일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">22</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 8월 23일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">23</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 8월 24일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">24</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 금요일, 2023년 8월 25일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">25</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__lastDayOfWeek CalendarDay__lastDayOfWeek_3" role="button" aria-label="Choose 토요일, 2023년 8월 26일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">26</td>
														</tr>
														<tr>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2 CalendarDay__firstDayOfWeek CalendarDay__firstDayOfWeek_3" role="button" aria-label="Choose 일요일, 2023년 8월 27일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">27</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 월요일, 2023년 8월 28일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">28</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 화요일, 2023년 8월 29일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">29</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 수요일, 2023년 8월 30일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">30</td>
															<td class="CalendarDay CalendarDay_1 CalendarDay__default CalendarDay__default_2" role="button" aria-label="Choose 목요일, 2023년 8월 31일 as your check-in date. It’s available." tabindex="-1" style="width: 38px; height: 37px;">31</td>
															<td></td>
															<td></td>
														</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>-->
		<!-- 캘린더팝업끝(임시) -->
		<ul class="jss26 itemList">
			<li>
				<a class="jss28" href="#none">
					<div><img src="https://via.placeholder.com/110x110" alt=""></div>
					<div class="jss29">
						<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
							<path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"></path>
						</svg>
					</div>
				</a>
				<div class="jss30 itemInfo">
						<span class="jss137 jss135 jss134 jss149">
							<i class="jss136">예약가능</i>
						</span>
					<div class="jss31 itemTitle">201호</div>
					<div class="itemdetail">
						<div>기준2명, 최대2명</div>
						<div>원룸형 / 10평</div>
					</div>
				</div>
				<div class="jss34">
					<div class="jss35">
						<input type="radio" id="room-144501" name="room-200" class="jss36 cost-80000" value="80000">
						<label for="room-144501" class="jss37 selectItemLabel"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
							<path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"></path>
						</svg>
							<span>선택</span>
						</label>
					</div>
					<div class="jss38 priceArea">
						<div class="jss42 cost">80,000원</div>
					</div>
				</div>
			</li>
			<li>
				<a class="jss28" href="#none">
					<div><img src="https://via.placeholder.com/110x110" alt=""></div>
					<div class="jss29">
						<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
							<path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"></path>
						</svg>
					</div>
				</a>
				<div class="jss30 itemInfo">
						<span class="jss137 jss135 jss134 jss149">
							<i class="jss136">예약가능</i>
						</span>
					<div class="jss31 itemTitle">202호</div>
					<div class="itemdetail">
						<div>기준2명, 최대3명</div>
						<div>원룸형 / 12평</div>
					</div>
				</div>
				<div class="jss34">
					<div class="jss35">
						<input type="radio" id="room-144502" name="room-200" class="jss36 cost-90000" value="90000">
						<label for="room-144502" class="jss37 selectItemLabel"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
							<path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"></path>
						</svg>
							<span>선택</span>
						</label>
					</div>
					<div class="jss38 priceArea">
						<div class="jss42 cost">90,000원</div>
					</div>
				</div>
			</li>
			<li>
				<a class="jss28" href="#none">
					<div><img src="https://via.placeholder.com/110x110" alt=""></div>
					<div class="jss29">
						<svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
							<path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"></path>
						</svg>
					</div>
				</a>
				<div class="jss30 itemInfo">
						<span class="jss137 jss135 jss134 jss149">
							<i class="jss136">예약가능</i>
						</span>
					<div class="jss31 itemTitle">203호</div>
					<div class="itemdetail">
						<div>기준2명, 최대4명</div>
						<div>원룸형 / 14평</div>
					</div>
				</div>
				<div class="jss34">
					<div class="jss35">
						<input type="radio" id="room-144503" name="room-200" class="jss36 cost-100000" value="100000">
						<label for="room-144503" class="jss37 selectItemLabel"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="presentation">
							<path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"></path>
						</svg>
							<span>선택</span>
						</label>
					</div>
					<div class="jss38 priceArea">
						<div class="jss42 cost">100,000원</div>
					</div>
				</div>
			</li>
		</ul>
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
				<span class="jss70 totalPayment">0</span>원</div>
			<button class="MuiButton-contained jss74 jss71 MuiButton-containedPrimary " tabindex="0" type="button" style="background-color:#ea1f62; color: white; border-radius:5px;">
						<span class="MuiButton-label">
							<span>예약 결제</span>
						</span>
				<span class="MuiTouchRipple-root"></span>
			</button>
		</div>
	</div>
	</div>
</section> <!--/#cart_items-->
<jsp:include page="common/footer.jsp"/><!--footer.jsp -->
<script src="resources/static/js/bootstrap.min.js"></script>
<script src="resources/static/js/jquery.scrollUp.min.js"></script>
<script src="resources/static/js/price-range.js"></script>
<script src="resources/static/js/jquery.prettyPhoto.js"></script>
<script src="resources/static/js/main.js"></script>
</body>
</html>