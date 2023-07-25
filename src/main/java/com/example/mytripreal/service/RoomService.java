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
    public RoomVo roomDetailService(HashMap hashMap){
        RoomVo roomVo = roomMapper.getRoomInfo(hashMap);
        return roomVo;
    }

    // 빈 객실 모두 불러오기(결제확정여부 N)
    public List<RoomVo> getEmptyRoomService(ModelMap mm){
        List<RoomVo> roomVo = roomMapper.getEmptyRoom(mm);
        return roomVo;
    }
}
