package com.example.mytripreal.controller;

import com.example.mytripreal.service.RoomService;
import com.example.mytripreal.vo.RoomVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
public class RoomController {

    @Autowired
    private RoomService roomService;

    // 메인페이지 - 객실미리보기(모든객실가져오기)
    @GetMapping("/")
    public String index(ModelMap mm){
        List<RoomVo> roomVo = roomService.getRoomListService(mm);
        if(roomVo.get(0).getRoom_no() > 0){
            // 서비스에 요청한 모든 객실정보 리스트를 roomVo에 담아서 ModelMap의 변수 mm에 roomVo에 밀어넣겠다(그리고 jsp에서 roomVo로 꺼내쓰겠다)
            mm.put("roomVo", roomVo);
        }
        return "index";
    }


    // 방 상세정보 보기
    @GetMapping("roomDetail")
    public String roomDetail(HttpServletRequest request, ModelMap mm, int room_no){
//      int room_no = Integer.parseInt(request.getParameter("room_no"));
        HashMap hashMap = new HashMap();

        // 사용자가 객실보기버튼을 클릭해서 값을 서비스로 보내기위한 room_no
        hashMap.put("room_no", room_no);
        RoomVo roomVo = roomService.roomDetailService(hashMap);
        // 서비스로부터 받아온 room의 정보를 roomVo에 담음
        mm.put("roomVo", roomVo);

        return "roomDetail";


    }

    // 빈 객실 전체보기
    @GetMapping("reservation")
    public String getRoomEmpty(ModelMap mm, HttpServletResponse response, HttpSession session) {
        String userSession = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        List<RoomVo> roomVo = roomService.getEmptyRoomService(mm);
        mm.put("roomVo", roomVo);

        return "reservation";
    }

    // 최종결제
    @GetMapping("payment")
    public String payment(){

        return "payment";
    }



}
