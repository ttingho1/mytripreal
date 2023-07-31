package com.example.mytripreal.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ReservationVo {

    private String reservation_no; // 예약번호 (날짜 년/월/일 + 랜덤문자(숫자포함) 6자리) ex) 202307303ae011
    private String userEmail; // 이메일
    private String userName; // 예약자명
    private String hp1; // 연락처1(010)
    private String hp2; // 연락처2(두번째자리)
    private String hp3; // 연락처3(세번째자리)
    private int person; // 인원
    private String etc; // 요구사항
    private String pay_type; // 지불방식(1: 무통장, 2:카드결제)
    private String pay_total; // 최종결제금액
    private Date start_date; // 입실일
    private Date end_date; // 퇴실일
    private String confirm_yn; // 결제 확정여부
    private String cancel_yn; // 결제 취소여부
    private String refund_yn; // 결제 환불영부
    private Date checkin_date; // 데이터생성날짜 (???)
    private Date checkout_date; // 데이터생성 날짜 (???)
}
