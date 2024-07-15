package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.UserMemDTO;

//나성엽

public interface UserMemService {
	public ArrayList<UserMemDTO> loginyn(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
	public boolean checkUserId(String userId);
}