package com.example.mytripreal.mapper;

import com.example.mytripreal.vo.UserVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface UserMapper {

    // 회원가입 - UserVo의 데이터들을 userVo에 담아서 insertUser를 실행시키고 받을거없이 끝내겠다
    int insertUser(UserVo userVo);

    // 로그인 - 서비스로부터 hashMap을 통해 받은 userEmail, password를 가지고
    // id : getUSerLogin을 가진 xml파일에서 쿼리를 조회해서 UserVo로 받을예정(xml에서 던질때 UserVo타입으로 던질 예정 -> xml파일의 resultType)
    UserVo getUserLogin(HashMap hashMap);

    // 회원정보 수정
    int userUpdate(UserVo userVo);

    // 회원정보 한명 가져오기
    UserVo getUserInfo(HashMap hashMap);

    // 이메일 기반 유저 정보 가져오기
    UserVo getUserInfoByEmail(String userEmail);

}
