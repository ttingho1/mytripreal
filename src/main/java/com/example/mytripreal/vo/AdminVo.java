package com.example.mytripreal.vo;

import lombok.Data;

import java.util.Date;

@Data
public class AdminVo {

    private String userEmail; // PK 이메일
    private String password;
    private String userName;
    private String level; // 어드민 기본level : 1, 회원 : null
    private String useYn; // 어드민 사용여부 : Y(default)
    private String regDate; // 등록일
    private String updDate; // 수정일
    private String lateDate; // 마지막접속일

    // 전체회원목록 불러오기 (User 테이블 + Admin 테이블)
    private String address1; // 주소(oo시 oo구 oo동)
    private String address2; // 주소(상세주소)
    private String zipCode; // 우편번호
    
    // 답변달기
    private String contentAnswer; // 답변내용 


}
