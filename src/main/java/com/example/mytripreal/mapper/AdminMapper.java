package com.example.mytripreal.mapper;

import com.example.mytripreal.vo.AdminVo;
import com.example.mytripreal.vo.UserVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import java.util.HashMap;


@Mapper
public interface AdminMapper {

    // 로그인
    AdminVo adminLoginMapper(HashMap hashMap);

    // 총 회원수
    int getMemberListCount(ModelMap mm);

    // 총 문의수
    int getQnaListCount(ModelMap mm);

    // 답변완료 문의수
    int getQnaAnswerYnIsY(ModelMap mm);

    // 답변대기 문의수
    int getQnaAnswerYnIsN(ModelMap mm);



}
