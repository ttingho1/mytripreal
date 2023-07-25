package com.example.mytripreal.vo;

import lombok.Data;

import java.util.Date;

@Data
public class RoomVo {

    private int room_no; // 방번호
    private String room_name; // 방이름
    private String room_type; // 방형태 (1:원룸, 2:복층, 3:단체)
    private String room_size; // 방크기
    private String room_fee; // 방 가격
    private String option; // 방 옵션 (수건, 청소기, 헤어드라이어 등등)
    private int person_min; // 최소입실인원(기본:2인)
    private int person_max; // 최대입실인원
    private String main_image; // 메인객실사진
    private String sub_image1; // 객실사진1(=메인객실사진)
    private String sub_image2; // 객실사진2
    private String sub_image3; // 객실사진3
    private String sub_image4; // 객실사진4
    private String sub_image5; // 객실사진5
    private String detail_image1; // 객실상세설명 사진1
    private String detail_image2; // 객실상세설명 사진2
    private String detail_image3; // 객실상세설명 사진3
    private Date checkin; // 체크인 날짜
    private Date checkout; // 체크아웃 날짜
    private String confirm_yn; // 결제확정여부

}
