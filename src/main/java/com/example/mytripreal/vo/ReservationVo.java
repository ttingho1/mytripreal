package com.example.mytripreal.vo;

import lombok.Data;

@Data
public class ReservationVo {

    /* reservation_temp */
    private int seq;
    private String userEmail; // 이메일
    private int room_no; // 객실번호
    private String checkin_date; // 입실일
    private String checkout_date; // 퇴실일
    private String confirm_yn; // 결제 확정여부
    private String create_dt; // 데이터 생성날짜(체크인날짜 상관없이 사용자가 예약확정이 된 시점)
    private int nightNum; // n박

    private String reservation_no; // 예약번호 (날짜 년/월/일 + 랜덤문자(숫자포함) 6자리) ex) 202307303ae011
    private String room_fee; // 객실요금(1일)
    private String pay_total; // 최종결제금액
    private String userName; // 예약자명
    private String hp1; // 연락처1(010)
    private String hp2; // 연락처2(두번째자리)
    private String hp3; // 연락처3(세번째자리)
    private String etc; // 요구사항
    private String pay_type; // 지불방식(1: 무통장, 2:카드결제)
    private String cancel_yn; // 결제 취소여부
    private String refund_yn; // 결제 환불여부

}
