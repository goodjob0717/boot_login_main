package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

import com.boot.dto.MyPageDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface MyPageDAO {
	public ArrayList<MyPageDTO> list1();
	public ArrayList<MyPageDTO> list_cv();
	public ArrayList<MyPageDTO> list_apply();
	public MyPageDTO contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
















