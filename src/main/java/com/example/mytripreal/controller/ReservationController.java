package com.example.mytripreal.controller;

import com.example.mytripreal.service.ReservationService;
import com.example.mytripreal.service.RoomService;
import com.example.mytripreal.service.UserService;
import com.example.mytripreal.vo.ReservationVo;
import com.example.mytripreal.vo.RoomVo;
import com.example.mytripreal.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private UserService userService;


    @GetMapping("reservation")
    public String getPayment(HttpSession session){
        String userSession = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        if(userSession == ""){
            return "/login";
        }
        return "/";
    }

    // go reservation
    @PostMapping("reservation")
    public String getReservationTemp(HttpServletRequest request, HttpSession session, ModelMap mm, HttpServletResponse response) throws IOException {
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        String room_no = request.getParameter("room_no") == null ? "" : request.getParameter("room_no").toString();
        String checkin_date = request.getParameter("checkin_date") == null ? "" : request.getParameter("checkin_date").toString();
        String checkout_date = request.getParameter("checkout_date") == null ? "" : request.getParameter("checkout_date").toString();
//        int nightNum = Integer.parseInt(request.getParameter("nightNum"));

        HashMap hashMap = new HashMap();

        hashMap.put("userEmail", userEmail);
        hashMap.put("room_no", room_no);
        hashMap.put("checkin_date", checkin_date);
        hashMap.put("checkout_date", checkout_date);
//        hashMap.put("nightNum", nightNum);

        reservationService.insertReservationTemp(hashMap);
        RoomVo roomVo = roomService.getRoomInfo(room_no);
        UserVo userVo = userService.getUserInfoByEmail(userEmail);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if(userEmail != ""){
            mm.put("roomVo", roomVo);
            mm.put("userVo", userVo);
            mm.put("checkin_date", checkin_date);
            mm.put("checkout_date", checkout_date);
//            mm.put("nightNum", nightNum);

            return "reservation";
        }
        out.println("<script>alert('로그인이 필요합니다!'); location.href = '/login" + "?returnUrl=/reservation&checkin_date=" + checkin_date + "&checkout_date=" + checkout_date + "';</script>");
        out.flush();
        return null;



    }

    @PostMapping("/payment")
    public String payment(HttpSession session, HttpServletResponse response, HttpServletRequest request, ReservationVo reservationVo) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
//      String confirm_yn = reservationVo.getPay_type() == "1" ? "Y" : "N";
        String reservation_no = request.getParameter("reservation_no") == null ? "" : request.getParameter("reservation_no").toString();
        String room_no = request.getParameter("room_no") == null ? "" : request.getParameter("room_no").toString();
        String userName = request.getParameter("userName") == null ? "" : request.getParameter("userName").toString();
        String hp1 = request.getParameter("hp1") == null ? "" : request.getParameter("hp1").toString();
        String hp2 = request.getParameter("hp2") == null ? "" : request.getParameter("hp2").toString();
        String hp3 = request.getParameter("hp3") == null ? "" : request.getParameter("hp3").toString();
        String etc = request.getParameter("etc") == null ? "" : request.getParameter("etc").toString();
        String pay_type = request.getParameter("pay_type") == null ? "" : request.getParameter("pay_type").toString();
        String pay_total = request.getParameter("pay_total") == null ? "" : request.getParameter("pay_total").toString();
        String checkin_date = request.getParameter("checkin_date") == null ? "" : request.getParameter("checkin_date").toString();
        String checkout_date = request.getParameter("checkout_date") == null ? "" : request.getParameter("checkout_date").toString();
//        int nightNum = Integer.parseInt(request.getParameter("nightNum"));


        HashMap hashMap = new HashMap();

        hashMap.put("reservation_no", reservation_no);
        hashMap.put("room_no", room_no);
        hashMap.put("userEmail", session.getAttribute("userEmail"));
        hashMap.put("userName", userName);
        hashMap.put("hp1", hp1);
        hashMap.put("hp2", hp2);
        hashMap.put("hp3", hp3);
        hashMap.put("etc", etc);
        hashMap.put("pay_type", pay_type);
        hashMap.put("pay_total", pay_total);
        hashMap.put("checkin_date", checkin_date);
        hashMap.put("checkout_date", checkout_date);
//        hashMap.put("nightNum", nightNum);

        /*
        hashMap.put("reservation_no", reservationVo.getReservation_no());*/
        /*ReservationVo reservationVoTemp = reservationService.payment(reservationVo);
        reservationVo.setCheckin_date(reservationVoTemp.getCheckin_date());
        reservationVo.setCheckout_date(reservationVoTemp.getCheckout_date());
        reservationVo.setRoom_no(reservationVoTemp.getRoom_no());
        reservationVo.setPay_total(reservationVoTemp.getPay_total());
        reservationVo.setConfirm_yn(confirm_yn);
        */


        //지금 선택된 방이 선택된 숙박기간안에 아무도 예약을 안했는지 체크

        if(reservationVo.getPay_type() == "1"){
            //신용카드 프로세스 - 만들어야함

            return "/myPage";
        }

        //무통장입금 프로세스
        int result = reservationService.payment(hashMap);

        out.println("<script>alert('예약완료! 1시간안에 입금해주세요!'); location.href = '/myPage';</script>");
        out.flush();
        return null;

    }

    // 사용자에게 예약번호 알려주기
   /*
   @GetMapping("/reservationConfirm")
    public String reservationConfirm(HttpSession session, ModelMap mm){
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        List<ReservationVo> reservationVo = reservationService.getReservationConfirm(userEmail);
        mm.put("reservationVo", reservationVo);
        return "/reservationConfirm";

    }*/


}
