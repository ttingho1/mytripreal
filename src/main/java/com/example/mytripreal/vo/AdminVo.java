package com.example.mytripreal.vo;

import lombok.Data;

import java.util.Date;

@Data
public class AdminVo {

    private String email; // PK
    private String password;
    private String name;
    private String level; // 어드민 기본level : 1, 회원 : null
    private String useYn; // 어드민 사용여부 : Y(default)
    private Date regDate; // 등록일
    private Date updDate; // 수정일
    private Date lateDate; // 마지막접속일

}
