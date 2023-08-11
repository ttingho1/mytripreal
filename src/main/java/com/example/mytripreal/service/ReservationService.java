package com.example.mytripreal.service;

import com.example.mytripreal.mapper.ReservationMapper;
import com.example.mytripreal.vo.ReservationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ReservationService {

    @Autowired
    private ReservationMapper reservationMapper;

    /* 객실선택 */
    public void insertReservationTemp(HashMap hashMap){
        reservationMapper.insertReservationTemp(hashMap);
    }

    /* 예약하기 */
    public int payment(HashMap hashMap){
        int result = 0;
        result = reservationMapper.payment(hashMap);
        return result;
    }

    /* 예약번호 확인 */
    public List<ReservationVo> getReservationConfirm(String userEmail){
        List<ReservationVo> reservationVo = reservationMapper.getReservationConfirm(userEmail);
        return reservationVo;
    }
}
