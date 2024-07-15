package com.boot.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.CVDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface CVDAO {
//	insert
	public void write(CVDTO cv);
//	update
	public void modify(HashMap<String, String> param);
//	select
	public CVDTO contentView(HashMap<String, String> param);
}