package com.example.mytripreal.controller;

import com.example.mytripreal.service.UserService;
import com.example.mytripreal.vo.UserVo;
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


@Controller
public class UserAccountController {

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
    public String login(String userEmail, String password, HttpSession session, HttpServletResponse response) throws IOException {
        HashMap hashMap = new HashMap();
        UserVo userVo = new UserVo();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        hashMap.put("userEmail", userEmail);
        hashMap.put("password",password);
        userVo = userService.login(hashMap);
        if(userVo != null){
            session.setAttribute("userEmail", userVo.getUserEmail());
            session.setAttribute("userName", userVo.getUserName());
            session.setAttribute("level", userVo.getLevel());
            return "redirect:/";
        }

        out.println("<script>alert('회원 정보를 찾을 수 없습니다.'); location.href = '/login';</script>");
        out.flush();
        return null;

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
    public String toMyPage(HttpSession session, String userEmail, HttpServletResponse response) throws IOException {
        // (null처리)세션에 userEmail이 비어있으면 login으로..아니면 myPage로
        String userSession = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if(userSession != ""){
            session.getAttribute("userEmail");
            session.getAttribute("userName");
            session.getAttribute("password");
            return "/myPage";
        }
        out.println("<script>alert('잘못된 접근입니다.'); location.href = '/login';</script>");
        out.flush();
        return null;

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

    // 마이페이지 - 비밀번호변경을 위한 비밀번호 한번 더 확인 페이지 - 처리
    @PostMapping("/userUpdate")
    public String userUpdate(HttpSession session, ModelMap mm, String password, HttpServletResponse response) throws  IOException{
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        UserVo userVo = new UserVo();
        HashMap hashMap = new HashMap();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        //session.setAttribute("userEmail", userEmail);
        hashMap.put("userEmail", userEmail);
        hashMap.put("password", password);
        userVo = userService.userUpdateDo(hashMap);

        if(userVo != null){
            mm.put("userVo", userVo);
            return "userUpdate";
        }
        out.println("<script>alert('비밀번호가 일치하지않습니다.'); location.href = '/userUpdateConfirm';</script>");
        out.flush();
        return null;
    }


    // 마이페이지 - 회원정보 수정페이지 - 처리
    @PostMapping("userUpdate.do")
    public String userUpdateCont(UserVo userVo, HttpSession session, HttpServletResponse response) throws IOException {
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        String userName = (String) session.getAttribute("userName");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

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
        out.println("<script>alert('비밀번호변경 성공!'); location.href = '/myPage';</script>");
        out.flush();
        return null;
    }




    





}
