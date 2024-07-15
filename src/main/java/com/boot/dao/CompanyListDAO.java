package com.boot.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.CompanyListDTO;

//spring boot, mybatis
//는 @mapper 필요 

@Mapper
public interface CompanyListDAO {
	
	//2. 추가
	public  List<CompanyListDTO> company_list(HashMap<String, String> param);
//	company_list: 데이터베이스에서 기업 리스트 정보를 가져오는 메서드입니다.
//	파라미터로 HashMap<String, String>을 받아서 필요한 조건을 전달합니다.
	
	 CompanyListDTO getCompanyById(int id);
	// ID로 회사 조회 / company_content.jsp
	 
	 public  List<CompanyListDTO> RankedBySalary(HashMap<String, String> param);
	 
	 public  List<CompanyListDTO> searchCompany(HashMap<String, String> param);
	

			
		}
			
