package com.boot.service;

import java.util.HashMap;
import java.util.List;

import com.boot.dto.CompanyListDTO;

public interface CompanyListService {
	
	//2. 추가
	public  List<CompanyListDTO> company_list(HashMap<String, String> param);

	public CompanyListDTO getCompanyById(int id);
	
	public  List<CompanyListDTO> RankedBySalary(HashMap<String, String> param);
	
	public  List<CompanyListDTO> searchCompany(HashMap<String, String> param);
}
