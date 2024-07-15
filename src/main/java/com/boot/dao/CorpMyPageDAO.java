package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.CorpMyPageDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface CorpMyPageDAO {
	public ArrayList<CorpMyPageDTO> list();
	public ArrayList<CorpMyPageDTO> list_corp();
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
















