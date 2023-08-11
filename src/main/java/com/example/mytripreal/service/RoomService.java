package com.example.mytripreal.service;


import com.example.mytripreal.mapper.RoomMapper;

import com.example.mytripreal.vo.RoomVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import java.util.HashMap;
import java.util.List;


@Service
public class RoomService {

    @Autowired
    private RoomMapper roomMapper;



    // 메인페이지 - 객실미리보기
    public List<RoomVo> getRoomListService(ModelMap mm){
        List<RoomVo> roomVo = roomMapper.getRoomList(mm);
        return roomVo;
    }

    // 객실 상세정보 보기
    public RoomVo getRoomInfo(String room_no){
        RoomVo roomVo = roomMapper.getRoomInfo(room_no);
        return roomVo;
    }


    public List<RoomVo> getRoomList(ModelMap mm){
        List<RoomVo> roomVo = roomMapper.getRoomList(mm);
        return roomVo;
    }

    public List<RoomVo> reservationRoomList(HashMap hashMap){
        List<RoomVo> reservationRoomVo = roomMapper.reservationRoomList(hashMap);
        return reservationRoomVo;
    }


}
