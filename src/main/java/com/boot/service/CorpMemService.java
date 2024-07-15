package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.CorpMemDTO;

// 나성엽

public interface CorpMemService {
	public ArrayList<CorpMemDTO> loginyn(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
	public boolean checkCorpId(String corpId);
}