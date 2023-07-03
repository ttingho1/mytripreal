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
    public AdminVo adminLoginService(String email, String password){
        AdminVo adminVo = new AdminVo();
        HashMap hashMap = new HashMap();
        try{
            // 컨트롤러부터 받은 정보를 저장해서 맵퍼로 던져줌
            hashMap.put("email", email);
            hashMap.put("password", password);
            // adminVo에 맵퍼에서 던져주는 값을 여기로 받음
            adminVo = adminMapper.adminLoginMapper(hashMap);
            if(adminVo.getEmail() != ""){
                return adminVo;
            }

        }catch (Exception e){
            e.printStackTrace();

        }
        return adminVo;
    }
}
