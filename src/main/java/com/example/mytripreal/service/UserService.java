package com.example.mytripreal.service;

import com.example.mytripreal.mapper.UserMapper;
import com.example.mytripreal.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    // 회원가입
    public int signProcess(UserVo userVo){
        int result = 0;

        try{
            // mapper에 등록된 insertUser함수를 userVo(자바빈) 데이터를 담아서 사용하겠다
            result = userMapper.insertUser(userVo);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    // 로그인
    public UserVo login(String userEmail, String password){ // 서비스로 받은 login(userEmail, password)를 가지고
        UserVo uservo = new UserVo(); // UserVo 초기화
        HashMap hashMap = new HashMap(); // hashmap 초기화
        try{
            // 컨트롤러에서 넘어온 userEmail, password를 DB의 userEmail, password 컬럼에 저장해서 이것을 가지고 DB에 조회를 할거임
            hashMap.put("userEmail", userEmail);
            hashMap.put("password",password); 
            // hashMap에 userEmail, password를 저장해서 맵퍼에있는 getUSerLogin()에게 던져줌
            uservo = userMapper.getUserLogin(hashMap);
            if(uservo.getUserEmail() != ""){
                return uservo;
            }

        }catch (Exception e){
            e.printStackTrace();

        }
        return uservo;
    }

    // 마이페이지 - 회원정보 수정하기전에 기존정보 가져오기
    public UserVo userUpdateDo(String userEmail, String password){
        UserVo userVo = new UserVo();
        HashMap hashMap = new HashMap();
        try{
            hashMap.put("userEmail", userEmail);
            hashMap.put("password", password);
            userVo = userMapper.getUserInfo(hashMap);
            if(userVo.getPassword() != ""){
                return userVo;
            }
        }catch (Exception e){
            e.printStackTrace();

        }
        return userVo;
    }

    // 마이페이지 - 회원정보 수정
    public int userUpdateModify(UserVo userVo){
        int result = 0;
        try {
            result = userMapper.userUpdate(userVo);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }



}
