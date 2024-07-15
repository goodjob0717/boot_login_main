package com.boot.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.MainDTO;

//spring boot, mybatis
//는 @mapper 필요 

@Mapper
public interface MainDAO {
	
	List<MainDTO> MainMyPage(HashMap<String, String> param);
	
			
}
			
