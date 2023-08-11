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
    public String roomDetail(HttpServletRequest request, ModelMap mm, String room_no){
//      int room_no = Integer.parseInt(request.getParameter("room_no"));

        RoomVo roomVo = roomService.getRoomInfo(room_no);
        // 서비스로부터 받아온 room의 정보를 roomVo에 담음
        mm.put("roomVo", roomVo);

        return "roomDetail";

    }

    // 빈 객실 전체보기 (기본날짜 - 로딩시)
    @GetMapping("roomList")
    public String getRoomList(ModelMap mm, HttpSession session, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String userSession = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();

        if(userSession != ""){
            List<RoomVo> roomVo = roomService.getRoomList(mm);
            mm.put("roomVo", roomVo);
            return "roomList";
        }
        out.println("<script>alert('로그인이 필요합니다!'); location.href = '/login';</script>");
        out.flush();
        return null;

    }

    // 예약안된 객실만 보기 (테스트중)
    @GetMapping("roomSearch")
    public String reservationRoomList(ModelMap mm, HttpServletRequest request) throws IOException {
        String checkin_date = request.getParameter("checkin_date") == null ? "" : request.getParameter("checkin_date");
        String checkout_date = request.getParameter("checkout_date") == null ? "" : request.getParameter("checkout_date");

        HashMap hashMap = new HashMap();
        hashMap.put("checkin_date", checkin_date);
        hashMap.put("checkout_date", checkout_date);

        List<RoomVo> roomVo = roomService.reservationRoomList(hashMap);
        mm.put("roomVo", roomVo);


        return "roomList";
    }






}
