package com.example.mytripreal;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class test {

    // 메인페이지 - 유저
    @GetMapping("/")
    public String index(){
        return "index";
    }



}
