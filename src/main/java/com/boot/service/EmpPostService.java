package com.boot.service;

import java.util.HashMap;
import java.util.List;

import com.boot.dto.EmpPostDTO;

public interface EmpPostService {
	
	List<EmpPostDTO> MainEmpPost(HashMap<String, String> param);
	
}