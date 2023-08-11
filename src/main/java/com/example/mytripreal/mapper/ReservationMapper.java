package com.example.mytripreal.mapper;

import com.example.mytripreal.vo.ReservationVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface ReservationMapper {


    /* 객실선택 */
    void insertReservationTemp(HashMap hashMap);

    /* 예약하기 */
    int payment(HashMap hashMap);

    /* 예약번호 확인 */
    List<ReservationVo> getReservationConfirm(String userEmail);

}
