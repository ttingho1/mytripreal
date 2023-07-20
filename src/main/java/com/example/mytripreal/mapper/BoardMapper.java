package com.example.mytripreal.mapper;

import com.example.mytripreal.vo.BoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface BoardMapper {

    // 1:1문의사항 글 등록
    int insertBoardMapper(BoardVo boardVo);

    // 1:1문의사항 등록한글 가져오기
    List<BoardVo> selectMyQna(HashMap hashMap);

    // 문의내역 상세보기
    BoardVo qnaViewInfo(HashMap hashMap);
}
