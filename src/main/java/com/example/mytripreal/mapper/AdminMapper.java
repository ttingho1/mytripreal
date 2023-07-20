package com.example.mytripreal.mapper;

import com.example.mytripreal.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import java.util.HashMap;
import java.util.List;


@Mapper
public interface AdminMapper {

    // 어드민회원 로그인
    AdminVo adminLoginMapper(HashMap hashMap);

    // 전체회원목록 가져오기(어드민포함)
    List<AdminVo> getMemberList(ModelMap mm);

    // 전체문의 가져오기
    List<BoardVo> getQnaList(ModelMap mm);

    // 문의내역 상세보기
    BoardVo qnaListViewInfo(HashMap hashMap);

    // 문의내역 - 답변달기
    boolean qnaListViewAnswer(HashMap hashMap);

    // 총 회원수
    int getMemberListCount(ModelMap mm);

    // 총 문의수
    int getQnaListCount(ModelMap mm);

    // 답변완료 문의수
    int getQnaAnswerYnIsY(ModelMap mm);

    // 답변대기 문의수
    int getQnaAnswerYnIsN(ModelMap mm);

    // 오늘 가입한 회원수
    int todayJoinMember(ModelMap mm);


}
