package com.example.mytripreal.controller;


import com.example.mytripreal.service.AdminService;
import com.example.mytripreal.vo.AdminVo;
import com.example.mytripreal.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;


@Controller
public class AdminController {

    // 서비스로 기능을 사용하기위한 주입
    @Autowired
    private AdminService adminService;


    // 어드민페이지 직접 요청
    @GetMapping("/admin")
    public String toAdminGet(HttpSession session, ModelMap mm){
        String level = session.getAttribute("level") == null ? "" : session.getAttribute("level").toString();
        if(level == ""){
            return "/admin/login";
        }

        // 총 회원수
        int memResult = adminService.getMemberListCount(mm);
        mm.addAttribute("memResult", memResult);
        // 총 문의수
        int qnaResult = adminService.getQnaListCount(mm);
        mm.addAttribute("qnaResult", qnaResult);
        // 답변완료 문의수
        int Yresult = adminService.getQnaAnswerYnIsY(mm);
        mm.addAttribute("Yresult", Yresult);
        // 답변대기 문의수
        int Nresult = adminService.getQnaAnswerYnIsN(mm);
        mm.addAttribute("Nresult", Nresult);
        // 오늘가입한 회원수
        int todayJoinResult = adminService.todayJoinMemberService(mm);
        mm.addAttribute("todayJoinResult", todayJoinResult);

        return "/admin/index";
    }

    // 어드민로그인페이지 직접요청
    @GetMapping("/admin/login")
    public String toAdminLogin(){
        return "/admin/login";
    }

    // 로그인페이지 - 처리
    @PostMapping("/admin")
    public String adminLogin(HttpSession session, String userEmail, String password, HttpServletResponse response) throws IOException {
        HashMap hashMap = new HashMap();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        hashMap.put("userEmail", userEmail);
        hashMap.put("password", password);
        AdminVo adminVo = adminService.adminLoginService(hashMap);

        if(adminVo != null){
            session.setAttribute("userEmail", adminVo.getUserEmail());
            session.setAttribute("userName", adminVo.getUserName());
            session.setAttribute("level", adminVo.getLevel());
            return "redirect:/admin";
        }

        out.println("<script>alert('회원 정보를 찾을 수 없습니다.'); location.href = 'redirect:/admin';</script>");
        out.flush();
        return null;
    }

    // 로그아웃
    @GetMapping("/admin/adLogout")
    public String adLogout(HttpSession session){
        session.invalidate();
        return "redirect:/admin";
    }

    // 회원관리 - 모든회원 가져오기
    @GetMapping("/admin/memberList")
    public String memberList(HttpSession session, ModelMap mm){
        String level = session.getAttribute("level") == null ? "" : session.getAttribute("level").toString();
        if(level == ""){
            return "/admin/login";
        }

        List<AdminVo> allMemberJoinVo = adminService.getMemberListService(mm);
        if(allMemberJoinVo.get(0).getLevel() != ""){
            mm.put("allMemberJoinVo", allMemberJoinVo);
            return "/admin/memberList";
        }
        return "/admin/login";
    }

    // 문의관리 - 모든문의 가져오기
    @GetMapping("/admin/qnaList")
    public String qnaList(HttpSession session, ModelMap mm){
        String level = session.getAttribute("level") == null ? "" : session.getAttribute("level").toString();
        if(level == ""){
            return "/admin/login";
        }
        List<BoardVo> qnaListVo = adminService.getQnaListService(mm);
        if(qnaListVo.get(0).getNum() > 0){
            mm.put("qnaListVo", qnaListVo);
            return "/admin/qnaList";
        }
        return "/admin/login";
    }

    // 문의관리 - 글보기
    @GetMapping("/admin/qnaListView")
    public String qnaViewInfo(ModelMap mm, int num){
        HashMap hashMap = new HashMap();

        hashMap.put("num", num);
        BoardVo qnaListVo = adminService.qnaListViewInfoService(hashMap);
        if(qnaListVo.getNum() > 0){
            mm.put("qnaListVo", qnaListVo);
            return "/admin/qnaListView";
        }
        return "redirect:/admin/login";
    }


    // 문의관리 - 답변달기
    @PostMapping("/admin/qnaAnswer")
    public String qnaAnswer(HttpSession session, int num, String answerAdmin, String userName, String contentAnswer, HttpServletResponse response) throws IOException {
        String level = session.getAttribute("level") == null ? "" : session.getAttribute("level").toString();
        HashMap hashMap = new HashMap();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();


        if(level != ""){
            hashMap.put("num", num);
            hashMap.put("contentAnswer", contentAnswer);
            hashMap.put("answerAdmin", answerAdmin);

            adminService.qnaListViewAnswerService(hashMap);
            out.println("<script>alert('답변이 등록되었습니다.'); location.href = '/admin/qnaListView?num=" + num + "';</script>");
            out.flush();
            return null;
        }
        out.println("<script>alert('잘못된 접근입니다.'); location.href = '/admin/login';</script>");
        out.flush();
        return null;

    }










}
