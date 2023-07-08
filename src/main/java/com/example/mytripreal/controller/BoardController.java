package com.example.mytripreal.controller;

import com.example.mytripreal.service.BoardService;
import com.example.mytripreal.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 마이페이지 - 1:1 문의사항 - 페이지 요청(나의문의내역 모두불러오기)
    @GetMapping("/qna")
    public String toQna(HttpSession session, ModelMap mm){
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        HashMap hashMap = new HashMap();

        hashMap.put("userEmail", userEmail);
        List<BoardVo> boardVo = boardService.selectMyQna(hashMap);
        if(boardVo.get(0).getUserEmail() != ""){
            mm.put("boardVo", boardVo);
            return "/qna";
        }
        return "redirect:/login";
    }

    // 마이페이지 - 1:1 문의사항 - 문의글등록(처리)
    @PostMapping("qnaInsert.do")
    public String insertBoard(BoardVo boardVo, HttpSession session){
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        try{
            if(userEmail != ""){
                boardVo.setUserEmail(userEmail);
                int result = boardService.insertBoard(boardVo);

            }
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/404Error";
        }
        return "redirect:/qna";
    }


    // 마이페이지 > 1:1문의 > 문의내역 상세보기
    @GetMapping("/qnaView")
    public String qnaViewInfo(ModelMap mm, int num){
        HashMap hashMap = new HashMap();

        hashMap.put("num", num);
        BoardVo boardVo = boardService.qnaViewInfoService(hashMap);
        if(boardVo.getNum() >= 0){
            mm.put("boardVo", boardVo);
            return "/qnaView";
        }
        return "redirect:/login";
    }
}
