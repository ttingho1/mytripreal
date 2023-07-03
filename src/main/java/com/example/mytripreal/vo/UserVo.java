package com.example.mytripreal.vo;


import lombok.Data;

import java.util.Date;

@Data
public class UserVo {

    private String userEmail; // 이메일(아이디) pk
    private String password; // 비밀번호
    private String userName; // 이름
    private String hp1; // 연락처1
    private String hp2; // 연락처2
    private String hp3; // 연락처3
    private String address1; // 주소1
    private String address2; // 주소2
    private String zipCode; // 우편번호
    private Date regDate; // 등록일
    private Date updDate; // 수정일
    private Date lateDate; // 최종접속일
    private String quitYn ; // 탈퇴여부 기본 N
    private String level ; // 관리자 레벨



}
