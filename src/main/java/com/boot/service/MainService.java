package com.boot.service;

import java.util.HashMap;
import java.util.List;

import com.boot.dto.CompanyListDTO;
import com.boot.dto.EmpPostDTO;
import com.boot.dto.MainDTO;

public interface MainService {
	
	public  List<MainDTO> MainMyPage(HashMap<String, String> param);
	
}