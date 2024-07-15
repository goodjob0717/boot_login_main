package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.boot.dto.MyPageDTO;

public interface MyPageService {
	public ArrayList<MyPageDTO> list1();
	public ArrayList<MyPageDTO> list_cv();
	public ArrayList<MyPageDTO> list_apply();
	public MyPageDTO contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
