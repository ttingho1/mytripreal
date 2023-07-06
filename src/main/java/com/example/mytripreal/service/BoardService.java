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
        try{
            result = boardMapper.insertBoardMapper(boardVo);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 마이페이지 - 1:1 문의사항 - 내가 쓴 글 가져오기
    public List<BoardVo> selectMyQna(String userEmail){
        // 기능생성 및 초기화 - 당연히 값들이 없음
        List<BoardVo> boardVo = new ArrayList<>();
        HashMap hashMap = new HashMap();
        try{
            // 세션에있는 userEmail값 담은 userEmail을 hashMap에 잡아넣음
            hashMap.put("userEmail", userEmail);
            // mapper에게 hashMap의 정보를 가지고 값을 전달하고
            boardVo = boardMapper.selectMyQna(hashMap);
             // mapper로부터 가져온 getUserEmail값이 비어있지않으면
            if(boardVo.get(0).getUserEmail() != ""){
                // mapper에서 쿼리를 조회해서 받아온 그 결과값을 boardVo로 받아와서 리턴시켜줘
                return boardVo;
            }

        }catch (Exception e){
            e.printStackTrace();

        }

        return boardVo;
    }




}
