package com.boot.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.EmpPostDTO;

//spring boot, mybatis
//는 @mapper 필요 

@Mapper
public interface EmpPostDAO {
	
	List<EmpPostDTO> MainEmpPost(HashMap<String, String> param);
	
//	 CompanyListDTO getCompanyById(int id);
			
}
			
