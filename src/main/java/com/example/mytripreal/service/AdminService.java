package com.example.mytripreal.service;

import com.example.mytripreal.mapper.AdminMapper;
import com.example.mytripreal.vo.AdminVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;


    // 로그인
    public AdminVo adminLoginService(HashMap hashMap){
        AdminVo adminVo = adminMapper.adminLoginMapper(hashMap);
        return adminVo;
    }
}
