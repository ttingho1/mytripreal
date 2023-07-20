package com.example.mytripreal.vo;

import lombok.Data;

@Data
public class BoardVo {

    private int num; // 글번호
    private String userEmail; // 유저이메일
    private String userName; // 이름
    private String subject; // 글제목
    private String content; // 글내용
    private String contentAnswer; // 답변내용
    private String bdRegDate; // 등록날짜
    private String answerYn; // 답변여부   Y : 완료, N : 미완료(default)
    private String answerAdmin; // 답변관리자 이름


}
