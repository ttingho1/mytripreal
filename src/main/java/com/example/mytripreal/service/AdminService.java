package com.example.mytripreal.service;

import com.example.mytripreal.mapper.AdminMapper;
import com.example.mytripreal.vo.AdminVo;
import com.example.mytripreal.vo.BoardVo;
import com.example.mytripreal.vo.UserVo;
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



}
