package com.example.mytripreal.service;

import com.example.mytripreal.mapper.BoardMapper;
import com.example.mytripreal.vo.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;


    // 마이페이지 - 1:1 문의사항 - 처리(글등록)
    public int insertBoard(BoardVo boardVo){
        int result = 0;
        result = boardMapper.insertBoardMapper(boardVo);
        return result;
    }

    // 마이페이지 - 1:1 문의사항 - 내가 쓴 글 가져오기
    public List<BoardVo> selectMyQna(HashMap hashMap){
        List<BoardVo> boardVo = boardMapper.selectMyQna(hashMap);
        return boardVo;
    }

    // 마이페이지 > 1:1문의 > 문의내역 상세보기
    public BoardVo qnaViewInfoService(HashMap hashMap){
        BoardVo boardVo = boardMapper.qnaViewInfo(hashMap);
        return boardVo;
    }


}
