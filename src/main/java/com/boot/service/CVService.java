package com.boot.service;

import java.util.HashMap;

import com.boot.dto.CVDTO;

public interface CVService {
//	insert
	public void write(CVDTO cv);
//	select
	public CVDTO contentView(HashMap<String, String> param);
//	update
	public void modify(HashMap<String, String> param);
}