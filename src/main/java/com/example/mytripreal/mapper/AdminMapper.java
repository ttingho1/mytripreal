package com.example.mytripreal.mapper;

import com.example.mytripreal.vo.AdminVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;


@Mapper
public interface AdminMapper {

    AdminVo adminLoginMapper(HashMap hashMap);

}
