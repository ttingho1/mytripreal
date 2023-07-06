package com.example.mytripreal.controller;

import com.example.mytripreal.service.BoardService;
import com.example.mytripreal.service.UserService;
import com.example.mytripreal.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    private UserService userService;

    @Autowired
    private BoardService boardService;

    // 마이페이지 - 1:1 문의사항 - 페이지 요청(나의문의내역 모두불러오기)
    @GetMapping("/qna")
    public String toQna(HttpSession session, ModelMap mm){
        // 세션에 있는 userEmail의 정보를 조회해서 userEmail에 담음
        String userEmail = session.getAttribute("userEmail") == null ? "" : session.getAttribute("userEmail").toString();
        // 세션정보를 가지고있는 userEmail을  selectMyQna()에게 쥐어주고 boardService로 던져서 그 결과값을 boardVo에 담음
        // 받아온 데이터가 여러개이므로 List<>에 담아야한다
        List<BoardVo> boardVo = boardService.selectMyQna(userEmail);
        // 문의사항들을 담은 boardVo에서 0번째글의 이메일을 가져왔을때 비어있지 않으면
        if(boardVo.get(0).getUserEmail() != ""){
            // boardVo에 있는정보를 ModelMap의 변수 mm에 담아서 jsp로 넘겨라
            mm.put("boardVo", boardVo);
            return "/qna";
        }
        return "login";
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




    // (임시) 글 자세히 보기(qnaView)
    @GetMapping("/qnaView")
    public String qnaList(){
        return "/qnaView";
    }
}
