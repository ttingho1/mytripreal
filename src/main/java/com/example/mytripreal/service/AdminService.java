package com.example.mytripreal.service;

import com.example.mytripreal.mapper.AdminMapper;
import com.example.mytripreal.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;



    // 로그인
    public AdminVo adminLoginService(HashMap hashMap){
        AdminVo adminVo = adminMapper.adminLoginMapper(hashMap);
        return adminVo;
    }

    // 전체회원목록 가져오기(어드민포함)
    public List<AdminVo> getMemberListService(ModelMap mm){
        List<AdminVo> allMemberJoinVo = adminMapper.getMemberList(mm);
        return allMemberJoinVo;
    }

    // 전체문의 가져오기
    public List<BoardVo> getQnaListService(ModelMap mm){
        List<BoardVo> qnaListVo = adminMapper.getQnaList(mm);
        return qnaListVo;
    }

    // 문의내역 보기
    public BoardVo qnaListViewInfoService(HashMap hashMap){
        BoardVo qnaListVo = adminMapper.qnaListViewInfo(hashMap);
        return qnaListVo;
    }

    // 문의내역 - 답변달기(=DB에서는 contentAnswer 컬럼에 글을 수정하는거임)
    public boolean qnaListViewAnswerService(HashMap hashMap){
        adminMapper.qnaListViewAnswer(hashMap);
        return true;

    }

    // 총 회원수
    public int getMemberListCount(ModelMap mm){
        int memResult = 0;
        memResult = adminMapper.getMemberListCount(mm);
        return memResult;
    }

    // 총 문의수
    public int getQnaListCount(ModelMap mm){
        int qnaResult = 0;
        qnaResult = adminMapper.getQnaListCount(mm);
        return qnaResult;
    }

    // 답변완료 문의수
    public int getQnaAnswerYnIsY(ModelMap mm){
        int Yresult = 0;
        Yresult = adminMapper.getQnaAnswerYnIsY(mm);
        return Yresult;
    }

    // 답변대기 문의수
    public int getQnaAnswerYnIsN(ModelMap mm){
        int anNresult = 0;
        anNresult = adminMapper.getQnaAnswerYnIsN(mm);
        return anNresult;
    }

    // 오늘 가입한 회원수
    public int todayJoinMemberService(ModelMap mm){
        int todayJoinResult = 0;
        todayJoinResult = adminMapper.todayJoinMember(mm);
        return todayJoinResult;
    }



}
