package com.example.mytripreal.vo;

import lombok.Data;

import java.util.Date;

@Data
public class AdminVo {

    private String email;
    private String password;
    private String name;
    private String level;
    private String useYn;
    private Date regDate;
    private Date updDate;
    private Date lateDate;

}
