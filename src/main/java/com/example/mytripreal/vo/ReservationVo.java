package com.example.mytripreal.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ReservationVo {

    private String reservation_no; // 예약번호
    private String userEmail; // 이메일
    private int person; // 인원
    private String etc; // 요구사항
    private String pay_type; // 지불방식(1: 무통장, 2:카드결제)
    private String pay_amount; // 최종결제금액
    private Date start_date; // 입실일
    private Date end_date; // 퇴실일
    private String confirm_yn; // 결제 확정여부
    private String cancel_yn; // 결제 취소여부
    private String refund_yn; // 결제 환불영부
    private Date create_dt; // 데이터 생성일
    private Date update_dt; // 데이터 수정일
}
