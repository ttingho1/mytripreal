package com.example.mytripreal.controller;


import com.example.mytripreal.service.AdminService;
import com.example.mytripreal.vo.AdminVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;



@Controller
public class adminAccountController {

    // 서비스로 기능을 사용하기위한 주입
    @Autowired
    private AdminService adminService;


    // 메인페이지 - 요청
    @GetMapping("/admin/")
    public String toAdminIndex(HttpSession session){
        // 세션에 담긴 adminYn이 null이 아니면 관리자이고 얘는 admin/index로 바로 넘어갈수 있다
        String checkSession = (String) session.getAttribute("adminYn");
        if(checkSession != null){
            return "/admin/index";
        }
        return "redirect:/admin/login";
    }

    // 로그인페이지 - 요청
    @GetMapping("/admin/login")
    public String toAdminLogin(){
        return "/admin/login";
    }

    // 로그인페이지 - 처리
    @PostMapping("/admin/login")
    public String adminLogin(HttpSession session, String email, String password){
        AdminVo adminVo = adminService.adminLoginService(email, password);
        if(adminVo != null){
            session.setAttribute("email", adminVo.getEmail());
            session.setAttribute("password",adminVo.getPassword());
            session.setAttribute("name", adminVo.getName());
            if(adminVo.getLevel() != null){
                session.setAttribute("adminYn","Y");
            }
            return "redirect:/admin/";
        }
        return "/admin/login";
    }




}
