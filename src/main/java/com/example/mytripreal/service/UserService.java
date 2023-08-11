package com.example.mytripreal.service;

import com.example.mytripreal.mapper.UserMapper;
import com.example.mytripreal.vo.ReservationVo;
import com.example.mytripreal.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    // 회원가입
    public int signProcess(UserVo userVo){
        int result = 0;
        result = userMapper.insertUser(userVo);
        return result;
    }

    // 로그인
    public UserVo login(HashMap hashMap) {
        UserVo userVo = userMapper.getUserLogin(hashMap);
        return userVo;
    }

    // 마이페이지 - 회원정보 수정하기전에 기존정보 가져오기
    public UserVo userUpdateDo(HashMap hashMap){
        UserVo userVo = userMapper.getUserInfo(hashMap);
        return userVo;
    }

    public UserVo getUserInfoByEmail(String userEmail){
        UserVo userVo = userMapper.getUserInfoByEmail(userEmail);
        return userVo;
    }

    // 마이페이지 - 회원정보 수정
    public int userUpdateModify(UserVo userVo){
        int result = 0;
        result = userMapper.userUpdate(userVo);
        return result;
    }

    // 마이페이지 - 나의예약내역 보기
    public List<ReservationVo> getMyReservation(String userEmail){
        List<ReservationVo> reservationVo = userMapper.getMyReservation(userEmail);
        return reservationVo;
    }




}
