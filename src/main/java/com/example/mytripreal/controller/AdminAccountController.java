package com.example.mytripreal.controller;


import com.example.mytripreal.service.AdminService;
import com.example.mytripreal.vo.AdminVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;


@Controller
public class AdminAccountController {

    // 서비스로 기능을 사용하기위한 주입
    @Autowired
    private AdminService adminService;

    @Autowired
    private UserAccountController userAccountController;

    // 어드민페이지 직접 요청
    @GetMapping("/admin")
    public String toAdminGet(){
        return "/admin/login";
    }

    // 회원페이지를 통해 어드민 메인페이지 요청하기
    @GetMapping("/admin.do")
    public String toAdminDo(HttpSession session, HttpServletResponse response, String userName) throws IOException {
        String adminSession = (String) session.getAttribute("level");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if(adminSession.equals("1")){
            return "/admin/index";
        }
        out.println("<script>alert('회원 정보를 찾을 수 없습니다.'); location.href = '/admin/login';</script>");
        out.flush();
        return null;

    }

    // 어드민로그인페이지 직접요청
    @GetMapping("/admin/login")
    public String toAdminLogin(){
        return "/admin/login";
    }

    // 로그인페이지 - 처리
    @PostMapping("/admin/adLogin.do")
    public String adminLogin(HttpSession session, String email, String password, HttpServletResponse response) throws IOException {
        HashMap hashMap = new HashMap();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        hashMap.put("email", email);
        hashMap.put("password", password);
        AdminVo adminVo = adminService.adminLoginService(hashMap);

        if(adminVo != null){
            session.setAttribute("email", adminVo.getEmail());
            session.setAttribute("name", adminVo.getName());
            return "/admin/index";
        }
        out.println("<script>alert('회원 정보를 찾을 수 없습니다.'); location.href = 'redirect:/admin/login';</script>");
        out.flush();
        return null;
    }

    // 로그아웃
    @GetMapping("/admin/adLogout.do")
    public String adLogout(HttpSession session){
        session.invalidate();
        return "redirect:/admin";
    }





}
