package com.example.mytripreal.controller;

import com.example.mytripreal.service.UserService;
import com.example.mytripreal.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Controller
public class userAccountController {

    // 서비스로 연결하기위한 선언
    @Autowired
    private UserService userService;

    // 회원가입 페이지 - 요청
    @GetMapping("/sign")
    public String toSignPage(){
        return "sign";
    }

    // 회원가입 페이지 - 처리
    @PostMapping("/sign")
    public String sign(UserVo userVo){
        try {
            // 서비스에 있는 sign함수에 userVo(자바빈)에 담긴 데이터들을 쓰겠다
            int result = userService.signProcess(userVo);
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/404Error";
        }
        return "redirect:/login";
    }

    // 로그인 페이지 - 요청
    @GetMapping("/login")
    public String toLoginPage(HttpSession session){
        String userSession = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        if(userSession != ""){
            return "/";
        }
        return "/login";
    }

    // 로그인 페이지 - 처리
    @PostMapping("/login")
    public String login(HttpSession session, String userEmail, String password) { // 사용자가 입력한 로그인 정보는 userVo를 사용할것이고 이를 세션에 담아서 로그인 인증을 하겠다
        UserVo userVo = userService.login(userEmail, password); // 서비스에 있는 login()에 던져줌
        if (userVo != null) { // 여기부터 DB에서 받아온 userVo이므로 사용자의 모든정보가 있음
            // userVo에서 가져온 email이 비어있지 않으면 세션에 "컬럼"들을 저장하겠다!
            session.setAttribute("userEmail", userVo.getUserEmail());
            session.setAttribute("password", userVo.getPassword());
            session.setAttribute("userName",userVo.getUserName());
            if(userVo.getLevel() != null){
                session.setAttribute("adminYn", "Y"); // 어드민의 Y
            }
            return "redirect:/";
        }

        return "/login";
    }

    // 로그아웃 처리
    // 로그아웃은 DB 갔다오는것 없이 컨트롤러에서 세션을 끊어주기만 하면 됨
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

    // 마이페이지 - 요청 및 처리 (프로필관리)
    // 유저의 정보는 jstl에서 세션에 담긴 정보를 가지고 불러오기 때문에 굳이 DB에 왔다가지않음
    // 만약 주소정보도 가져오려면 DB에서 가져오긴 해야겠지...
    @GetMapping("/myPage")
    public String toMyPage(HttpSession session, String userEmail){
        // (null처리)세션에 userEmail이 비어있으면 login으로..아니면 myPage로
        String userSession = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        if(userSession != ""){
            session.getAttribute("userEmail");
            session.getAttribute("userName");
            session.getAttribute("password");
            return "/myPage";
        }
        return "login";
    }


    // 마이페이지 > 회원정보 수정하기위해 비밀번호 한번더 확인하는 페이지 - 요청
    @GetMapping("userUpdateConfirm")
    public String toUserUpdateConfirm(HttpSession session){
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        if(userEmail != ""){

            return "/userUpdateConfirm";
        }
        return "login";

    }

    // 비밀번호 한번더 확인해서 정보 맞는지 확인해주고 유저정보 불러와주는 페이지
    @PostMapping("/userUpdate")
    public String userUpdate(HttpSession session, ModelMap mm, String password){
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        UserVo userVo = userService.userUpdateDo(userEmail, password);
        if(userVo != null){
            mm.put("userVo", userVo);
            return "userUpdate";
        }
        return "userUpdateConfirm";
    }


    // 마이페이지 - 회원정보 수정 처리
    @PostMapping("userUpdate.do")
    public String userUpdateCont(UserVo userVo, HttpSession session){
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        String userName = (String) session.getAttribute("userName");
        try{
            if(userEmail != ""){
                // userVo에 이미 알고있는 userEmail 넣기
                userVo.setUserEmail(userEmail);
                userVo.setUserName(userName);
                int result = userService.userUpdateModify(userVo);

            }
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/404Error";
        }
        return "redirect:/myPage";
    }






    // 마이페이지 - 요청 (1:1문의)
    @GetMapping("/qna")
    public String toQna(HttpSession session){
        String userSession = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        if(userSession != ""){
            return "/qna";
        }
        return "login";
    }
    





}
